From: Jeff Mahoney <jeffm@suse.com>
Subject: [patch 06/29] reiserfs: cleanup, remove sb argument from journal_mark_dirty
Date: Wed, 23 Apr 2014 10:00:39 -0400
Message-ID: <20140423151139.793761329@suse.com>
References: <20140423140033.704113918@suse.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline; filename=reiserfs/reiserfs-cleanup-remove-sb-argument-from-journal_mark_dirty
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ReiserFS Development List <reiserfs-devel@vger.kernel.org>
Cc: Jan Kara <jack@suse.cz>, Dave Jones <davej@redhat.com>

journal_mark_dirty doesn't need a separate sb argument; It's provided
by the transaction handle.

Signed-off-by: Jeff Mahoney <jeffm@suse.com>
---
 fs/reiserfs/bitmap.c   |    8 ++++----
 fs/reiserfs/do_balan.c |    3 +--
 fs/reiserfs/file.c     |    2 +-
 fs/reiserfs/fix_node.c |    2 +-
 fs/reiserfs/inode.c    |    8 ++++----
 fs/reiserfs/journal.c  |   18 ++++++++----------
 fs/reiserfs/namei.c    |    6 +++---
 fs/reiserfs/objectid.c |    4 ++--
 fs/reiserfs/reiserfs.h |    2 +-
 fs/reiserfs/resize.c   |    6 +++---
 fs/reiserfs/stree.c    |    2 +-
 fs/reiserfs/super.c    |   12 ++++++------
 12 files changed, 35 insertions(+), 38 deletions(-)

--- a/fs/reiserfs/bitmap.c
+++ b/fs/reiserfs/bitmap.c
@@ -256,14 +256,14 @@ static int scan_bitmap_block(struct reis
 				}
 			}
 			bi->free_count -= (end - *beg);
-			journal_mark_dirty(th, s, bh);
+			journal_mark_dirty(th, bh);
 			brelse(bh);
 
 			/* free block count calculation */
 			reiserfs_prepare_for_journal(s, SB_BUFFER_WITH_SB(s),
 						     1);
 			PUT_SB_FREE_BLOCKS(s, SB_FREE_BLOCKS(s) - (end - *beg));
-			journal_mark_dirty(th, s, SB_BUFFER_WITH_SB(s));
+			journal_mark_dirty(th, SB_BUFFER_WITH_SB(s));
 
 			return end - (*beg);
 		} else {
@@ -453,14 +453,14 @@ static void _reiserfs_free_block(struct
 			       "block %lu: bit already cleared", block);
 	}
 	apbi[nr].free_count++;
-	journal_mark_dirty(th, s, bmbh);
+	journal_mark_dirty(th, bmbh);
 	brelse(bmbh);
 
 	reiserfs_prepare_for_journal(s, sbh, 1);
 	/* update super block */
 	set_sb_free_blocks(rs, sb_free_blocks(rs) + 1);
 
-	journal_mark_dirty(th, s, sbh);
+	journal_mark_dirty(th, sbh);
 	if (for_unformatted) {
 		int depth = reiserfs_write_unlock_nested(s);
 		dquot_free_block_nodirty(inode, 1);
--- a/fs/reiserfs/do_balan.c
+++ b/fs/reiserfs/do_balan.c
@@ -56,8 +56,7 @@ static inline void buffer_info_init_bh(s
 inline void do_balance_mark_leaf_dirty(struct tree_balance *tb,
 				       struct buffer_head *bh, int flag)
 {
-	journal_mark_dirty(tb->transaction_handle,
-			   tb->transaction_handle->t_super, bh);
+	journal_mark_dirty(tb->transaction_handle, bh);
 }
 
 #define do_balance_mark_internal_dirty do_balance_mark_leaf_dirty
--- a/fs/reiserfs/file.c
+++ b/fs/reiserfs/file.c
@@ -212,7 +212,7 @@ int reiserfs_commit_page(struct inode *i
 			set_buffer_uptodate(bh);
 			if (logit) {
 				reiserfs_prepare_for_journal(s, bh, 1);
-				journal_mark_dirty(&th, s, bh);
+				journal_mark_dirty(&th, bh);
 			} else if (!buffer_dirty(bh)) {
 				mark_buffer_dirty(bh);
 				/*
--- a/fs/reiserfs/fix_node.c
+++ b/fs/reiserfs/fix_node.c
@@ -2572,7 +2572,7 @@ int fix_nodes(int op_mode, struct tree_b
 	 */
 	reiserfs_prepare_for_journal(tb->tb_sb,
 				     SB_BUFFER_WITH_SB(tb->tb_sb), 1);
-	journal_mark_dirty(tb->transaction_handle, tb->tb_sb,
+	journal_mark_dirty(tb->transaction_handle,
 			   SB_BUFFER_WITH_SB(tb->tb_sb));
 	if (FILESYSTEM_CHANGED_TB(tb))
 		return REPEAT_SEARCH;
--- a/fs/reiserfs/inode.c
+++ b/fs/reiserfs/inode.c
@@ -816,7 +816,7 @@ int reiserfs_get_block(struct inode *ino
 				reiserfs_add_ordered_list(inode, bh_result);
 			put_block_num(item, pos_in_item, allocated_block_nr);
 			unfm_ptr = allocated_block_nr;
-			journal_mark_dirty(th, inode->i_sb, bh);
+			journal_mark_dirty(th, bh);
 			reiserfs_update_sd(th, inode);
 		}
 		set_block_dev_mapped(bh_result, unfm_ptr, inode);
@@ -1505,7 +1505,7 @@ void reiserfs_update_sd_size(struct reis
 		break;
 	}
 	update_stat_data(&path, inode, size);
-	journal_mark_dirty(th, th->t_super, bh);
+	journal_mark_dirty(th, bh);
 	pathrelse(&path);
 	return;
 }
@@ -2457,7 +2457,7 @@ static int map_block_for_writepage(struc
 		memcpy(ih_item_body(bh, ih) + pos_in_item, p + bytes_copied,
 		       copy_size);
 
-		journal_mark_dirty(&th, inode->i_sb, bh);
+		journal_mark_dirty(&th, bh);
 		bytes_copied += copy_size;
 		set_block_dev_mapped(bh_result, 0, inode);
 
@@ -2627,7 +2627,7 @@ static int reiserfs_write_full_page(stru
 
 		if (checked) {
 			reiserfs_prepare_for_journal(s, bh, 1);
-			journal_mark_dirty(&th, s, bh);
+			journal_mark_dirty(&th, bh);
 			continue;
 		}
 		/*
--- a/fs/reiserfs/journal.c
+++ b/fs/reiserfs/journal.c
@@ -1929,8 +1929,7 @@ static int do_journal_release(struct rei
 			reiserfs_prepare_for_journal(sb,
 						     SB_BUFFER_WITH_SB(sb),
 						     1);
-			journal_mark_dirty(&myth, sb,
-					   SB_BUFFER_WITH_SB(sb));
+			journal_mark_dirty(&myth, SB_BUFFER_WITH_SB(sb));
 			do_journal_end(&myth, FLUSH_ALL);
 			flushed = 1;
 		}
@@ -1943,8 +1942,7 @@ static int do_journal_release(struct rei
 			reiserfs_prepare_for_journal(sb,
 						     SB_BUFFER_WITH_SB(sb),
 						     1);
-			journal_mark_dirty(&myth, sb,
-					   SB_BUFFER_WITH_SB(sb));
+			journal_mark_dirty(&myth, SB_BUFFER_WITH_SB(sb));
 			do_journal_end(&myth, FLUSH_ALL);
 		}
 	}
@@ -3268,8 +3266,9 @@ int journal_begin(struct reiserfs_transa
  * if j_len, is bigger than j_len_alloc, it pushes j_len_alloc to 10 + j_len.
  */
 int journal_mark_dirty(struct reiserfs_transaction_handle *th,
-		       struct super_block *sb, struct buffer_head *bh)
+		       struct buffer_head *bh)
 {
+	struct super_block *sb = th->t_super;
 	struct reiserfs_journal *journal = SB_JOURNAL(sb);
 	struct reiserfs_journal_cnode *cn = NULL;
 	int count_already_incd = 0;
@@ -3522,7 +3521,7 @@ int journal_end_sync(struct reiserfs_tra
 	if (journal->j_len == 0) {
 		reiserfs_prepare_for_journal(sb, SB_BUFFER_WITH_SB(sb),
 					     1);
-		journal_mark_dirty(th, sb, SB_BUFFER_WITH_SB(sb));
+		journal_mark_dirty(th, SB_BUFFER_WITH_SB(sb));
 	}
 	return do_journal_end(th, COMMIT_NOW | WAIT);
 }
@@ -3576,8 +3575,7 @@ void reiserfs_flush_old_commits(struct s
 			reiserfs_prepare_for_journal(sb,
 						     SB_BUFFER_WITH_SB(sb),
 						     1);
-			journal_mark_dirty(&th, sb,
-					   SB_BUFFER_WITH_SB(sb));
+			journal_mark_dirty(&th, SB_BUFFER_WITH_SB(sb));
 
 			/*
 			 * we're only being called from kreiserfsd, it makes
@@ -3863,7 +3861,7 @@ static int __commit_trans_jl(struct inod
 		if (journal->j_trans_id != id) {
 			reiserfs_prepare_for_journal(sb, SB_BUFFER_WITH_SB(sb),
 						     1);
-			journal_mark_dirty(&th, sb, SB_BUFFER_WITH_SB(sb));
+			journal_mark_dirty(&th, SB_BUFFER_WITH_SB(sb));
 			ret = journal_end(&th);
 			goto flush_commit_only;
 		}
@@ -4014,7 +4012,7 @@ static int do_journal_end(struct reiserf
 	if (journal->j_len == 0) {
 		reiserfs_prepare_for_journal(sb, SB_BUFFER_WITH_SB(sb),
 					     1);
-		journal_mark_dirty(th, sb, SB_BUFFER_WITH_SB(sb));
+		journal_mark_dirty(th, SB_BUFFER_WITH_SB(sb));
 	}
 
 	lock_journal(sb);
--- a/fs/reiserfs/namei.c
+++ b/fs/reiserfs/namei.c
@@ -1531,10 +1531,10 @@ static int reiserfs_rename(struct inode
 
 	mark_de_visible(new_de.de_deh + new_de.de_entry_num);
 	set_ino_in_dir_entry(&new_de, INODE_PKEY(old_inode));
-	journal_mark_dirty(&th, old_dir->i_sb, new_de.de_bh);
+	journal_mark_dirty(&th, new_de.de_bh);
 
 	mark_de_hidden(old_de.de_deh + old_de.de_entry_num);
-	journal_mark_dirty(&th, old_dir->i_sb, old_de.de_bh);
+	journal_mark_dirty(&th, old_de.de_bh);
 	ctime = CURRENT_TIME_SEC;
 	old_dir->i_ctime = old_dir->i_mtime = ctime;
 	new_dir->i_ctime = new_dir->i_mtime = ctime;
@@ -1558,7 +1558,7 @@ static int reiserfs_rename(struct inode
 	if (S_ISDIR(old_inode_mode)) {
 		/* adjust ".." of renamed directory */
 		set_ino_in_dir_entry(&dot_dot_de, INODE_PKEY(new_dir));
-		journal_mark_dirty(&th, new_dir->i_sb, dot_dot_de.de_bh);
+		journal_mark_dirty(&th, dot_dot_de.de_bh);
 
 		/*
 		 * there (in new_dir) was no directory, so it got new link
--- a/fs/reiserfs/objectid.c
+++ b/fs/reiserfs/objectid.c
@@ -89,7 +89,7 @@ __u32 reiserfs_get_unused_objectid(struc
 		set_sb_oid_cursize(rs, sb_oid_cursize(rs) - 2);
 	}
 
-	journal_mark_dirty(th, s, SB_BUFFER_WITH_SB(s));
+	journal_mark_dirty(th, SB_BUFFER_WITH_SB(s));
 	return unused_objectid;
 }
 
@@ -107,7 +107,7 @@ void reiserfs_release_objectid(struct re
 	check_objectid_map(s, map);
 
 	reiserfs_prepare_for_journal(s, SB_BUFFER_WITH_SB(s), 1);
-	journal_mark_dirty(th, s, SB_BUFFER_WITH_SB(s));
+	journal_mark_dirty(th, SB_BUFFER_WITH_SB(s));
 
 	/*
 	 * start at the beginning of the objectid map (i = 0) and go to
--- a/fs/reiserfs/reiserfs.h
+++ b/fs/reiserfs/reiserfs.h
@@ -2864,7 +2864,7 @@ void reiserfs_free_jh(struct buffer_head
 int reiserfs_add_tail_list(struct inode *inode, struct buffer_head *bh);
 int reiserfs_add_ordered_list(struct inode *inode, struct buffer_head *bh);
 int journal_mark_dirty(struct reiserfs_transaction_handle *,
-		       struct super_block *, struct buffer_head *bh);
+		       struct buffer_head *bh);
 
 static inline int reiserfs_file_data_log(struct inode *inode)
 {
--- a/fs/reiserfs/resize.c
+++ b/fs/reiserfs/resize.c
@@ -193,7 +193,7 @@ int reiserfs_resize(struct super_block *
 		reiserfs_clear_le_bit(i, bh->b_data);
 	info->free_count += s->s_blocksize * 8 - block_r;
 
-	journal_mark_dirty(&th, s, bh);
+	journal_mark_dirty(&th, bh);
 	brelse(bh);
 
 	/* Correct new last bitmap block - It may not be full */
@@ -209,7 +209,7 @@ int reiserfs_resize(struct super_block *
 	reiserfs_prepare_for_journal(s, bh, 1);
 	for (i = block_r_new; i < s->s_blocksize * 8; i++)
 		reiserfs_set_le_bit(i, bh->b_data);
-	journal_mark_dirty(&th, s, bh);
+	journal_mark_dirty(&th, bh);
 	brelse(bh);
 
 	info->free_count -= s->s_blocksize * 8 - block_r_new;
@@ -222,7 +222,7 @@ int reiserfs_resize(struct super_block *
 	PUT_SB_BLOCK_COUNT(s, block_count_new);
 	PUT_SB_BMAP_NR(s, bmap_would_wrap(bmap_nr_new) ? : bmap_nr_new);
 
-	journal_mark_dirty(&th, s, SB_BUFFER_WITH_SB(s));
+	journal_mark_dirty(&th, SB_BUFFER_WITH_SB(s));
 
 	SB_JOURNAL(s)->j_must_wait = 1;
 	return journal_end(&th);
--- a/fs/reiserfs/stree.c
+++ b/fs/reiserfs/stree.c
@@ -1101,7 +1101,7 @@ static char prepare_for_delete_or_cut(st
 		    if (block != 0) {
 			reiserfs_prepare_for_journal(sb, bh, 1);
 			put_block_num(unfm, 0, 0);
-			journal_mark_dirty(th, sb, bh);
+			journal_mark_dirty(th, bh);
 			reiserfs_free_block(th, inode, block, 1);
 		    }
 
--- a/fs/reiserfs/super.c
+++ b/fs/reiserfs/super.c
@@ -137,7 +137,7 @@ static int reiserfs_freeze(struct super_
 		} else {
 			reiserfs_prepare_for_journal(s, SB_BUFFER_WITH_SB(s),
 						     1);
-			journal_mark_dirty(&th, s, SB_BUFFER_WITH_SB(s));
+			journal_mark_dirty(&th, SB_BUFFER_WITH_SB(s));
 			reiserfs_block_writes(&th);
 			journal_end_sync(&th);
 		}
@@ -552,7 +552,7 @@ static void reiserfs_put_super(struct su
 						     1);
 			set_sb_umount_state(SB_DISK_SUPER_BLOCK(s),
 					    REISERFS_SB(s)->s_mount_state);
-			journal_mark_dirty(&th, s, SB_BUFFER_WITH_SB(s));
+			journal_mark_dirty(&th, SB_BUFFER_WITH_SB(s));
 		}
 	}
 
@@ -1477,7 +1477,7 @@ static int reiserfs_remount(struct super
 		/* Mounting a rw partition read-only. */
 		reiserfs_prepare_for_journal(s, SB_BUFFER_WITH_SB(s), 1);
 		set_sb_umount_state(rs, REISERFS_SB(s)->s_mount_state);
-		journal_mark_dirty(&th, s, SB_BUFFER_WITH_SB(s));
+		journal_mark_dirty(&th, SB_BUFFER_WITH_SB(s));
 	} else {
 		/* remount read-write */
 		if (!(s->s_flags & MS_RDONLY)) {
@@ -1509,7 +1509,7 @@ static int reiserfs_remount(struct super
 		if (!old_format_only(s))
 			set_sb_mnt_count(rs, sb_mnt_count(rs) + 1);
 		/* mark_buffer_dirty (SB_BUFFER_WITH_SB (s), 1); */
-		journal_mark_dirty(&th, s, SB_BUFFER_WITH_SB(s));
+		journal_mark_dirty(&th, SB_BUFFER_WITH_SB(s));
 		REISERFS_SB(s)->s_mount_state = REISERFS_VALID_FS;
 	}
 	/* this will force a full flush of all journal lists */
@@ -2106,7 +2106,7 @@ static int reiserfs_fill_super(struct su
 			set_sb_mnt_count(rs, sb_mnt_count(rs) + 1);
 
 
-		journal_mark_dirty(&th, s, SB_BUFFER_WITH_SB(s));
+		journal_mark_dirty(&th, SB_BUFFER_WITH_SB(s));
 		errval = journal_end(&th);
 		if (errval) {
 			dput(s->s_root);
@@ -2481,7 +2481,7 @@ static ssize_t reiserfs_quota_write(stru
 		unlock_buffer(bh);
 		reiserfs_write_lock(sb);
 		reiserfs_prepare_for_journal(sb, bh, 1);
-		journal_mark_dirty(current->journal_info, sb, bh);
+		journal_mark_dirty(current->journal_info, bh);
 		if (!journal_quota)
 			reiserfs_add_ordered_list(inode, bh);
 		reiserfs_write_unlock(sb);


