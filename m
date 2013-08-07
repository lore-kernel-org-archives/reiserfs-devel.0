From: Jan Kara <jack@suse.cz>
Subject: Re: [patch v3 3/3] reiserfs: locking, release lock around quota
 operations
Date: Wed, 7 Aug 2013 22:28:33 +0200
Message-ID: <20130807202833.GG26516@quack.suse.cz>
References: <20130807163515.986450231@suse.com>
 <20130807163550.684219995@suse.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20130807163550.684219995@suse.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeff Mahoney <jeffm@suse.com>
Cc: reiserfs-devel@vger.kernel.org, jack@suse.cz

On Wed 07-08-13 12:35:18, Jeff Mahoney wrote:
> Previous commits released the write lock across quota operations but
> missed several places.  In particular, the free operations can also
> call into the file system code and take the write lock, causing
> deadlocks.
> 
> This patch introduces some more helpers and uses them for quota call
> sites.  Without this patch applied, reiserfs + quotas runs into deadlocks
> under anything more than trivial load.
  This patch looks good so I'll merge it once the comment to 2/3 is sorted
out.

								Honza
> 
> Signed-off-by: Jeff Mahoney <jeffm@suse.com>
> ---
> 
>  fs/reiserfs/bitmap.c |   17 +++++++++++++++--
>  fs/reiserfs/inode.c  |   19 +++++++++++--------
>  fs/reiserfs/stree.c  |   28 +++++++++++++++++++++++-----
>  fs/reiserfs/super.c  |   22 ++++++++++++++--------
>  4 files changed, 63 insertions(+), 23 deletions(-)
> 
> --- a/fs/reiserfs/bitmap.c	2013-08-07 10:23:33.885587547 -0400
> +++ b/fs/reiserfs/bitmap.c	2013-08-07 10:23:35.761559089 -0400
> @@ -423,8 +423,11 @@ static void _reiserfs_free_block(struct
>  	set_sb_free_blocks(rs, sb_free_blocks(rs) + 1);
>  
>  	journal_mark_dirty(th, s, sbh);
> -	if (for_unformatted)
> +	if (for_unformatted) {
> +		int depth = reiserfs_write_unlock_nested(s);
>  		dquot_free_block_nodirty(inode, 1);
> +		reiserfs_write_lock_nested(s, depth);
> +	}
>  }
>  
>  void reiserfs_free_block(struct reiserfs_transaction_handle *th,
> @@ -1128,6 +1131,7 @@ static inline int blocknrs_and_prealloc_
>  	b_blocknr_t finish = SB_BLOCK_COUNT(s) - 1;
>  	int passno = 0;
>  	int nr_allocated = 0;
> +	int depth;
>  
>  	determine_prealloc_size(hint);
>  	if (!hint->formatted_node) {
> @@ -1137,10 +1141,13 @@ static inline int blocknrs_and_prealloc_
>  			       "reiserquota: allocating %d blocks id=%u",
>  			       amount_needed, hint->inode->i_uid);
>  #endif
> +		depth = reiserfs_write_unlock_nested(s);
>  		quota_ret =
>  		    dquot_alloc_block_nodirty(hint->inode, amount_needed);
> -		if (quota_ret)	/* Quota exceeded? */
> +		if (quota_ret) {	/* Quota exceeded? */
> +			reiserfs_write_lock_nested(s, depth);
>  			return QUOTA_EXCEEDED;
> +		}
>  		if (hint->preallocate && hint->prealloc_size) {
>  #ifdef REISERQUOTA_DEBUG
>  			reiserfs_debug(s, REISERFS_DEBUG_CODE,
> @@ -1153,6 +1160,7 @@ static inline int blocknrs_and_prealloc_
>  				hint->preallocate = hint->prealloc_size = 0;
>  		}
>  		/* for unformatted nodes, force large allocations */
> +		reiserfs_write_lock_nested(s, depth);
>  	}
>  
>  	do {
> @@ -1181,9 +1189,11 @@ static inline int blocknrs_and_prealloc_
>  					       hint->inode->i_uid);
>  #endif
>  				/* Free not allocated blocks */
> +				depth = reiserfs_write_unlock_nested(s);
>  				dquot_free_block_nodirty(hint->inode,
>  					amount_needed + hint->prealloc_size -
>  					nr_allocated);
> +				reiserfs_write_lock_nested(s, depth);
>  			}
>  			while (nr_allocated--)
>  				reiserfs_free_block(hint->th, hint->inode,
> @@ -1214,10 +1224,13 @@ static inline int blocknrs_and_prealloc_
>  			       REISERFS_I(hint->inode)->i_prealloc_count,
>  			       hint->inode->i_uid);
>  #endif
> +
> +		depth = reiserfs_write_unlock_nested(s);
>  		dquot_free_block_nodirty(hint->inode, amount_needed +
>  					 hint->prealloc_size - nr_allocated -
>  					 REISERFS_I(hint->inode)->
>  					 i_prealloc_count);
> +		reiserfs_write_lock_nested(s, depth);
>  	}
>  
>  	return CARRY_ON;
> --- a/fs/reiserfs/inode.c	2013-08-07 10:23:33.933586826 -0400
> +++ b/fs/reiserfs/inode.c	2013-08-07 10:23:35.781558786 -0400
> @@ -57,8 +57,11 @@ void reiserfs_evict_inode(struct inode *
>  		/* Do quota update inside a transaction for journaled quotas. We must do that
>  		 * after delete_object so that quota updates go into the same transaction as
>  		 * stat data deletion */
> -		if (!err) 
> +		if (!err) {
> +			int depth = reiserfs_write_unlock_nested(inode->i_sb);
>  			dquot_free_inode(inode);
> +			reiserfs_write_lock_nested(inode->i_sb, depth);
> +		}
>  
>  		if (journal_end(&th, inode->i_sb, jbegin_count))
>  			goto out;
> @@ -1768,7 +1771,7 @@ int reiserfs_new_inode(struct reiserfs_t
>  		       struct inode *inode,
>  		       struct reiserfs_security_handle *security)
>  {
> -	struct super_block *sb;
> +	struct super_block *sb = dir->i_sb;
>  	struct reiserfs_iget_args args;
>  	INITIALIZE_PATH(path_to_key);
>  	struct cpu_key key;
> @@ -1780,9 +1783,9 @@ int reiserfs_new_inode(struct reiserfs_t
>  
>  	BUG_ON(!th->t_trans_id);
>  
> -	reiserfs_write_unlock(inode->i_sb);
> +	depth = reiserfs_write_unlock_nested(sb);
>  	err = dquot_alloc_inode(inode);
> -	reiserfs_write_lock(inode->i_sb);
> +	reiserfs_write_lock_nested(sb, depth);
>  	if (err)
>  		goto out_end_trans;
>  	if (!dir->i_nlink) {
> @@ -1790,8 +1793,6 @@ int reiserfs_new_inode(struct reiserfs_t
>  		goto out_bad_inode;
>  	}
>  
> -	sb = dir->i_sb;
> -
>  	/* item head of new item */
>  	ih.ih_key.k_dir_id = reiserfs_choose_packing(dir);
>  	ih.ih_key.k_objectid = cpu_to_le32(reiserfs_get_unused_objectid(th));
> @@ -1983,14 +1984,16 @@ int reiserfs_new_inode(struct reiserfs_t
>  	INODE_PKEY(inode)->k_objectid = 0;
>  
>  	/* Quota change must be inside a transaction for journaling */
> +	depth = reiserfs_write_unlock_nested(inode->i_sb);
>  	dquot_free_inode(inode);
> +	reiserfs_write_lock_nested(inode->i_sb, depth);
>  
>        out_end_trans:
>  	journal_end(th, th->t_super, th->t_blocks_allocated);
> -	reiserfs_write_unlock(inode->i_sb);
>  	/* Drop can be outside and it needs more credits so it's better to have it outside */
> +	depth = reiserfs_write_unlock_nested(inode->i_sb);
>  	dquot_drop(inode);
> -	reiserfs_write_lock(inode->i_sb);
> +	reiserfs_write_lock_nested(inode->i_sb, depth);
>  	inode->i_flags |= S_NOQUOTA;
>  	make_bad_inode(inode);
>  
> --- a/fs/reiserfs/stree.c	2013-08-07 10:23:34.037585247 -0400
> +++ b/fs/reiserfs/stree.c	2013-08-07 10:23:35.793558603 -0400
> @@ -1190,6 +1190,7 @@ int reiserfs_delete_item(struct reiserfs
>  	struct item_head *q_ih;
>  	int quota_cut_bytes;
>  	int ret_value, del_size, removed;
> +	int depth;
>  
>  #ifdef CONFIG_REISERFS_CHECK
>  	char mode;
> @@ -1299,7 +1300,9 @@ int reiserfs_delete_item(struct reiserfs
>  		       "reiserquota delete_item(): freeing %u, id=%u type=%c",
>  		       quota_cut_bytes, inode->i_uid, head2type(&s_ih));
>  #endif
> +	depth = reiserfs_write_unlock_nested(inode->i_sb);
>  	dquot_free_space_nodirty(inode, quota_cut_bytes);
> +	reiserfs_write_lock_nested(inode->i_sb, depth);
>  
>  	/* Return deleted body length */
>  	return ret_value;
> @@ -1325,6 +1328,7 @@ int reiserfs_delete_item(struct reiserfs
>  void reiserfs_delete_solid_item(struct reiserfs_transaction_handle *th,
>  				struct inode *inode, struct reiserfs_key *key)
>  {
> +	struct super_block *sb = th->t_super;
>  	struct tree_balance tb;
>  	INITIALIZE_PATH(path);
>  	int item_len = 0;
> @@ -1377,14 +1381,17 @@ void reiserfs_delete_solid_item(struct r
>  		if (retval == CARRY_ON) {
>  			do_balance(&tb, NULL, NULL, M_DELETE);
>  			if (inode) {	/* Should we count quota for item? (we don't count quotas for save-links) */
> +				int depth;
>  #ifdef REISERQUOTA_DEBUG
>  				reiserfs_debug(th->t_super, REISERFS_DEBUG_CODE,
>  					       "reiserquota delete_solid_item(): freeing %u id=%u type=%c",
>  					       quota_cut_bytes, inode->i_uid,
>  					       key2type(key));
>  #endif
> +				depth = reiserfs_write_unlock_nested(sb);
>  				dquot_free_space_nodirty(inode,
>  							 quota_cut_bytes);
> +				reiserfs_write_lock_nested(sb, depth);
>  			}
>  			break;
>  		}
> @@ -1561,6 +1568,7 @@ int reiserfs_cut_from_item(struct reiser
>  	int retval2 = -1;
>  	int quota_cut_bytes;
>  	loff_t tail_pos = 0;
> +	int depth;
>  
>  	BUG_ON(!th->t_trans_id);
>  
> @@ -1733,7 +1741,9 @@ int reiserfs_cut_from_item(struct reiser
>  		       "reiserquota cut_from_item(): freeing %u id=%u type=%c",
>  		       quota_cut_bytes, inode->i_uid, '?');
>  #endif
> +	depth = reiserfs_write_unlock_nested(sb);
>  	dquot_free_space_nodirty(inode, quota_cut_bytes);
> +	reiserfs_write_lock_nested(sb, depth);
>  	return ret_value;
>  }
>  
> @@ -1953,9 +1963,11 @@ int reiserfs_paste_into_item(struct reis
>  			     const char *body,	/* Pointer to the bytes to paste.    */
>  			     int pasted_size)
>  {				/* Size of pasted bytes.             */
> +	struct super_block *sb = inode->i_sb;
>  	struct tree_balance s_paste_balance;
>  	int retval;
>  	int fs_gen;
> +	int depth;
>  
>  	BUG_ON(!th->t_trans_id);
>  
> @@ -1968,9 +1980,9 @@ int reiserfs_paste_into_item(struct reis
>  		       key2type(&(key->on_disk_key)));
>  #endif
>  
> -	reiserfs_write_unlock(inode->i_sb);
> +	depth = reiserfs_write_unlock_nested(sb);
>  	retval = dquot_alloc_space_nodirty(inode, pasted_size);
> -	reiserfs_write_lock(inode->i_sb);
> +	reiserfs_write_lock_nested(sb, depth);
>  	if (retval) {
>  		pathrelse(search_path);
>  		return retval;
> @@ -2027,7 +2039,9 @@ int reiserfs_paste_into_item(struct reis
>  		       pasted_size, inode->i_uid,
>  		       key2type(&(key->on_disk_key)));
>  #endif
> +	depth = reiserfs_write_unlock_nested(sb);
>  	dquot_free_space_nodirty(inode, pasted_size);
> +	reiserfs_write_lock_nested(sb, depth);
>  	return retval;
>  }
>  
> @@ -2050,6 +2064,7 @@ int reiserfs_insert_item(struct reiserfs
>  	BUG_ON(!th->t_trans_id);
>  
>  	if (inode) {		/* Do we count quotas for item? */
> +		int depth;
>  		fs_gen = get_generation(inode->i_sb);
>  		quota_bytes = ih_item_len(ih);
>  
> @@ -2063,11 +2078,11 @@ int reiserfs_insert_item(struct reiserfs
>  			       "reiserquota insert_item(): allocating %u id=%u type=%c",
>  			       quota_bytes, inode->i_uid, head2type(ih));
>  #endif
> -		reiserfs_write_unlock(inode->i_sb);
>  		/* We can't dirty inode here. It would be immediately written but
>  		 * appropriate stat item isn't inserted yet... */
> +		depth = reiserfs_write_unlock_nested(inode->i_sb);
>  		retval = dquot_alloc_space_nodirty(inode, quota_bytes);
> -		reiserfs_write_lock(inode->i_sb);
> +		reiserfs_write_lock_nested(inode->i_sb, depth);
>  		if (retval) {
>  			pathrelse(path);
>  			return retval;
> @@ -2118,7 +2133,10 @@ int reiserfs_insert_item(struct reiserfs
>  		       "reiserquota insert_item(): freeing %u id=%u type=%c",
>  		       quota_bytes, inode->i_uid, head2type(ih));
>  #endif
> -	if (inode)
> +	if (inode) {
> +		int depth = reiserfs_write_unlock_nested(inode->i_sb);
>  		dquot_free_space_nodirty(inode, quota_bytes);
> +		reiserfs_write_lock_nested(inode->i_sb, depth);
> +	}
>  	return retval;
>  }
> --- a/fs/reiserfs/super.c	2013-08-07 10:23:34.049585066 -0400
> +++ b/fs/reiserfs/super.c	2013-08-07 10:23:35.805558422 -0400
> @@ -243,6 +243,7 @@ static int finish_unfinished(struct supe
>  	done = 0;
>  	REISERFS_SB(s)->s_is_unlinked_ok = 1;
>  	while (!retval) {
> +		int depth;
>  		retval = search_item(s, &max_cpu_key, &path);
>  		if (retval != ITEM_NOT_FOUND) {
>  			reiserfs_error(s, "vs-2140",
> @@ -298,9 +299,9 @@ static int finish_unfinished(struct supe
>  			retval = remove_save_link_only(s, &save_link_key, 0);
>  			continue;
>  		}
> -		reiserfs_write_unlock(s);
> +		depth = reiserfs_write_unlock_nested(inode->i_sb);
>  		dquot_initialize(inode);
> -		reiserfs_write_lock(s);
> +		reiserfs_write_lock_nested(inode->i_sb, depth);
>  
>  		if (truncate && S_ISDIR(inode->i_mode)) {
>  			/* We got a truncate request for a dir which is impossible.
> @@ -356,10 +357,12 @@ static int finish_unfinished(struct supe
>  
>  #ifdef CONFIG_QUOTA
>  	/* Turn quotas off */
> +	reiserfs_write_unlock(s);
>  	for (i = 0; i < MAXQUOTAS; i++) {
>  		if (sb_dqopt(s)->files[i] && quota_enabled[i])
>  			dquot_quota_off(s, i);
>  	}
> +	reiserfs_write_lock(s);
>  	if (ms_active_set)
>  		/* Restore the flag back */
>  		s->s_flags &= ~MS_ACTIVE;
> @@ -2098,6 +2101,7 @@ static int reiserfs_write_dquot(struct d
>  {
>  	struct reiserfs_transaction_handle th;
>  	int ret, err;
> +	int depth;
>  
>  	reiserfs_write_lock(dquot->dq_sb);
>  	ret =
> @@ -2105,9 +2109,9 @@ static int reiserfs_write_dquot(struct d
>  			  REISERFS_QUOTA_TRANS_BLOCKS(dquot->dq_sb));
>  	if (ret)
>  		goto out;
> -	reiserfs_write_unlock(dquot->dq_sb);
> +	depth = reiserfs_write_unlock_nested(dquot->dq_sb);
>  	ret = dquot_commit(dquot);
> -	reiserfs_write_lock(dquot->dq_sb);
> +	reiserfs_write_lock_nested(dquot->dq_sb, depth);
>  	err =
>  	    journal_end(&th, dquot->dq_sb,
>  			REISERFS_QUOTA_TRANS_BLOCKS(dquot->dq_sb));
> @@ -2122,6 +2126,7 @@ static int reiserfs_acquire_dquot(struct
>  {
>  	struct reiserfs_transaction_handle th;
>  	int ret, err;
> +	int depth;
>  
>  	reiserfs_write_lock(dquot->dq_sb);
>  	ret =
> @@ -2129,9 +2134,9 @@ static int reiserfs_acquire_dquot(struct
>  			  REISERFS_QUOTA_INIT_BLOCKS(dquot->dq_sb));
>  	if (ret)
>  		goto out;
> -	reiserfs_write_unlock(dquot->dq_sb);
> +	depth = reiserfs_write_unlock_nested(dquot->dq_sb);
>  	ret = dquot_acquire(dquot);
> -	reiserfs_write_lock(dquot->dq_sb);
> +	reiserfs_write_lock_nested(dquot->dq_sb, depth);
>  	err =
>  	    journal_end(&th, dquot->dq_sb,
>  			REISERFS_QUOTA_INIT_BLOCKS(dquot->dq_sb));
> @@ -2184,15 +2189,16 @@ static int reiserfs_write_info(struct su
>  {
>  	struct reiserfs_transaction_handle th;
>  	int ret, err;
> +	int depth;
>  
>  	/* Data block + inode block */
>  	reiserfs_write_lock(sb);
>  	ret = journal_begin(&th, sb, 2);
>  	if (ret)
>  		goto out;
> -	reiserfs_write_unlock(sb);
> +	depth = reiserfs_write_unlock_nested(sb);
>  	ret = dquot_commit_info(sb, type);
> -	reiserfs_write_lock(sb);
> +	reiserfs_write_lock_nested(sb, depth);
>  	err = journal_end(&th, sb, 2);
>  	if (!ret && err)
>  		ret = err;
> 
> 
-- 
Jan Kara <jack@suse.cz>
SUSE Labs, CR
