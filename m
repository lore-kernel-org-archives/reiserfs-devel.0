From: Jeff Mahoney <jeffm@suse.com>
Subject: [patch 08/29] reiserfs: cleanup, remove leading whitespace from labels
Date: Wed, 23 Apr 2014 10:00:41 -0400
Message-ID: <20140423151140.078185401@suse.com>
References: <20140423140033.704113918@suse.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline; filename=reiserfs/reiserfs-cleanup-remove-leading-whitespace-from-labels
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ReiserFS Development List <reiserfs-devel@vger.kernel.org>
Cc: Jan Kara <jack@suse.cz>, Dave Jones <davej@redhat.com>

This patch moves reiserfs closer to adhering to the style rules by
removing leading whitespace from labels.

Signed-off-by: Jeff Mahoney <jeffm@suse.com>
---
 fs/reiserfs/bitmap.c    |    4 ++--
 fs/reiserfs/dir.c       |    2 +-
 fs/reiserfs/file.c      |    4 ++--
 fs/reiserfs/fix_node.c  |    2 +-
 fs/reiserfs/inode.c     |   48 ++++++++++++++++++++++++------------------------
 fs/reiserfs/ioctl.c     |    4 ++--
 fs/reiserfs/journal.c   |   36 ++++++++++++++++++------------------
 fs/reiserfs/namei.c     |   14 +++++++-------
 fs/reiserfs/stree.c     |   14 +++++++-------
 fs/reiserfs/xattr.c     |    2 +-
 fs/reiserfs/xattr_acl.c |    6 +++---
 11 files changed, 68 insertions(+), 68 deletions(-)

--- a/fs/reiserfs/bitmap.c
+++ b/fs/reiserfs/bitmap.c
@@ -167,7 +167,7 @@ static int scan_bitmap_block(struct reis
 		return 0;
 
 	while (1) {
-	      cont:
+cont:
 		if (bi->free_count < min) {
 			brelse(bh);
 			return 0;	/* No free blocks in this bitmap */
@@ -409,7 +409,7 @@ static int scan_bitmap(struct reiserfs_t
 	nr_allocated =
 	    scan_bitmap_block(th, bm, &off, end_off + 1, min, max, unfm);
 
-      ret:
+ret:
 	*start = bm * off_max + off;
 	return nr_allocated;
 
--- a/fs/reiserfs/dir.c
+++ b/fs/reiserfs/dir.c
@@ -89,7 +89,7 @@ int reiserfs_readdir_inode(struct inode
 
 	path_to_entry.reada = PATH_READA;
 	while (1) {
-	      research:
+research:
 		/*
 		 * search the directory item, containing entry with
 		 * specified key
--- a/fs/reiserfs/file.c
+++ b/fs/reiserfs/file.c
@@ -114,7 +114,7 @@ static int reiserfs_file_release(struct
 		 */
 		err = reiserfs_truncate_file(inode, 0);
 	}
-      out:
+out:
 	reiserfs_write_unlock(inode->i_sb);
 	mutex_unlock(&(REISERFS_I(inode)->tailpack));
 	return err;
@@ -228,7 +228,7 @@ int reiserfs_commit_page(struct inode *i
 	}
 	if (logit) {
 		ret = journal_end(&th);
-	      drop_write_lock:
+drop_write_lock:
 		reiserfs_write_unlock(s);
 	}
 	/*
--- a/fs/reiserfs/fix_node.c
+++ b/fs/reiserfs/fix_node.c
@@ -2714,7 +2714,7 @@ int fix_nodes(int op_mode, struct tree_b
 		goto repeat;
 	}
 
-      repeat:
+repeat:
 	/*
 	 * fix_nodes was unable to perform its calculation due to
 	 * filesystem got changed under us, lack of free disk space or i/o
--- a/fs/reiserfs/inode.c
+++ b/fs/reiserfs/inode.c
@@ -449,7 +449,7 @@ static int _get_block_create_0(struct in
 	flush_dcache_page(bh_result->b_page);
 	kunmap(bh_result->b_page);
 
-      finished:
+finished:
 	pathrelse(&path);
 
 	if (result == IO_ERROR)
@@ -558,7 +558,7 @@ static int reiserfs_get_blocks_direct_io
 		if (err < 0)
 			ret = err;
 	}
-      out:
+out:
 	return ret;
 }
 
@@ -626,12 +626,12 @@ static int convert_tail_for_hole(struct
 
 	retval = reiserfs_commit_write(NULL, tail_page, tail_start, tail_end);
 
-      unlock:
+unlock:
 	if (tail_page != hole_page) {
 		unlock_page(tail_page);
 		page_cache_release(tail_page);
 	}
-      out:
+out:
 	return retval;
 }
 
@@ -727,7 +727,7 @@ int reiserfs_get_block(struct inode *ino
 	/* set the key of the first byte in the 'block'-th block of file */
 	make_cpu_key(&key, inode, new_offset, TYPE_ANY, 3 /*key length */ );
 	if ((new_offset + inode->i_sb->s_blocksize - 1) > inode->i_size) {
-	      start_trans:
+start_trans:
 		th = reiserfs_persistent_transaction(inode->i_sb, jbegin_count);
 		if (!th) {
 			retval = -ENOMEM;
@@ -735,7 +735,7 @@ int reiserfs_get_block(struct inode *ino
 		}
 		reiserfs_update_inode_transaction(inode);
 	}
-      research:
+research:
 
 	retval = search_for_position_by_key(inode->i_sb, &key, &path);
 	if (retval == IO_ERROR) {
@@ -1143,7 +1143,7 @@ int reiserfs_get_block(struct inode *ino
 
 	retval = 0;
 
-      failure:
+failure:
 	if (th && (!dangle || (retval && !th->t_trans_id))) {
 		int err;
 		if (th->t_trans_id)
@@ -2137,7 +2137,7 @@ int reiserfs_new_inode(struct reiserfs_t
 
 	return 0;
 
-      out_bad_inode:
+out_bad_inode:
 	/* Invalidate the object, nothing was inserted yet */
 	INODE_PKEY(inode)->k_objectid = 0;
 
@@ -2146,7 +2146,7 @@ int reiserfs_new_inode(struct reiserfs_t
 	dquot_free_inode(inode);
 	reiserfs_write_lock_nested(inode->i_sb, depth);
 
-      out_end_trans:
+out_end_trans:
 	journal_end(th);
 	/*
 	 * Drop can be outside and it needs more credits so it's better
@@ -2158,7 +2158,7 @@ int reiserfs_new_inode(struct reiserfs_t
 	inode->i_flags |= S_NOQUOTA;
 	make_bad_inode(inode);
 
-      out_inserted_sd:
+out_inserted_sd:
 	clear_nlink(inode);
 	th->t_trans_id = 0;	/* so the caller can't use this handle later */
 	unlock_new_inode(inode); /* OK to do even if we hadn't locked it */
@@ -2245,10 +2245,10 @@ static int grab_tail_page(struct inode *
 	*bh_result = bh;
 	*page_result = page;
 
-      out:
+out:
 	return error;
 
-      unlock:
+unlock:
 	unlock_page(page);
 	page_cache_release(page);
 	return error;
@@ -2350,7 +2350,7 @@ int reiserfs_truncate_file(struct inode
 	reiserfs_write_unlock(inode->i_sb);
 
 	return 0;
-      out:
+out:
 	if (page) {
 		unlock_page(page);
 		page_cache_release(page);
@@ -2393,11 +2393,11 @@ static int map_block_for_writepage(struc
 	}
 
 	kmap(bh_result->b_page);
-      start_over:
+start_over:
 	reiserfs_write_lock(inode->i_sb);
 	make_cpu_key(&key, inode, byte_offset, TYPE_ANY, 3);
 
-      research:
+research:
 	retval = search_for_position_by_key(inode->i_sb, &key, &path);
 	if (retval != POSITION_FOUND) {
 		use_get_block = 1;
@@ -2477,7 +2477,7 @@ static int map_block_for_writepage(struc
 	}
 	retval = 0;
 
-      out:
+out:
 	pathrelse(&path);
 	if (trans_running) {
 		int err = journal_end(&th);
@@ -2675,7 +2675,7 @@ static int reiserfs_write_full_page(stru
 	} while (bh != head);
 
 	error = 0;
-      done:
+done:
 	if (nr == 0) {
 		/*
 		 * if this page only had a direct item, it is very possible for
@@ -2697,7 +2697,7 @@ static int reiserfs_write_full_page(stru
 	}
 	return error;
 
-      fail:
+fail:
 	/*
 	 * catches various errors, we need to make sure any valid dirty blocks
 	 * get to the media.  The page is currently locked and not marked for
@@ -2969,7 +2969,7 @@ static int reiserfs_write_end(struct fil
 			goto out;
 	}
 
-      out:
+out:
 	if (locked)
 		reiserfs_write_unlock(inode->i_sb);
 	unlock_page(page);
@@ -2980,7 +2980,7 @@ static int reiserfs_write_end(struct fil
 
 	return ret == 0 ? copied : ret;
 
-      journal_error:
+journal_error:
 	reiserfs_write_unlock(inode->i_sb);
 	locked = false;
 	if (th) {
@@ -3054,10 +3054,10 @@ int reiserfs_commit_write(struct file *f
 			goto out;
 	}
 
-      out:
+out:
 	return ret;
 
-      journal_error:
+journal_error:
 	if (th) {
 		if (!update_sd)
 			reiserfs_update_sd(th, inode);
@@ -3163,7 +3163,7 @@ static int invalidatepage_can_drop(struc
 		    && jl != SB_JOURNAL(inode->i_sb)->j_current_jl)
 			ret = 0;
 	}
-      free_jh:
+free_jh:
 	if (ret && bh->b_private) {
 		reiserfs_free_jh(bh);
 	}
@@ -3222,7 +3222,7 @@ static void reiserfs_invalidatepage(stru
 		ret = try_to_release_page(page, 0);
 		/* maybe should BUG_ON(!ret); - neilb */
 	}
-      out:
+out:
 	return;
 }
 
--- a/fs/reiserfs/ioctl.c
+++ b/fs/reiserfs/ioctl.c
@@ -219,11 +219,11 @@ int reiserfs_unpack(struct inode *inode,
 	retval = reiserfs_commit_write(NULL, page, write_from, write_from);
 	REISERFS_I(inode)->i_flags |= i_nopack_mask;
 
-      out_unlock:
+out_unlock:
 	unlock_page(page);
 	page_cache_release(page);
 
-      out:
+out:
 	mutex_unlock(&inode->i_mutex);
 	reiserfs_write_unlock(inode->i_sb);
 	return retval;
--- a/fs/reiserfs/journal.c
+++ b/fs/reiserfs/journal.c
@@ -160,7 +160,7 @@ static struct reiserfs_bitmap_node *get_
 	struct list_head *entry = journal->j_bitmap_nodes.next;
 
 	journal->j_used_bitmap_nodes++;
-      repeat:
+repeat:
 
 	if (entry != &journal->j_bitmap_nodes) {
 		bn = list_entry(entry, struct reiserfs_bitmap_node, list);
@@ -757,7 +757,7 @@ static inline int __add_jh(struct reiser
 		jh = bh->b_private;
 		list_del_init(&jh->list);
 	} else {
-	      no_jh:
+no_jh:
 		get_bh(bh);
 		jh = alloc_jh();
 		spin_lock(&j->j_dirty_buffers_lock);
@@ -836,7 +836,7 @@ static int write_ordered_buffers(spinloc
 			reiserfs_free_jh(bh);
 			unlock_buffer(bh);
 		}
-	      loop_next:
+loop_next:
 		put_bh(bh);
 		cond_resched_lock(lock);
 	}
@@ -891,7 +891,7 @@ static int flush_older_commits(struct su
 	unsigned int other_trans_id;
 	unsigned int first_trans_id;
 
-      find_first:
+find_first:
 	/*
 	 * first we walk backwards to find the oldest uncommitted transation
 	 */
@@ -1153,7 +1153,7 @@ static int flush_commit_list(struct supe
 		atomic_set(&(jl->j_older_commits_done), 1);
 	}
 	mutex_unlock(&jl->j_commit_mutex);
-      put_jl:
+put_jl:
 	put_journal_list(s, jl);
 
 	if (retval)
@@ -1306,7 +1306,7 @@ static int flush_older_journal_lists(str
 	 * we know we are the only ones flushing things, no extra race
 	 * protection is required.
 	 */
-      restart:
+restart:
 	entry = journal->j_journal_list.next;
 	/* Did we wrap? */
 	if (entry == &journal->j_journal_list)
@@ -1504,7 +1504,7 @@ static int flush_journal_list(struct sup
 					 (unsigned long long)saved_bh->
 					 b_blocknr, __func__);
 		}
-	      free_cnode:
+free_cnode:
 		last = cn;
 		cn = cn->next;
 		if (saved_bh) {
@@ -1564,7 +1564,7 @@ static int flush_journal_list(struct sup
 		reiserfs_abort(s, -EIO,
 			       "Write error while pushing transaction to disk in %s",
 			       __func__);
-      flush_older_and_return:
+flush_older_and_return:
 
 	/*
 	 * before we can update the journal header block, we _must_ flush all
@@ -1670,7 +1670,7 @@ static int write_one_transaction(struct
 			}
 			put_bh(tmp_bh);
 		}
-	      next:
+next:
 		cn = cn->next;
 		cond_resched();
 	}
@@ -1770,7 +1770,7 @@ static int kupdate_transactions(struct s
 		write_chunk(&chunk);
 	}
 
-      done:
+done:
 	mutex_unlock(&journal->j_flush_mutex);
 	return ret;
 }
@@ -2229,7 +2229,7 @@ static int journal_read_transaction(stru
 			reiserfs_warning(sb, "journal-1204",
 					 "REPLAY FAILURE fsck required! "
 					 "Trying to replay onto a log block");
-		      abort_replay:
+abort_replay:
 			brelse_array(log_blocks, i);
 			brelse_array(real_blocks, i);
 			brelse(c_bh);
@@ -2491,7 +2491,7 @@ static int journal_read(struct super_blo
 		brelse(d_bh);
 	}
 
-      start_log_replay:
+start_log_replay:
 	cur_dblock = oldest_start;
 	if (oldest_trans_id) {
 		reiserfs_debug(sb, REISERFS_DEBUG_CODE,
@@ -2892,7 +2892,7 @@ int journal_init(struct super_block *sb,
 	INIT_DELAYED_WORK(&journal->j_work, flush_async_commits);
 	journal->j_work_sb = sb;
 	return 0;
-      free_and_return:
+free_and_return:
 	free_journal_ram(sb);
 	return 1;
 }
@@ -3031,7 +3031,7 @@ static int do_journal_begin_r(struct rei
 	th->t_refcount = 1;
 	th->t_super = sb;
 
-      relock:
+relock:
 	lock_journal(sb);
 	if (join != JBEGIN_ABORT && reiserfs_is_journal_aborted(journal)) {
 		unlock_journal(sb);
@@ -3122,7 +3122,7 @@ static int do_journal_begin_r(struct rei
 	INIT_LIST_HEAD(&th->t_list);
 	return 0;
 
-      out_fail:
+out_fail:
 	memset(th, 0, sizeof(*th));
 	/*
 	 * Re-set th->t_super, so we can properly keep track of how many
@@ -3876,7 +3876,7 @@ static int __commit_trans_jl(struct inod
 		 * the inode still exists.  We know the list is still around
 		 * if we've got a larger transaction id than the oldest list
 		 */
-	      flush_commit_only:
+flush_commit_only:
 		if (journal_list_still_alive(inode->i_sb, id)) {
 			/*
 			 * we only set ret to 1 when we know for sure
@@ -4302,7 +4302,7 @@ static int do_journal_end(struct reiserf
 	 * transactions that might get overwritten.  If any journal lists
 	 * are very old flush them as well.
 	 */
-      first_jl:
+first_jl:
 	list_for_each_safe(entry, safe, &journal->j_journal_list) {
 		temp_jl = JOURNAL_LIST_ENTRY(entry);
 		if (journal->j_start <= temp_jl->j_start) {
@@ -4359,7 +4359,7 @@ static int do_journal_end(struct reiserf
 	    journal_list_still_alive(sb, commit_trans_id)) {
 		flush_commit_list(sb, jl, 1);
 	}
-      out:
+out:
 	reiserfs_check_lock_depth(sb, "journal end2");
 
 	memset(th, 0, sizeof(*th));
--- a/fs/reiserfs/namei.c
+++ b/fs/reiserfs/namei.c
@@ -686,7 +686,7 @@ static int reiserfs_create(struct inode
 	d_instantiate(dentry, inode);
 	retval = journal_end(&th);
 
-      out_failed:
+out_failed:
 	reiserfs_write_unlock(dir->i_sb);
 	return retval;
 }
@@ -767,7 +767,7 @@ static int reiserfs_mknod(struct inode *
 	d_instantiate(dentry, inode);
 	retval = journal_end(&th);
 
-      out_failed:
+out_failed:
 	reiserfs_write_unlock(dir->i_sb);
 	return retval;
 }
@@ -958,11 +958,11 @@ static int reiserfs_rmdir(struct inode *
 
 	retval = journal_end(&th);
 	reiserfs_check_path(&path);
-      out_rmdir:
+out_rmdir:
 	reiserfs_write_unlock(dir->i_sb);
 	return retval;
 
-      end_rmdir:
+end_rmdir:
 	/*
 	 * we must release path, because we did not call
 	 * reiserfs_cut_from_item, or reiserfs_cut_from_item does not
@@ -1064,13 +1064,13 @@ static int reiserfs_unlink(struct inode
 	reiserfs_write_unlock(dir->i_sb);
 	return retval;
 
-      end_unlink:
+end_unlink:
 	pathrelse(&path);
 	err = journal_end(&th);
 	reiserfs_check_path(&path);
 	if (err)
 		retval = err;
-      out_unlink:
+out_unlink:
 	reiserfs_write_unlock(dir->i_sb);
 	return retval;
 }
@@ -1164,7 +1164,7 @@ static int reiserfs_symlink(struct inode
 	unlock_new_inode(inode);
 	d_instantiate(dentry, inode);
 	retval = journal_end(&th);
-      out_failed:
+out_failed:
 	reiserfs_write_unlock(parent_dir->i_sb);
 	return retval;
 }
--- a/fs/reiserfs/stree.c
+++ b/fs/reiserfs/stree.c
@@ -668,7 +668,7 @@ int search_by_key(struct super_block *sb
 			if (!buffer_uptodate(bh))
 				goto io_error;
 		} else {
-		      io_error:
+io_error:
 			search_path->path_length--;
 			pathrelse(search_path);
 			return IO_ERROR;
@@ -2010,7 +2010,7 @@ int reiserfs_do_truncate(struct reiserfs
 	       "PAP-5680: truncate did not finish: new_file_size %Ld, current %Ld, oid %d",
 	       new_file_size, file_size, s_item_key.on_disk_key.k_objectid);
 
-      update_and_out:
+update_and_out:
 	if (update_timestamps) {
 		/* this is truncate, not file closing */
 		inode->i_mtime = CURRENT_TIME_SEC;
@@ -2018,7 +2018,7 @@ int reiserfs_do_truncate(struct reiserfs
 	}
 	reiserfs_update_sd(th, inode);
 
-      out:
+out:
 	pathrelse(&s_search_path);
 	return err;
 }
@@ -2112,7 +2112,7 @@ int reiserfs_paste_into_item(struct reis
 	while ((retval =
 		fix_nodes(M_PASTE, &s_paste_balance, NULL,
 			  body)) == REPEAT_SEARCH) {
-	      search_again:
+search_again:
 		/* file system changed while we were in the fix_nodes */
 		PROC_INFO_INC(th->t_super, paste_into_item_restarted);
 		retval =
@@ -2143,7 +2143,7 @@ int reiserfs_paste_into_item(struct reis
 		return 0;
 	}
 	retval = (retval == NO_DISK_SPACE) ? -ENOSPC : -EIO;
-      error_out:
+error_out:
 	/* this also releases the path */
 	unfix_nodes(&s_paste_balance);
 #ifdef REISERQUOTA_DEBUG
@@ -2222,7 +2222,7 @@ int reiserfs_insert_item(struct reiserfs
 	while ((retval =
 		fix_nodes(M_INSERT, &s_ins_balance, ih,
 			  body)) == REPEAT_SEARCH) {
-	      search_again:
+search_again:
 		/* file system changed while we were in the fix_nodes */
 		PROC_INFO_INC(th->t_super, insert_item_restarted);
 		retval = search_item(th->t_super, key, path);
@@ -2246,7 +2246,7 @@ int reiserfs_insert_item(struct reiserfs
 	}
 
 	retval = (retval == NO_DISK_SPACE) ? -ENOSPC : -EIO;
-      error_out:
+error_out:
 	/* also releases the path */
 	unfix_nodes(&s_ins_balance);
 #ifdef REISERQUOTA_DEBUG
--- a/fs/reiserfs/xattr.c
+++ b/fs/reiserfs/xattr.c
@@ -423,7 +423,7 @@ static struct page *reiserfs_get_page(st
 	}
 	return page;
 
-      fail:
+fail:
 	reiserfs_put_page(page);
 	return ERR_PTR(-EIO);
 }
--- a/fs/reiserfs/xattr_acl.c
+++ b/fs/reiserfs/xattr_acl.c
@@ -113,7 +113,7 @@ static struct posix_acl *reiserfs_posix_
 		goto fail;
 	return acl;
 
-      fail:
+fail:
 	posix_acl_release(acl);
 	return ERR_PTR(-EINVAL);
 }
@@ -166,7 +166,7 @@ static void *reiserfs_posix_acl_to_disk(
 	}
 	return (char *)ext_acl;
 
-      fail:
+fail:
 	kfree(ext_acl);
 	return ERR_PTR(-EINVAL);
 }
@@ -345,7 +345,7 @@ reiserfs_inherit_default_acl(struct reis
 
 	return err;
 
-      apply_umask:
+apply_umask:
 	/* no ACL, apply umask */
 	inode->i_mode &= ~current_umask();
 	return err;


