From: Alexander Zarochentsev <zam@namesys.com>
Subject: Re: journal too big
Date: Tue, 2 Aug 2005 22:44:59 +0400
Message-ID: <200508022245.00532.zam@namesys.com>
References: <4f52331f050802094839f9ad7@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_s877C4JrUaveNic"
Return-path: <reiserfs-list-return-25291-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4f52331f050802094839f9ad7@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: sudo Yang <sudoyang@gmail.com>
Cc: reiserfs-list@namesys.com

--Boundary-00=_s877C4JrUaveNic
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello.

On Tuesday 02 August 2005 20:48, sudo Yang wrote:
> Some of our systems are getting a kernel panic.  This error is logged
> to /var/log/messages:

> Jul 23 09:52:13 csd01a-bld kernel: REISERFS: panic (device sdb1):
> journal-1413: journal_mark_dirty: j_len (1024) is too big

[ ... ]

>
> We'r eusing ReiserfsFS 3.x.  What does this error mean?  What can we
> do about it?

Would you please try the attached patch?  it is for 2.6.9 but applies cleanly 
to 2.6.8.

>
> Thanks

--Boundary-00=_s877C4JrUaveNic
Content-Type: text/x-diff;
  charset="iso-8859-1";
  name="reiserfs-do_truncate-fix-3.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename="reiserfs-do_truncate-fix-3.diff"

--- linux-2.6.9/fs/reiserfs/stree.c.orig	2004-11-08 11:44:05.000000000 +0300
+++ linux-2.6.9/fs/reiserfs/stree.c	2004-11-17 10:11:21.618449392 +0300
@@ -1016,6 +1016,7 @@ static inline int prepare_for_direntry_i
     return M_CUT; 
 }
 
+#define JOURNAL_FOR_FREE_BLOCK_AND_UPDATE_SD (2 * JOURNAL_PER_BALANCE_CNT + 1)
 
 /*  If the path points to a directory or direct item, calculate mode and the size cut, for balance.
     If the path points to an indirect item, remove some number of its unformatted nodes.
@@ -1055,137 +1056,80 @@ static char  prepare_for_delete_or_cut(
     if ( is_direct_le_ih (p_le_ih) )
 	return prepare_for_direct_item (p_s_path, p_le_ih, inode, n_new_file_length, p_n_cut_size);
 
-
     /* Case of an indirect item. */
     {
-	int                   n_unfm_number,    /* Number of the item unformatted nodes. */
-	    n_counter,
-	    n_blk_size;
-	__u32               * p_n_unfm_pointer; /* Pointer to the unformatted node number. */
-	__u32 tmp;
-	struct item_head      s_ih;           /* Item header. */
-	char                  c_mode;           /* Returned mode of the balance. */
-	int need_research;
-
-
-	n_blk_size = p_s_sb->s_blocksize;
-
-	/* Search for the needed object indirect item until there are no unformatted nodes to be removed. */
-	do  {
-	    need_research = 0;
-            p_s_bh = PATH_PLAST_BUFFER(p_s_path);
-	    /* Copy indirect item header to a temp variable. */
+	int blk_size = p_s_sb->s_blocksize;
+	struct item_head s_ih;
+	int need_re_search;
+	int delete = 0;
+	int result = M_CUT;
+	int pos = 0;
+
+	if ( n_new_file_length == max_reiserfs_offset (inode) ) {
+	    /* prepare_for_delete_or_cut() is called by
+	     * reiserfs_delete_item() */
+	    n_new_file_length = 0;
+	    delete = 1;
+	}
+
+	do {
+	    need_re_search = 0;
+	    *p_n_cut_size = 0;
+	    p_s_bh = PATH_PLAST_BUFFER(p_s_path);
 	    copy_item_head(&s_ih, PATH_PITEM_HEAD(p_s_path));
-	    /* Calculate number of unformatted nodes in this item. */
-	    n_unfm_number = I_UNFM_NUM(&s_ih);
+	    pos = I_UNFM_NUM(&s_ih);
 
-	    RFALSE( ! is_indirect_le_ih(&s_ih) || ! n_unfm_number ||
-		    pos_in_item (p_s_path) + 1 !=  n_unfm_number,
-		    "PAP-5240: invalid item %h "
-		    "n_unfm_number = %d *p_n_pos_in_item = %d", 
-		    &s_ih, n_unfm_number, pos_in_item (p_s_path));
-
-	    /* Calculate balance mode and position in the item to remove unformatted nodes. */
-	    if ( n_new_file_length == max_reiserfs_offset (inode) ) {/* Case of delete. */
-		pos_in_item (p_s_path) = 0;
-		*p_n_cut_size = -(IH_SIZE + ih_item_len(&s_ih));
-		c_mode = M_DELETE;
-	    }
-	    else  { /* Case of truncate. */
-		if ( n_new_file_length < le_ih_k_offset (&s_ih) )  {
-		    pos_in_item (p_s_path) = 0;
-		    *p_n_cut_size = -(IH_SIZE + ih_item_len(&s_ih));
-		    c_mode = M_DELETE; /* Delete this item. */
-		}
-		else  {
-		    /* indirect item must be truncated starting from *p_n_pos_in_item-th position */
-		    pos_in_item (p_s_path) = (n_new_file_length + n_blk_size - le_ih_k_offset (&s_ih) ) >> p_s_sb->s_blocksize_bits;
-
-		    RFALSE( pos_in_item (p_s_path) > n_unfm_number,
-			    "PAP-5250: invalid position in the item");
-
-		    /* Either convert last unformatted node of indirect item to direct item or increase
-		       its free space.  */
-		    if ( pos_in_item (p_s_path) == n_unfm_number )  {
-			*p_n_cut_size = 0; /* Nothing to cut. */
-			return M_CONVERT; /* Maybe convert last unformatted node to the direct item. */
-		    }
-		    /* Calculate size to cut. */
-		    *p_n_cut_size = -(ih_item_len(&s_ih) - pos_in_item(p_s_path) * UNFM_P_SIZE);
+	    while (le_ih_k_offset (&s_ih) + (pos - 1) * blk_size > n_new_file_length) {
+		__u32 *unfm, block;
 
-		    c_mode = M_CUT;     /* Cut from this indirect item. */
+		/* Each unformatted block deletion may involve one additional
+		 * bitmap block into the transaction, thereby the initial
+		 * journal space reservation might not be enough. */
+		if (!delete && (*p_n_cut_size) != 0 &&
+		    reiserfs_transaction_free_space(th) < JOURNAL_FOR_FREE_BLOCK_AND_UPDATE_SD) {
+		    break;
 		}
-	    }
-
-	    RFALSE( n_unfm_number <= pos_in_item (p_s_path),
-		    "PAP-5260: invalid position in the indirect item");
 
-	    /* pointers to be cut */
-	    n_unfm_number -= pos_in_item (p_s_path);
-	    /* Set pointer to the last unformatted node pointer that is to be cut. */
-	    p_n_unfm_pointer = (__u32 *)B_I_PITEM(p_s_bh, &s_ih) + I_UNFM_NUM(&s_ih) - 1 - *p_n_removed;
-
-
-	    /* We go through the unformatted nodes pointers of the indirect
-	       item and look for the unformatted nodes in the cache. If we
-	       found some of them we free it, zero corresponding indirect item
-	       entry and log buffer containing that indirect item. For this we
-	       need to prepare last path element for logging. If some
-	       unformatted node has b_count > 1 we must not free this
-	       unformatted node since it is in use. */
-	    reiserfs_prepare_for_journal(p_s_sb, p_s_bh, 1);
-	    // note: path could be changed, first line in for loop takes care
-	    // of it
+		unfm = (__u32 *)B_I_PITEM(p_s_bh, &s_ih) + pos - 1;
+		block = get_block_num(unfm, 0);
 
-	    for (n_counter = *p_n_removed;
-		 n_counter < n_unfm_number; n_counter++, p_n_unfm_pointer-- ) {
+		if (block != 0) {
+		    reiserfs_prepare_for_journal(p_s_sb, p_s_bh, 1);
+		    put_block_num(unfm, 0, 0);
+		    journal_mark_dirty (th, p_s_sb, p_s_bh);
+		    reiserfs_free_block(th, inode, block, 1);
+		}
 
 		cond_resched();
-		if (item_moved (&s_ih, p_s_path)) {
-		    need_research = 1 ;
-		    break;
-		}
-		RFALSE( p_n_unfm_pointer < (__u32 *)B_I_PITEM(p_s_bh, &s_ih) ||
-			p_n_unfm_pointer > (__u32 *)B_I_PITEM(p_s_bh, &s_ih) + I_UNFM_NUM(&s_ih) - 1,
-			"vs-5265: pointer out of range");
-
-		/* Hole, nothing to remove. */
-		if ( ! get_block_num(p_n_unfm_pointer,0) )  {
-			(*p_n_removed)++;
-			continue;
+		if (item_moved (&s_ih, p_s_path))  {
+		    need_re_search = 1;
+		    break ;
 		}
 
-		(*p_n_removed)++;
-
-		tmp = get_block_num(p_n_unfm_pointer,0);
-		put_block_num(p_n_unfm_pointer, 0, 0);
-		journal_mark_dirty (th, p_s_sb, p_s_bh);
-		reiserfs_free_block(th, inode, tmp, 1);
-		if ( item_moved (&s_ih, p_s_path) )  {
-			need_research = 1;
-			break ;
+		pos --;
+		(*p_n_removed) ++;
+		(*p_n_cut_size) -= UNFM_P_SIZE;
+
+		if (pos == 0) {
+		    (*p_n_cut_size) -= IH_SIZE;
+		    result = M_DELETE;
+		    break;
 		}
 	    }
-
-	    /* a trick.  If the buffer has been logged, this
-	    ** will do nothing.  If we've broken the loop without
-	    ** logging it, it will restore the buffer
-	    **
-	    */
+	    /* a trick.  If the buffer has been logged, this will do nothing.  If
+	    ** we've broken the loop without logging it, it will restore the
+	    ** buffer */
 	    reiserfs_restore_prepared_buffer(p_s_sb, p_s_bh);
-
-	    /* This loop can be optimized. */
-	} while ( (*p_n_removed < n_unfm_number || need_research) &&
-		  search_for_position_by_key(p_s_sb, p_s_item_key, p_s_path) == POSITION_FOUND );
-
-	RFALSE( *p_n_removed < n_unfm_number, 
-		"PAP-5310: indirect item is not found");
-	RFALSE( item_moved (&s_ih, p_s_path), 
-		"after while, comp failed, retry") ;
-
-	if (c_mode == M_CUT)
-	    pos_in_item (p_s_path) *= UNFM_P_SIZE;
-	return c_mode;
+	} while (need_re_search && 
+		 search_for_position_by_key(p_s_sb, p_s_item_key, p_s_path) == POSITION_FOUND);
+	pos_in_item(p_s_path) = pos * UNFM_P_SIZE;
+
+	if (*p_n_cut_size == 0) {
+	    /* Nothing were cut. maybe convert last unformatted node to the
+	     * direct item? */
+	    result = M_CONVERT;
+	}
+	return result;
     }
 }
 
@@ -1893,7 +1837,8 @@ void reiserfs_do_truncate (struct reiser
 	** sure the file is consistent before ending the current trans
 	** and starting a new one
 	*/
-        if (journal_transaction_should_end(th, th->t_blocks_allocated)) {
+        if (journal_transaction_should_end(th, 0) || 
+		reiserfs_transaction_free_space(th) <= JOURNAL_FOR_FREE_BLOCK_AND_UPDATE_SD) {
 	  int orig_len_alloc = th->t_blocks_allocated ;
 	  decrement_counters_in_path(&s_search_path) ;
 
@@ -1903,7 +1848,8 @@ void reiserfs_do_truncate (struct reiser
 	  reiserfs_update_sd(th, p_s_inode) ;
 
 	  journal_end(th, p_s_inode->i_sb, orig_len_alloc) ;
-	  journal_begin(th, p_s_inode->i_sb, JOURNAL_PER_BALANCE_CNT * 6) ;
+	  journal_begin(th, p_s_inode->i_sb, 
+			JOURNAL_FOR_FREE_BLOCK_AND_UPDATE_SD + JOURNAL_PER_BALANCE_CNT * 4) ;
 	  reiserfs_update_inode_transaction(p_s_inode) ;
 	}
     } while ( n_file_size > ROUND_UP (n_new_file_size) &&
--- linux-2.6.9/include/linux/reiserfs_fs.h.orig	2004-11-08 18:00:24.000000000 +0300
+++ linux-2.6.9/include/linux/reiserfs_fs.h	2004-11-08 18:40:05.000000000 +0300
@@ -1769,6 +1769,11 @@ static inline int reiserfs_transaction_r
     return 0 ;
 }
 
+static inline int reiserfs_transaction_free_space(struct reiserfs_transaction_handle *th)
+{
+	return th->t_blocks_allocated - th->t_blocks_logged;
+}
+
 int reiserfs_async_progress_wait(struct super_block *s);
 
 struct reiserfs_transaction_handle *

--Boundary-00=_s877C4JrUaveNic--

