From: Chris Mason <mason@suse.com>
Subject: Re: udpated data logging available
Date: 01 Jul 2003 21:44:21 -0400
Message-ID: <1057110260.20904.878.camel@tiny.suse.com>
References: <1055764071.24111.650.camel@tiny.suse.com>
	 <200306260216.41204.christian.mayrhuber@gmx.net>
	 <1056592066.20899.10.camel@tiny.suse.com>
	 <200306261342.08725.Dieter.Nuetzel@hamburg.de>
	 <1056632026.20899.39.camel@tiny.suse.com> <3EFAF6D7.9040408@netscape.net>
	 <3F021C41.9090100@netscape.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-oAM8VtYzhvq2grnermaN"
Return-path: <reiserfs-list-return-14799-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3F021C41.9090100@netscape.net>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Manuel Krause <manuelkrause@netscape.net>
Cc: reiserfs-list <reiserfs-list@namesys.com>

--=-oAM8VtYzhvq2grnermaN
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2003-07-01 at 19:41, Manuel Krause wrote:
>  
> > Does the search_reada-4 contradict the new code or is it even dangerous
> > to combine them (what I luckily didn't trigger so far)?
> > 
> > Thanks,
> > 
> >  Manuel
> 
> No answer needed so far upon search_reada-4 ?!?!
> 

Sorry, I've been doing some final testing on search_reada-5, which is
attached.  It doesn't help quite as much as search_reada-4, but it also
doesn't hurt the random io case anywhere near as badly.  It tries to be
smarter about only doing read ahead for the same object you are
searching for.  

I'll upload in the morning.

> If I may remind, that only patch brought 2.4.20+  +reiserfs
> +data-logging to the high throughput values of 2.4.19 +reiserfs
> +data-logging when copying my backup partition (around 5GB) via cp.
> 
> 
> 
> O.K. -- The new (experimental) patches run fine on all my previous
> simple test patterns _with_ search_reada-4 (cp my backup-partitions,
> home usage with NS 7.1 and OOo 1.1betas; VMware 3.2.1 sessions with
> defrag/SpeedDisk in Win98) with 2.4.21 +data-logging +rml-preempt-kernel.
> 
> I didn't post definite timings upon my data as using the first new
> experimental data-logging patches led to a throughput/speed improvement
> of 3% only (compared to without exp patches) what is within in the
> typical fluctuation (copying via cp). And I avoided testing without
> search_reada so far, for the reason of needed retesting back to 2.4.19
> (disk content changed).
> So, at least, I can say "It didn't get slower - but may be a bit faster
> or even another bit more. - Depends..."
> 

Most of the improvement comes in fsync heavy workloads.  The
data=ordered io is a little smoother as well, for better latencies in
general.

> 
> Many thanks, your work is great indeed !
> 

Thanks for your continued tests, they are very helpful.

-chris


--=-oAM8VtYzhvq2grnermaN
Content-Disposition: attachment; filename=search_reada-5.diff
Content-Type: text/plain; name=search_reada-5.diff; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

===== fs/reiserfs/stree.c 1.22 vs edited =====
--- 1.22/fs/reiserfs/stree.c	Mon Jun 30 12:45:49 2003
+++ edited/fs/reiserfs/stree.c	Mon Jun 30 13:33:02 2003
@@ -598,26 +598,32 @@
 
 
 
-#ifdef SEARCH_BY_KEY_READA
+#define SEARCH_BY_KEY_READA 8
 
 /* The function is NOT SCHEDULE-SAFE! */
-static void search_by_key_reada (struct super_block * s, int blocknr)
+static void search_by_key_reada (struct super_block * s, 
+                                 struct buffer_head **bh, 
+				 unsigned long *b, int num)
 {
-    struct buffer_head * bh;
+    int i,j;
   
-    if (blocknr == 0)
-	return;
-
-    bh = getblk (s->s_dev, blocknr, s->s_blocksize);
-  
-    if (!buffer_uptodate (bh)) {
-	ll_rw_block (READA, 1, &bh);
+    for (i = 0 ; i < num ; i++) {
+	bh[i] = sb_getblk (s, b[i]);
+	if (buffer_uptodate(bh[i])) {
+	    brelse(bh[i]);
+	    break;
+	}
+	touch_buffer(bh[i]);
+    } 
+    if (i) {
+	ll_rw_block(READA, i, bh);
+    }
+    for(j = 0 ; j < i ; j++) {
+        if (bh[j])
+	    brelse(bh[j]);
     }
-    bh->b_count --;
 }
 
-#endif
-
 /**************************************************************************
  * Algorithm   SearchByKey                                                *
  *             look for item in the Disk S+Tree by its key                *
@@ -660,6 +666,9 @@
     int				n_node_level, n_retval;
     int 			right_neighbor_of_leaf_node;
     int				fs_gen;
+    struct buffer_head *reada_bh[SEARCH_BY_KEY_READA];
+    unsigned long      reada_blocks[SEARCH_BY_KEY_READA];
+    int reada_count = 0;
 
 #ifdef CONFIG_REISERFS_CHECK
     int n_repeat_counter = 0;
@@ -696,11 +705,11 @@
 	fs_gen = get_generation (p_s_sb);
 	expected_level --;
 
-#ifdef SEARCH_BY_KEY_READA
-	/* schedule read of right neighbor */
-	search_by_key_reada (p_s_sb, right_neighbor_of_leaf_node);
-#endif
-
+	/* schedule read of right neighbors */
+	if (reada_count) {
+	    search_by_key_reada (p_s_sb, reada_bh, reada_blocks, reada_count);
+	    reada_count = 0;
+	}
 	/* Read the next tree node, and set the last element in the path to
            have a pointer to it. */
 	if ( ! (p_s_bh = p_s_last_element->pe_buffer =
@@ -787,12 +796,37 @@
 	   an internal node.  Now we calculate child block number by
 	   position in the node. */
 	n_block_number = B_N_CHILD_NUM(p_s_bh, p_s_last_element->pe_position);
-
-#ifdef SEARCH_BY_KEY_READA
-	/* if we are going to read leaf node, then calculate its right neighbor if possible */
-	if (n_node_level == DISK_LEAF_NODE_LEVEL + 1 && p_s_last_element->pe_position < B_NR_ITEMS (p_s_bh))
-	    right_neighbor_of_leaf_node = B_N_CHILD_NUM(p_s_bh, p_s_last_element->pe_position + 1);
-#endif
+	
+	/* if we are going to read leaf nodes, try for read ahead as well */
+	if (n_node_level == DISK_LEAF_NODE_LEVEL + 1 && 
+	    p_s_last_element->pe_position < B_NR_ITEMS (p_s_bh) &&
+	    !is_direct_cpu_key(p_s_key) && 
+	    !is_statdata_cpu_key(p_s_key))
+	{
+	    int pos = p_s_last_element->pe_position;
+	    int limit = B_NR_ITEMS(p_s_bh);
+	    struct buffer_head *tmp_bh;
+	    struct key *le_key;
+
+	    /* don't try to readahead if the leaf is already
+	     * in ram.  get_hash_table doesn't schedule, so this
+	     * is safe
+	     */
+	    tmp_bh = sb_get_hash_table(p_s_sb, n_block_number);
+	    if (tmp_bh) {
+	        brelse(tmp_bh);
+		continue;
+	    }
+	    while(pos <= limit && reada_count < SEARCH_BY_KEY_READA) { 
+		le_key = B_N_PDELIM_KEY(p_s_bh, pos);
+		if (le32_to_cpu(le_key->k_objectid) != 
+		    p_s_key->on_disk_key.k_objectid)
+		{
+		    break;
+		}
+	        reada_blocks[reada_count++] = B_N_CHILD_NUM(p_s_bh, pos++);
+	    }
+        }
     }
 }
 

--=-oAM8VtYzhvq2grnermaN--

