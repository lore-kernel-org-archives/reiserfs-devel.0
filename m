From: Oleg Drokin <green@namesys.com>
Subject: Re: Horrible ftruncate performance
Date: Thu, 10 Jul 2003 09:29:31 +0400
Message-ID: <20030710052931.GA17957@namesys.com>
References: <Pine.LNX.4.30.0307100523110.24356-100000@divine.city.tvnet.hu>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14858-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.30.0307100523110.24356-100000@divine.city.tvnet.hu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Szakacsits Szabolcs <szaka@sienet.hu>
Cc: reiserfs-list@namesys.com

Hello!

On Thu, Jul 10, 2003 at 05:23:39AM +0200, Szakacsits Szabolcs wrote:

> I've noticed very long "hangs" using reiserfs and they were always at
> ftruncate(2). I made a comparision between different filesystems. SuSE 8.2

Yes, this is known "feature".

> (same bad performance on older SuSE versions as well), same partitition,
> default mkfs.*. Let's create a 200GB sparse file:
> 	dd if=/dev/zero of=sparse bs=1 seek=200G count=1
> Results:
> 	ext3	    0.00 sec
> 	XFS         0.00 sec
> 	JFS         0.00 sec
> 	reiserfs  874.27 sec (all spent in the kernel)

See the patch below.
It is merged into 2.4.22-pre3
Speeds up large holes creation in ~ 1000 times (on 4k blocksize)

> Is there a faster way to create big sparse files on reiserfs?

Use the patch. (should apply to 2.4.18,2.4.19,2.4.20,2.4.21)
(I am unsure if you can apply it to the kernel from SuSE 8.2, though).

Bye,
    Oleg
===== fs/reiserfs/do_balan.c 1.12 vs edited =====
--- 1.12/fs/reiserfs/do_balan.c	Thu Sep 12 12:39:21 2002
+++ edited/fs/reiserfs/do_balan.c	Tue Jun 17 19:13:06 2003
@@ -304,8 +304,6 @@
 		    int new_item_len;
 		    int version;
 
-		    RFALSE (!is_direct_le_ih (ih),
-			    "PAP-12075: only direct inserted item can be broken. %h", ih);
 		    ret_val = leaf_shift_left (tb, tb->lnum[0]-1, -1);
 
 		    /* Calculate item length to insert to S[0] */
@@ -328,7 +326,7 @@
 		    version = ih_version (ih);
 
 		    /* Calculate key component, item length and body to insert into S[0] */
-                    set_le_ih_k_offset( ih, le_ih_k_offset( ih ) + tb->lbytes );
+                    set_le_ih_k_offset( ih, le_ih_k_offset( ih ) + (tb->lbytes << (is_indirect_le_ih(ih)?tb->tb_sb->s_blocksize_bits-UNFM_P_SHIFT:0)) );
 
 		    put_ih_item_len( ih, new_item_len );
 		    if ( tb->lbytes >  zeros_num ) {
@@ -437,23 +435,28 @@
 				ih_item_len( B_N_PITEM_HEAD(tb->L[0],n+item_pos-ret_val)),
 				l_n,body, zeros_num > l_n ? l_n : zeros_num
 				);
-
-			    RFALSE( l_n && 
-				    is_indirect_le_ih(B_N_PITEM_HEAD
-						      (tb->L[0],
-						       n + item_pos - ret_val)),
-				    "PAP-12110: pasting more than 1 unformatted node pointer into indirect item");
-
 			    /* 0-th item in S0 can be only of DIRECT type when l_n != 0*/
 			    {
-			      int version;
-
-			      version = ih_version (B_N_PITEM_HEAD (tbS0, 0));
-			      set_le_key_k_offset (version, B_N_PKEY (tbS0, 0), 
-						   le_key_k_offset (version, B_N_PKEY (tbS0, 0)) + l_n);
-			      version = ih_version (B_N_PITEM_HEAD(tb->CFL[0],tb->lkey[0]));
-			      set_le_key_k_offset (version, B_N_PDELIM_KEY(tb->CFL[0],tb->lkey[0]),
-						   le_key_k_offset (version, B_N_PDELIM_KEY(tb->CFL[0],tb->lkey[0])) + l_n);
+				int version;
+				int temp_l = l_n;
+				
+				RFALSE (ih_item_len (B_N_PITEM_HEAD (tbS0, 0)),
+					"PAP-12106: item length must be 0");
+				RFALSE (comp_short_le_keys (B_N_PKEY (tbS0, 0),
+							    B_N_PKEY (tb->L[0],
+									    n + item_pos - ret_val)),
+					"PAP-12107: items must be of the same file");
+				if (is_indirect_le_ih(B_N_PITEM_HEAD (tb->L[0],
+								      n + item_pos - ret_val)))	{
+				    temp_l = l_n << (tb->tb_sb->s_blocksize_bits - UNFM_P_SHIFT);
+				}
+				/* update key of first item in S0 */
+				version = ih_version (B_N_PITEM_HEAD (tbS0, 0));
+				set_le_key_k_offset (version, B_N_PKEY (tbS0, 0), 
+						     le_key_k_offset (version, B_N_PKEY (tbS0, 0)) + temp_l);
+				/* update left delimiting key */
+				set_le_key_k_offset (version, B_N_PDELIM_KEY(tb->CFL[0],tb->lkey[0]),
+						     le_key_k_offset (version, B_N_PDELIM_KEY(tb->CFL[0],tb->lkey[0])) + temp_l);
 			    }
 
 			    /* Calculate new body, position in item and insert_size[0] */
@@ -522,7 +525,7 @@
 			    );
 		    /* if appended item is indirect item, put unformatted node into un list */
 		    if (is_indirect_le_ih (pasted))
-			set_ih_free_space (pasted, ((struct unfm_nodeinfo*)body)->unfm_freespace);
+			set_ih_free_space (pasted, 0);
 		    tb->insert_size[0] = 0;
 		    zeros_num = 0;
 		}
@@ -550,15 +553,11 @@
 	    { /* new item or its part falls to R[0] */
 		if ( item_pos == n - tb->rnum[0] + 1 && tb->rbytes != -1 )
 		{ /* part of new item falls into R[0] */
-		    int old_key_comp, old_len, r_zeros_number;
+		    loff_t old_key_comp, old_len, r_zeros_number;
 		    const char * r_body;
 		    int version;
 		    loff_t offset;
 
-		    RFALSE( !is_direct_le_ih (ih),
-			    "PAP-12135: only direct item can be split. (%h)", 
-			    ih);
-
 		    leaf_shift_right(tb,tb->rnum[0]-1,-1);
 
 		    version = ih_version(ih);
@@ -567,7 +566,7 @@
 		    old_len = ih_item_len(ih);
 
 		    /* Calculate key component and item length to insert into R[0] */
-                    offset = le_ih_k_offset( ih ) + (old_len - tb->rbytes );
+                    offset = le_ih_k_offset( ih ) + ((old_len - tb->rbytes )<<(is_indirect_le_ih(ih)?tb->tb_sb->s_blocksize_bits-UNFM_P_SHIFT:0));
                     set_le_ih_k_offset( ih, offset );
 		    put_ih_item_len( ih, tb->rbytes);
 		    /* Insert part of the item into R[0] */
@@ -575,13 +574,13 @@
 		    bi.bi_bh = tb->R[0];
 		    bi.bi_parent = tb->FR[0];
 		    bi.bi_position = get_right_neighbor_position (tb, 0);
-		    if ( offset - old_key_comp > zeros_num ) {
+		    if ( (old_len - tb->rbytes) > zeros_num ) {
 			r_zeros_number = 0;
-			r_body = body + offset - old_key_comp - zeros_num;
+			r_body = body + (old_len - tb->rbytes) - zeros_num;
 		    }
 		    else {
 			r_body = body;
-			r_zeros_number = zeros_num - (offset - old_key_comp);
+			r_zeros_number = zeros_num - (old_len - tb->rbytes);
 			zeros_num -= r_zeros_number;
 		    }
 
@@ -692,12 +691,17 @@
 			
 			{
 			  int version;
+			  unsigned long temp_rem = n_rem;
 			  
 			  version = ih_version (B_N_PITEM_HEAD (tb->R[0],0));
+			  if (is_indirect_le_key(version,B_N_PKEY(tb->R[0],0))){
+			      temp_rem = n_rem << (tb->tb_sb->s_blocksize_bits -
+			                 UNFM_P_SHIFT);
+			  }
 			  set_le_key_k_offset (version, B_N_PKEY(tb->R[0],0), 
-					       le_key_k_offset (version, B_N_PKEY(tb->R[0],0)) + n_rem);
+					       le_key_k_offset (version, B_N_PKEY(tb->R[0],0)) + temp_rem);
 			  set_le_key_k_offset (version, B_N_PDELIM_KEY(tb->CFR[0],tb->rkey[0]), 
-					       le_key_k_offset (version, B_N_PDELIM_KEY(tb->CFR[0],tb->rkey[0])) + n_rem);
+					       le_key_k_offset (version, B_N_PDELIM_KEY(tb->CFR[0],tb->rkey[0])) + temp_rem);
 			}
 /*		  k_offset (B_N_PKEY(tb->R[0],0)) += n_rem;
 		  k_offset (B_N_PDELIM_KEY(tb->CFR[0],tb->rkey[0])) += n_rem;*/
@@ -721,13 +725,12 @@
 			leaf_paste_in_buffer(&bi, 0, n_shift, tb->insert_size[0] - n_rem, r_body, r_zeros_number);
 
 			if (is_indirect_le_ih (B_N_PITEM_HEAD(tb->R[0],0))) {
-
+#if 0
 			    RFALSE( n_rem,
 				    "PAP-12160: paste more than one unformatted node pointer");
-
-			    set_ih_free_space (B_N_PITEM_HEAD(tb->R[0],0), ((struct unfm_nodeinfo*)body)->unfm_freespace);
+#endif
+			    set_ih_free_space (B_N_PITEM_HEAD(tb->R[0],0), 0);
 			}
-
 			tb->insert_size[0] = n_rem;
 			if ( ! n_rem )
 			    pos_in_item ++;
@@ -766,7 +769,7 @@
 		    }
 
 		    if (is_indirect_le_ih (pasted))
-			set_ih_free_space (pasted, ((struct unfm_nodeinfo*)body)->unfm_freespace);
+			set_ih_free_space (pasted, 0);
 		    zeros_num = tb->insert_size[0] = 0;
 		}
 	    }
@@ -843,12 +846,6 @@
 		    const char * r_body;
 		    int version;
 
-		    RFALSE( !is_direct_le_ih(ih),
-			/* The items which can be inserted are:
-			   Stat_data item, direct item, indirect item and directory item which consist of only two entries "." and "..".
-			   These items must not be broken except for a direct one. */
-			    "PAP-12205: non-direct item can not be broken when inserting");
-
 		    /* Move snum[i]-1 items from S[0] to S_new[i] */
 		    leaf_move_items (LEAF_FROM_S_TO_SNEW, tb, snum[i] - 1, -1, S_new[i]);
 		    /* Remember key component and item length */
@@ -858,7 +855,7 @@
 
 		    /* Calculate key component and item length to insert into S_new[i] */
                     set_le_ih_k_offset( ih,
-                                le_ih_k_offset(ih) + (old_len - sbytes[i] ) );
+                                le_ih_k_offset(ih) + ((old_len - sbytes[i] )<<(is_indirect_le_ih(ih)?tb->tb_sb->s_blocksize_bits-UNFM_P_SHIFT:0) ));
 
 		    put_ih_item_len( ih, sbytes[i] );
 
@@ -868,13 +865,13 @@
 		    bi.bi_parent = 0;
 		    bi.bi_position = 0;
 
-		    if ( le_ih_k_offset (ih) - old_key_comp > zeros_num ) {
+		    if ( (old_len - sbytes[i]) > zeros_num ) {
 			r_zeros_number = 0;
-			r_body = body + (le_ih_k_offset(ih) - old_key_comp) - zeros_num;
+			r_body = body + (old_len - sbytes[i]) - zeros_num;
 		    }
 		    else {
 			r_body = body;
-			r_zeros_number = zeros_num - (le_ih_k_offset (ih) - old_key_comp);
+			r_zeros_number = zeros_num - (old_len - sbytes[i]);
 			zeros_num -= r_zeros_number;
 		    }
 
@@ -995,11 +992,14 @@
 
 			    tmp = B_N_PITEM_HEAD(S_new[i],0);
 			    if (is_indirect_le_ih (tmp)) {
-				if (n_rem)
-				    reiserfs_panic (tb->tb_sb, "PAP-12230: balance_leaf: invalid action with indirect item");
-				set_ih_free_space (tmp, ((struct unfm_nodeinfo*)body)->unfm_freespace);
+				set_ih_free_space (tmp, 0);
+				set_le_ih_k_offset( tmp, le_ih_k_offset(tmp) + 
+					            (n_rem << (tb->tb_sb->s_blocksize_bits -
+						     UNFM_P_SHIFT)));
+			    } else {
+				set_le_ih_k_offset( tmp, le_ih_k_offset(tmp) + 
+				                    n_rem );
 			    }
-                            set_le_ih_k_offset( tmp, le_ih_k_offset(tmp) + n_rem );
 			}
 
 			tb->insert_size[0] = n_rem;
@@ -1045,7 +1045,7 @@
 
 		    /* if we paste to indirect item update ih_free_space */
 		    if (is_indirect_le_ih (pasted))
-			set_ih_free_space (pasted, ((struct unfm_nodeinfo*)body)->unfm_freespace);
+			set_ih_free_space (pasted, 0);
 		    zeros_num = tb->insert_size[0] = 0;
 		}
 	    }
@@ -1141,11 +1141,12 @@
 		    leaf_paste_in_buffer (&bi, item_pos, pos_in_item, tb->insert_size[0], body, zeros_num);
 
 		    if (is_indirect_le_ih (pasted)) {
-
+#if 0
 			RFALSE( tb->insert_size[0] != UNFM_P_SIZE,
 				"PAP-12280: insert_size for indirect item must be %d, not %d",
 				UNFM_P_SIZE, tb->insert_size[0]);
-			set_ih_free_space (pasted, ((struct unfm_nodeinfo*)body)->unfm_freespace);
+#endif
+			set_ih_free_space (pasted, 0);
 		    }
 		    tb->insert_size[0] = 0;
 		}
===== fs/reiserfs/inode.c 1.45 vs edited =====
--- 1.45/fs/reiserfs/inode.c	Fri May 23 00:35:02 2003
+++ edited/fs/reiserfs/inode.c	Tue Jun 17 19:11:38 2003
@@ -798,7 +798,11 @@
 	       pointer to 'block'-th block use block, which is already
 	       allocated */
 	    struct cpu_key tmp_key;
-	    struct unfm_nodeinfo un = {0, 0};
+	    unp_t unf_single=0; // We use this in case we need to allocate only
+				// one block which is a fastpath
+	    unp_t *un;
+	    __u64 max_to_insert=MAX_ITEM_LEN(inode->i_sb->s_blocksize)/UNFM_P_SIZE;
+	    __u64 blocks_needed;
 
 	    RFALSE( pos_in_item != ih_item_len(ih) / UNFM_P_SIZE,
 		    "vs-804: invalid position for append");
@@ -807,30 +811,58 @@
 			  le_key_k_offset (version, &(ih->ih_key)) + op_bytes_number (ih, inode->i_sb->s_blocksize),
 			  //pos_in_item * inode->i_sb->s_blocksize,
 			  TYPE_INDIRECT, 3);// key type is unimportant
-		  
-	    if (cpu_key_k_offset (&tmp_key) == cpu_key_k_offset (&key)) {
+
+	    blocks_needed = 1 + ((cpu_key_k_offset (&key) - cpu_key_k_offset (&tmp_key)) >> inode->i_sb->s_blocksize_bits);
+	    RFALSE( blocks_needed < 0, "green-805: invalid offset");
+
+	    if ( blocks_needed == 1 ) {
+		un = &unf_single;
+	    } else {
+		un=kmalloc( min(blocks_needed,max_to_insert)*UNFM_P_SIZE,
+			    GFP_ATOMIC); // We need to avoid scheduling.
+		if ( !un) {
+		    un = &unf_single;
+		    blocks_needed = 1;
+		    max_to_insert = 0;
+		} else
+		    memset(un, 0, UNFM_P_SIZE * min(blocks_needed,max_to_insert));
+	    }
+	    if ( blocks_needed <= max_to_insert) {
 		/* we are going to add target block to the file. Use allocated
 		   block for that */
-		un.unfm_nodenum = cpu_to_le32 (allocated_block_nr);
+		un[blocks_needed-1] = cpu_to_le32 (allocated_block_nr);
 		set_block_dev_mapped (bh_result, allocated_block_nr, inode);
 		bh_result->b_state |= (1UL << BH_New);
 		done = 1;
 	    } else {
 		/* paste hole to the indirect item */
+		/* If kmalloc failed, max_to_insert becomes zero and it means we
+		   only have space for one block */
+		blocks_needed=max_to_insert?max_to_insert:1;
 	    }
-	    retval = reiserfs_paste_into_item (&th, &path, &tmp_key, (char *)&un, UNFM_P_SIZE);
+	    retval = reiserfs_paste_into_item (&th, &path, &tmp_key, (char *)un, UNFM_P_SIZE * blocks_needed);
+
+	    if (blocks_needed != 1)
+		 kfree(un);
+
 	    if (retval) {
 		reiserfs_free_block (&th, allocated_block_nr);
 		goto failure;
 	    }
-	    if (un.unfm_nodenum)
+	    if (done) {
 		inode->i_blocks += inode->i_sb->s_blocksize / 512;
+	    } else {
+		/* We need to mark new file size in case this function will be
+		   interrupted/aborted later on. And we may do this only for
+		   holes. */
+		inode->i_size += blocks_needed << inode->i_blkbits;
+	    }
 	    //mark_tail_converted (inode);
 	}
-		
+
 	if (done == 1)
 	    break;
-	 
+
 	/* this loop could log more blocks than we had originally asked
 	** for.  So, we have to allow the transaction to end if it is
 	** too big or too full.  Update the inode so things are 
===== fs/reiserfs/tail_conversion.c 1.17 vs edited =====
--- 1.17/fs/reiserfs/tail_conversion.c	Sat May  3 15:38:39 2003
+++ edited/fs/reiserfs/tail_conversion.c	Tue Jun 17 19:11:38 2003
@@ -30,7 +30,7 @@
                                 key of unfm pointer to be pasted */
     int	n_blk_size,
       n_retval;	  /* returned value for reiserfs_insert_item and clones */
-    struct unfm_nodeinfo unfm_ptr;  /* Handle on an unformatted node
+    unp_t unfm_ptr;  /* Handle on an unformatted node
 				       that will be inserted in the
 				       tree. */
 
@@ -59,8 +59,7 @@
     
     p_le_ih = PATH_PITEM_HEAD (path);
 
-    unfm_ptr.unfm_nodenum = cpu_to_le32 (unbh->b_blocknr);
-    unfm_ptr.unfm_freespace = 0; // ???
+    unfm_ptr = cpu_to_le32 (unbh->b_blocknr);
     
     if ( is_statdata_le_ih (p_le_ih) )  {
 	/* Insert new indirect item. */
===== include/linux/reiserfs_fs.h 1.27 vs edited =====
--- 1.27/include/linux/reiserfs_fs.h	Sat May  3 15:38:41 2003
+++ edited/include/linux/reiserfs_fs.h	Tue Jun 17 19:12:15 2003
@@ -1158,6 +1158,7 @@
 
 /* Size of pointer to the unformatted node. */
 #define UNFM_P_SIZE (sizeof(unp_t))
+#define UNFM_P_SHIFT 2
 
 // in in-core inode key is stored on le form
 #define INODE_PKEY(inode) ((struct key *)((inode)->u.reiserfs_i.i_key))
