From: Oleg Drokin <green@namesys.com>
Subject: speedup patch for 2.4.18 (actually attached)
Date: Wed, 10 Apr 2002 11:15:58 +0400
Message-ID: <20020410111558.A19314@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="mP3DRpeJDSE+ciuQ"
Return-path: <reiserfs-list-return-10004-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--mP3DRpeJDSE+ciuQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

patch attached ;)

--mP3DRpeJDSE+ciuQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="speedup-2.4.18.diff"

diff -uNr linux-2.4.18.original/fs/buffer.c linux-2.4.18.speedup/fs/buffer.c
--- linux-2.4.18.original/fs/buffer.c	Tue Feb 26 15:53:01 2002
+++ linux-2.4.18.speedup/fs/buffer.c	Wed Apr 10 10:35:57 2002
@@ -327,6 +327,8 @@
 	lock_super(sb);
 	if (sb->s_dirt && sb->s_op && sb->s_op->write_super)
 		sb->s_op->write_super(sb);
+	if (sb->s_op && sb->s_op->commit_super)
+		sb->s_op->commit_super(sb);
 	unlock_super(sb);
 	unlock_kernel();
 
@@ -346,7 +348,7 @@
 	lock_kernel();
 	sync_inodes(dev);
 	DQUOT_SYNC(dev);
-	sync_supers(dev);
+	commit_supers(dev);
 	unlock_kernel();
 
 	return sync_buffers(dev, 1);
diff -uNr linux-2.4.18.original/fs/reiserfs/bitmap.c linux-2.4.18.speedup/fs/reiserfs/bitmap.c
--- linux-2.4.18.original/fs/reiserfs/bitmap.c	Tue Feb 26 15:52:56 2002
+++ linux-2.4.18.speedup/fs/reiserfs/bitmap.c	Wed Apr 10 10:35:57 2002
@@ -122,7 +122,6 @@
   set_sb_free_blocks( rs, sb_free_blocks(rs) + 1 );
 
   journal_mark_dirty (th, s, sbh);
-  s->s_dirt = 1;
 }
 
 void reiserfs_free_block (struct reiserfs_transaction_handle *th, 
@@ -435,7 +434,6 @@
   /* update free block count in super block */
   PUT_SB_FREE_BLOCKS( s, SB_FREE_BLOCKS(s) - init_amount_needed );
   journal_mark_dirty (th, s, SB_BUFFER_WITH_SB (s));
-  s->s_dirt = 1;
 
   return CARRY_ON;
 }
diff -uNr linux-2.4.18.original/fs/reiserfs/ibalance.c linux-2.4.18.speedup/fs/reiserfs/ibalance.c
--- linux-2.4.18.original/fs/reiserfs/ibalance.c	Sat Nov 10 01:18:25 2001
+++ linux-2.4.18.speedup/fs/reiserfs/ibalance.c	Wed Apr 10 10:35:57 2002
@@ -632,7 +632,6 @@
 		/* use check_internal if new root is an internal node */
 		check_internal (new_root);
 	    /*&&&&&&&&&&&&&&&&&&&&&&*/
-	    tb->tb_sb->s_dirt = 1;
 
 	    /* do what is needed for buffer thrown from tree */
 	    reiserfs_invalidate_buffer(tb, tbSh);
@@ -950,7 +949,6 @@
         PUT_SB_ROOT_BLOCK( tb->tb_sb, tbSh->b_blocknr );
         PUT_SB_TREE_HEIGHT( tb->tb_sb, SB_TREE_HEIGHT(tb->tb_sb) + 1 );
 	do_balance_mark_sb_dirty (tb, tb->tb_sb->u.reiserfs_sb.s_sbh, 1);
-	tb->tb_sb->s_dirt = 1;
     }
 	
     if ( tb->blknum[h] == 2 ) {
diff -uNr linux-2.4.18.original/fs/reiserfs/journal.c linux-2.4.18.speedup/fs/reiserfs/journal.c
--- linux-2.4.18.original/fs/reiserfs/journal.c	Tue Feb 26 15:53:01 2002
+++ linux-2.4.18.speedup/fs/reiserfs/journal.c	Wed Apr 10 10:36:09 2002
@@ -64,12 +64,15 @@
 */
 static int reiserfs_mounted_fs_count = 0 ;
 
+static struct list_head kreiserfsd_supers = LIST_HEAD_INIT(kreiserfsd_supers);
+
 /* wake this up when you add something to the commit thread task queue */
 DECLARE_WAIT_QUEUE_HEAD(reiserfs_commit_thread_wait) ;
 
 /* wait on this if you need to be sure you task queue entries have been run */
 static DECLARE_WAIT_QUEUE_HEAD(reiserfs_commit_thread_done) ;
 DECLARE_TASK_QUEUE(reiserfs_commit_thread_tq) ;
+DECLARE_MUTEX(kreiserfsd_sem) ;
 
 #define JOURNAL_TRANS_HALF 1018   /* must be correct to keep the desc and commit structs at 4k */
 
@@ -574,17 +577,12 @@
 /* lock the current transaction */
 inline static void lock_journal(struct super_block *p_s_sb) {
   PROC_INFO_INC( p_s_sb, journal.lock_journal );
-  while(atomic_read(&(SB_JOURNAL(p_s_sb)->j_wlock)) > 0) {
-    PROC_INFO_INC( p_s_sb, journal.lock_journal_wait );
-    sleep_on(&(SB_JOURNAL(p_s_sb)->j_wait)) ;
-  }
-  atomic_set(&(SB_JOURNAL(p_s_sb)->j_wlock), 1) ;
+  down(&SB_JOURNAL(p_s_sb)->j_lock);
 }
 
 /* unlock the current transaction */
 inline static void unlock_journal(struct super_block *p_s_sb) {
-  atomic_dec(&(SB_JOURNAL(p_s_sb)->j_wlock)) ;
-  wake_up(&(SB_JOURNAL(p_s_sb)->j_wait)) ;
+  up(&SB_JOURNAL(p_s_sb)->j_lock);
 }
 
 /*
@@ -754,7 +752,6 @@
   atomic_set(&(jl->j_commit_flushing), 0) ;
   wake_up(&(jl->j_commit_wait)) ;
 
-  s->s_dirt = 1 ;
   return 0 ;
 }
 
@@ -1218,7 +1215,6 @@
     if (run++ == 0) {
         goto loop_start ;
     }
-
     atomic_set(&(jl->j_flushing), 0) ;
     wake_up(&(jl->j_flush_wait)) ;
     return ret ;
@@ -1248,7 +1244,7 @@
     while(i != start) {
         jl = SB_JOURNAL_LIST(s) + i  ;
         age = CURRENT_TIME - jl->j_timestamp ;
-        if (jl->j_len > 0 && // age >= (JOURNAL_MAX_COMMIT_AGE * 2) && 
+        if (jl->j_len > 0 && age >= JOURNAL_MAX_COMMIT_AGE && 
             atomic_read(&(jl->j_nonzerolen)) > 0 &&
             atomic_read(&(jl->j_commit_left)) == 0) {
 
@@ -1323,6 +1319,10 @@
 static int do_journal_release(struct reiserfs_transaction_handle *th, struct super_block *p_s_sb, int error) {
   struct reiserfs_transaction_handle myth ;
 
+  down(&kreiserfsd_sem);
+  list_del(&p_s_sb->u.reiserfs_sb.s_reiserfs_supers);
+  up(&kreiserfsd_sem);
+
   /* we only want to flush out transactions if we were called with error == 0
   */
   if (!error && !(p_s_sb->s_flags & MS_RDONLY)) {
@@ -1773,10 +1773,6 @@
   jl = SB_JOURNAL_LIST(ct->p_s_sb) + ct->jindex ;
 
   flush_commit_list(ct->p_s_sb, SB_JOURNAL_LIST(ct->p_s_sb) + ct->jindex, 1) ; 
-  if (jl->j_len > 0 && atomic_read(&(jl->j_nonzerolen)) > 0 && 
-      atomic_read(&(jl->j_commit_left)) == 0) {
-    kupdate_one_transaction(ct->p_s_sb, jl) ;
-  }
   kfree(ct->self) ;
 }
 
@@ -1826,6 +1822,9 @@
 ** then run the per filesystem commit task queue when we wakeup.
 */
 static int reiserfs_journal_commit_thread(void *nullp) {
+  struct list_head *entry, *safe ;
+  struct super_block *s;
+  time_t last_run = 0;
 
   daemonize() ;
 
@@ -1841,6 +1840,18 @@
     while(TQ_ACTIVE(reiserfs_commit_thread_tq)) {
       run_task_queue(&reiserfs_commit_thread_tq) ;
     }
+    if (CURRENT_TIME - last_run > 5) {
+	down(&kreiserfsd_sem);
+	list_for_each_safe(entry, safe, &kreiserfsd_supers) {
+	    s = list_entry(entry, struct super_block, 
+	                   u.reiserfs_sb.s_reiserfs_supers);    
+	    if (!(s->s_flags & MS_RDONLY)) {
+		reiserfs_flush_old_commits(s);
+	    }
+	}
+	up(&kreiserfsd_sem);
+	last_run = CURRENT_TIME;
+    }
 
     /* if there aren't any more filesystems left, break */
     if (reiserfs_mounted_fs_count <= 0) {
@@ -1915,13 +1926,12 @@
   SB_JOURNAL(p_s_sb)->j_last = NULL ;	  
   SB_JOURNAL(p_s_sb)->j_first = NULL ;     
   init_waitqueue_head(&(SB_JOURNAL(p_s_sb)->j_join_wait)) ;
-  init_waitqueue_head(&(SB_JOURNAL(p_s_sb)->j_wait)) ; 
+  sema_init(&SB_JOURNAL(p_s_sb)->j_lock, 1);
 
   SB_JOURNAL(p_s_sb)->j_trans_id = 10 ;  
   SB_JOURNAL(p_s_sb)->j_mount_id = 10 ; 
   SB_JOURNAL(p_s_sb)->j_state = 0 ;
   atomic_set(&(SB_JOURNAL(p_s_sb)->j_jlock), 0) ;
-  atomic_set(&(SB_JOURNAL(p_s_sb)->j_wlock), 0) ;
   SB_JOURNAL(p_s_sb)->j_cnode_free_list = allocate_cnodes(num_cnodes) ;
   SB_JOURNAL(p_s_sb)->j_cnode_free_orig = SB_JOURNAL(p_s_sb)->j_cnode_free_list ;
   SB_JOURNAL(p_s_sb)->j_cnode_free = SB_JOURNAL(p_s_sb)->j_cnode_free_list ? num_cnodes : 0 ;
@@ -1951,6 +1961,7 @@
     kernel_thread((void *)(void *)reiserfs_journal_commit_thread, NULL,
                   CLONE_FS | CLONE_FILES | CLONE_VM) ;
   }
+  list_add(&p_s_sb->u.reiserfs_sb.s_reiserfs_supers, &kreiserfsd_supers);
   return 0 ;
 }
 
@@ -2079,7 +2090,6 @@
   th->t_trans_id = SB_JOURNAL(p_s_sb)->j_trans_id ;
   th->t_caller = "Unknown" ;
   unlock_journal(p_s_sb) ;
-  p_s_sb->s_dirt = 1; 
   return 0 ;
 }
 
@@ -2121,7 +2131,7 @@
     reiserfs_panic(th->t_super, "journal-1577: handle trans id %ld != current trans id %ld\n", 
                    th->t_trans_id, SB_JOURNAL(p_s_sb)->j_trans_id);
   }
-  p_s_sb->s_dirt = 1 ;
+  p_s_sb->s_dirt |= S_SUPER_DIRTY;
 
   prepared = test_and_clear_bit(BH_JPrepared, &bh->b_state) ;
   /* already in this transaction, we are done */
@@ -2369,12 +2379,8 @@
 ** flushes any old transactions to disk
 ** ends the current transaction if it is too old
 **
-** also calls flush_journal_list with old_only == 1, which allows me to reclaim
-** memory and such from the journal lists whose real blocks are all on disk.
-**
-** called by sync_dev_journal from buffer.c
 */
-int flush_old_commits(struct super_block *p_s_sb, int immediate) {
+int reiserfs_flush_old_commits(struct super_block *p_s_sb) {
   int i ;
   int count = 0;
   int start ; 
@@ -2391,8 +2397,7 @@
   /* starting with oldest, loop until we get to the start */
   i = (SB_JOURNAL_LIST_INDEX(p_s_sb) + 1) % JOURNAL_LIST_COUNT ;
   while(i != start) {
-    if (SB_JOURNAL_LIST(p_s_sb)[i].j_len > 0 && ((now - SB_JOURNAL_LIST(p_s_sb)[i].j_timestamp) > JOURNAL_MAX_COMMIT_AGE ||
-       immediate)) {
+    if (SB_JOURNAL_LIST(p_s_sb)[i].j_len > 0 && ((now - SB_JOURNAL_LIST(p_s_sb)[i].j_timestamp) > JOURNAL_MAX_COMMIT_AGE)) {
       /* we have to check again to be sure the current transaction did not change */
       if (i != SB_JOURNAL_LIST_INDEX(p_s_sb))  {
 	flush_commit_list(p_s_sb, SB_JOURNAL_LIST(p_s_sb) + i, 1) ;
@@ -2401,26 +2406,26 @@
     i = (i + 1) % JOURNAL_LIST_COUNT ;
     count++ ;
   }
+
   /* now, check the current transaction.  If there are no writers, and it is too old, finish it, and
   ** force the commit blocks to disk
   */
-  if (!immediate && atomic_read(&(SB_JOURNAL(p_s_sb)->j_wcount)) <= 0 &&  
+  if (atomic_read(&(SB_JOURNAL(p_s_sb)->j_wcount)) <= 0 &&  
      SB_JOURNAL(p_s_sb)->j_trans_start_time > 0 && 
      SB_JOURNAL(p_s_sb)->j_len > 0 && 
      (now - SB_JOURNAL(p_s_sb)->j_trans_start_time) > JOURNAL_MAX_TRANS_AGE) {
     journal_join(&th, p_s_sb, 1) ;
     reiserfs_prepare_for_journal(p_s_sb, SB_BUFFER_WITH_SB(p_s_sb), 1) ;
     journal_mark_dirty(&th, p_s_sb, SB_BUFFER_WITH_SB(p_s_sb)) ;
-    do_journal_end(&th, p_s_sb,1, COMMIT_NOW) ;
-  } else if (immediate) { /* belongs above, but I wanted this to be very explicit as a special case.  If they say to 
-                             flush, we must be sure old transactions hit the disk too. */
-    journal_join(&th, p_s_sb, 1) ;
-    reiserfs_prepare_for_journal(p_s_sb, SB_BUFFER_WITH_SB(p_s_sb), 1) ;
-    journal_mark_dirty(&th, p_s_sb, SB_BUFFER_WITH_SB(p_s_sb)) ;
+
+    /* we're only being called from kreiserfsd, it makes no sense to do
+    ** an async commit so that kreiserfsd can do it later
+    */
     do_journal_end(&th, p_s_sb,1, COMMIT_NOW | WAIT) ;
-  }
-   reiserfs_journal_kupdate(p_s_sb) ;
-   return 0 ;
+  } 
+  reiserfs_journal_kupdate(p_s_sb) ;
+
+  return S_SUPER_DIRTY_COMMIT;
 }
 
 /*
@@ -2459,7 +2464,7 @@
   if (SB_JOURNAL(p_s_sb)->j_len == 0) {
     int wcount = atomic_read(&(SB_JOURNAL(p_s_sb)->j_wcount)) ;
     unlock_journal(p_s_sb) ;
-    if (atomic_read(&(SB_JOURNAL(p_s_sb)->j_jlock))  > 0 && wcount <= 0) {
+    if (atomic_read(&(SB_JOURNAL(p_s_sb)->j_jlock)) > 0 && wcount <= 0) {
       atomic_dec(&(SB_JOURNAL(p_s_sb)->j_jlock)) ;
       wake_up(&(SB_JOURNAL(p_s_sb)->j_join_wait)) ;
     }
@@ -2730,6 +2735,7 @@
   ** it tells us if we should continue with the journal_end, or just return
   */
   if (!check_journal_end(th, p_s_sb, nblocks, flags)) {
+    p_s_sb->s_dirt |= S_SUPER_DIRTY;
     return 0 ;
   }
 
@@ -2899,17 +2905,12 @@
   /* write any buffers that must hit disk before this commit is done */
   fsync_inode_buffers(&(SB_JOURNAL(p_s_sb)->j_dummy_inode)) ;
 
-  /* honor the flush and async wishes from the caller */
+  /* honor the flush wishes from the caller, simple commits can
+  ** be done outside the journal lock, they are done below
+  */
   if (flush) {
-  
     flush_commit_list(p_s_sb, SB_JOURNAL_LIST(p_s_sb) + orig_jindex, 1) ;
     flush_journal_list(p_s_sb,  SB_JOURNAL_LIST(p_s_sb) + orig_jindex , 1) ;  
-  } else if (commit_now) {
-    if (wait_on_commit) {
-      flush_commit_list(p_s_sb, SB_JOURNAL_LIST(p_s_sb) + orig_jindex, 1) ;
-    } else {
-      commit_flush_async(p_s_sb, orig_jindex) ; 
-    }
   }
 
   /* reset journal values for the next transaction */
@@ -2971,6 +2972,16 @@
   atomic_set(&(SB_JOURNAL(p_s_sb)->j_jlock), 0) ;
   /* wake up any body waiting to join. */
   wake_up(&(SB_JOURNAL(p_s_sb)->j_join_wait)) ;
+  
+  if (!flush && commit_now) {
+    if (current->need_resched)
+      schedule() ;
+    if (wait_on_commit) {
+      flush_commit_list(p_s_sb, SB_JOURNAL_LIST(p_s_sb) + orig_jindex, 1) ;
+    } else {
+      commit_flush_async(p_s_sb, orig_jindex) ; 
+    }
+  }
   return 0 ;
 }
 
diff -uNr linux-2.4.18.original/fs/reiserfs/objectid.c linux-2.4.18.speedup/fs/reiserfs/objectid.c
--- linux-2.4.18.original/fs/reiserfs/objectid.c	Tue Feb 26 15:52:56 2002
+++ linux-2.4.18.speedup/fs/reiserfs/objectid.c	Wed Apr 10 10:35:57 2002
@@ -86,7 +86,6 @@
     }
 
     journal_mark_dirty(th, s, SB_BUFFER_WITH_SB (s));
-    s->s_dirt = 1;
     return unused_objectid;
 }
 
@@ -105,8 +104,6 @@
 
     reiserfs_prepare_for_journal(s, SB_BUFFER_WITH_SB(s), 1) ;
     journal_mark_dirty(th, s, SB_BUFFER_WITH_SB (s)); 
-    s->s_dirt = 1;
-
 
     /* start at the beginning of the objectid map (i = 0) and go to
        the end of it (i = disk_sb->s_oid_cursize).  Linear search is
diff -uNr linux-2.4.18.original/fs/reiserfs/stree.c linux-2.4.18.speedup/fs/reiserfs/stree.c
--- linux-2.4.18.original/fs/reiserfs/stree.c	Tue Feb 26 15:53:01 2002
+++ linux-2.4.18.speedup/fs/reiserfs/stree.c	Wed Apr 10 10:36:18 2002
@@ -594,26 +594,32 @@
 
 
 
-#ifdef SEARCH_BY_KEY_READA
+#define SEARCH_BY_KEY_READA 32
 
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
@@ -656,6 +662,9 @@
     int				n_node_level, n_retval;
     int 			right_neighbor_of_leaf_node;
     int				fs_gen;
+    struct buffer_head *reada_bh[SEARCH_BY_KEY_READA];
+    unsigned long      reada_blocks[SEARCH_BY_KEY_READA];
+    int reada_count = 0;
 
 #ifdef CONFIG_REISERFS_CHECK
     int n_repeat_counter = 0;
@@ -689,11 +698,11 @@
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
@@ -781,11 +790,20 @@
 	   position in the node. */
 	n_block_number = B_N_CHILD_NUM(p_s_bh, p_s_last_element->pe_position);
 
-#ifdef SEARCH_BY_KEY_READA
-	/* if we are going to read leaf node, then calculate its right neighbor if possible */
-	if (n_node_level == DISK_LEAF_NODE_LEVEL + 1 && p_s_last_element->pe_position < B_NR_ITEMS (p_s_bh))
-	    right_neighbor_of_leaf_node = B_N_CHILD_NUM(p_s_bh, p_s_last_element->pe_position + 1);
-#endif
+	/* if we are going to read leaf node, then try to find good leaves
+	** for read ahead as well.  Don't bother for stat data though
+	*/
+	if (reiserfs_test4(p_s_sb) && 
+	    n_node_level == DISK_LEAF_NODE_LEVEL + 1 && 
+	    p_s_last_element->pe_position < B_NR_ITEMS (p_s_bh) &&
+	    !is_statdata_cpu_key(p_s_key))
+	{
+	    int pos = p_s_last_element->pe_position;
+	    int limit = B_NR_ITEMS(p_s_bh);
+	    while(pos <= limit && reada_count < SEARCH_BY_KEY_READA) { 
+	        reada_blocks[reada_count++] = B_N_CHILD_NUM(p_s_bh, pos++);
+	    }
+        }
     }
 }
 
diff -uNr linux-2.4.18.original/fs/reiserfs/super.c linux-2.4.18.speedup/fs/reiserfs/super.c
--- linux-2.4.18.original/fs/reiserfs/super.c	Tue Feb 26 15:53:01 2002
+++ linux-2.4.18.speedup/fs/reiserfs/super.c	Wed Apr 10 10:35:57 2002
@@ -29,23 +29,22 @@
 static int reiserfs_remount (struct super_block * s, int * flags, char * data);
 static int reiserfs_statfs (struct super_block * s, struct statfs * buf);
 
-//
-// a portion of this function, particularly the VFS interface portion,
-// was derived from minix or ext2's analog and evolved as the
-// prototype did. You should be able to tell which portion by looking
-// at the ext2 code and comparing. It's subfunctions contain no code
-// used as a template unless they are so labeled.
-//
+/* kreiserfsd does all the periodic stuff for us */
 static void reiserfs_write_super (struct super_block * s)
 {
+    s->s_dirt = S_SUPER_DIRTY_COMMIT;
+}
 
-  int dirty = 0 ;
-  lock_kernel() ;
-  if (!(s->s_flags & MS_RDONLY)) {
-    dirty = flush_old_commits(s, 1) ;
-  }
-  s->s_dirt = dirty;
-  unlock_kernel() ;
+static void reiserfs_commit_super (struct super_block * s)
+{
+    struct reiserfs_transaction_handle th;
+    lock_kernel() ;
+    if (!(s->s_flags & MS_RDONLY)) {
+	journal_begin(&th, s, 1);
+	journal_end_sync(&th, s, 1);
+	s->s_dirt = 0;
+    }
+    unlock_kernel() ;
 }
 
 //
@@ -411,6 +410,7 @@
   put_super: reiserfs_put_super,
   write_super: reiserfs_write_super,
   write_super_lockfs: reiserfs_write_super_lockfs,
+  commit_super: reiserfs_commit_super,
   unlockfs: reiserfs_unlockfs,
   statfs: reiserfs_statfs,
   remount_fs: reiserfs_remount,
@@ -907,6 +907,7 @@
 
 
     memset (&s->u.reiserfs_sb, 0, sizeof (struct reiserfs_sb_info));
+    INIT_LIST_HEAD(&s->u.reiserfs_sb.s_reiserfs_supers);
 
     if (parse_options ((char *) data, &(s->u.reiserfs_sb.s_mount_opt), &blocks) == 0) {
 	return NULL;
diff -uNr linux-2.4.18.original/fs/super.c linux-2.4.18.speedup/fs/super.c
--- linux-2.4.18.original/fs/super.c	Tue Feb 26 15:53:01 2002
+++ linux-2.4.18.speedup/fs/super.c	Wed Apr 10 10:35:57 2002
@@ -453,15 +453,68 @@
 	put_super(sb);
 }
 
+/* since we've added the idea of comit_dirty vs regular dirty with
+ * commit_super operation, only use the S_SUPER_DIRTY mask if 
+ * the FS has a commit_super op.
+ */
+static inline int super_dirty(struct super_block *sb)
+{
+	if (sb->s_op && sb->s_op->commit_super) {
+		return sb->s_dirt & S_SUPER_DIRTY;
+	}
+	return sb->s_dirt;
+}
+
+
 static inline void write_super(struct super_block *sb)
 {
 	lock_super(sb);
-	if (sb->s_root && sb->s_dirt)
+	if (sb->s_root && super_dirty(sb))
 		if (sb->s_op && sb->s_op->write_super)
 			sb->s_op->write_super(sb);
 	unlock_super(sb);
 }
 
+static inline void commit_super(struct super_block *sb)
+{
+	lock_super(sb);
+	if (sb->s_root && sb->s_dirt) {
+		if (sb->s_op && sb->s_op->write_super)
+			sb->s_op->write_super(sb);
+		if (sb->s_op && sb->s_op->commit_super)
+			sb->s_op->commit_super(sb);
+	}
+	unlock_super(sb);
+}
+
+void commit_supers(kdev_t dev)
+{
+	struct super_block * sb;
+
+	if (dev) {
+		sb = get_super(dev);
+		if (sb) {
+			if (sb->s_dirt)
+				commit_super(sb);
+			drop_super(sb);
+		}
+	}
+restart:
+	spin_lock(&sb_lock);
+	sb = sb_entry(super_blocks.next);
+	while (sb != sb_entry(&super_blocks))
+		if (sb->s_dirt) {
+			sb->s_count++;
+			spin_unlock(&sb_lock);
+			down_read(&sb->s_umount);
+			commit_super(sb);
+			drop_super(sb);
+			goto restart;
+		} else
+			sb = sb_entry(sb->s_list.next);
+	spin_unlock(&sb_lock);
+}
+
 /*
  * Note: check the dirty flag before waiting, so we don't
  * hold up the sync while mounting a device. (The newly
@@ -484,7 +537,7 @@
 	spin_lock(&sb_lock);
 	sb = sb_entry(super_blocks.next);
 	while (sb != sb_entry(&super_blocks))
-		if (sb->s_dirt) {
+		if (super_dirty(sb)) {
 			sb->s_count++;
 			spin_unlock(&sb_lock);
 			down_read(&sb->s_umount);
diff -uNr linux-2.4.18.original/include/linux/fs.h linux-2.4.18.speedup/include/linux/fs.h
--- linux-2.4.18.original/include/linux/fs.h	Mon Mar 18 13:40:14 2002
+++ linux-2.4.18.speedup/include/linux/fs.h	Wed Apr 10 10:35:57 2002
@@ -697,6 +697,10 @@
 
 #define sb_entry(list)	list_entry((list), struct super_block, s_list)
 #define S_BIAS (1<<30)
+
+/* flags for the s_dirt field */
+#define S_SUPER_DIRTY 1
+#define S_SUPER_DIRTY_COMMIT 2
 struct super_block {
 	struct list_head	s_list;		/* Keep this first */
 	kdev_t			s_dev;
@@ -909,6 +913,7 @@
 	struct dentry * (*fh_to_dentry)(struct super_block *sb, __u32 *fh, int len, int fhtype, int parent);
 	int (*dentry_to_fh)(struct dentry *, __u32 *fh, int *lenp, int need_parent);
 	int (*show_options)(struct seq_file *, struct vfsmount *);
+	void (*commit_super) (struct super_block *);
 };
 
 /* Inode state bits.. */
@@ -1216,6 +1221,7 @@
 extern int filemap_fdatasync(struct address_space *);
 extern int filemap_fdatawait(struct address_space *);
 extern void sync_supers(kdev_t);
+extern void commit_supers(kdev_t);
 extern int bmap(struct inode *, int);
 extern int notify_change(struct dentry *, struct iattr *);
 extern int permission(struct inode *, int);
diff -uNr linux-2.4.18.original/include/linux/reiserfs_fs.h linux-2.4.18.speedup/include/linux/reiserfs_fs.h
--- linux-2.4.18.original/include/linux/reiserfs_fs.h	Mon Mar 18 13:41:14 2002
+++ linux-2.4.18.speedup/include/linux/reiserfs_fs.h	Wed Apr 10 10:35:57 2002
@@ -1502,6 +1502,7 @@
 */
 #define JOURNAL_BUFFER(j,n) ((j)->j_ap_blocks[((j)->j_start + (n)) % JOURNAL_BLOCK_COUNT])
 
+int reiserfs_flush_old_commits(struct super_block *);
 void reiserfs_commit_for_inode(struct inode *) ;
 void reiserfs_update_inode_transaction(struct inode *) ;
 void reiserfs_wait_on_write_block(struct super_block *s) ;
diff -uNr linux-2.4.18.original/include/linux/reiserfs_fs_sb.h linux-2.4.18.speedup/include/linux/reiserfs_fs_sb.h
--- linux-2.4.18.original/include/linux/reiserfs_fs_sb.h	Mon Mar 18 13:40:14 2002
+++ linux-2.4.18.speedup/include/linux/reiserfs_fs_sb.h	Wed Apr 10 10:36:09 2002
@@ -281,8 +281,7 @@
   */
   struct reiserfs_page_list *j_flush_pages ;
   time_t j_trans_start_time ;         /* time this transaction started */
-  wait_queue_head_t j_wait ;         /* wait  journal_end to finish I/O */
-  atomic_t j_wlock ;                       /* lock for j_wait */
+  struct semaphore j_lock ;
   wait_queue_head_t j_join_wait ;    /* wait for current transaction to finish before starting new one */
   atomic_t j_jlock ;                       /* lock for j_join_wait */
   int j_journal_list_index ;	      /* journal list number of the current trans */
@@ -428,6 +427,7 @@
     int s_is_unlinked_ok;
     reiserfs_proc_info_data_t s_proc_info_data;
     struct proc_dir_entry *procdir;
+    struct list_head s_reiserfs_supers;
 };
 
 /* Definitions of reiserfs on-disk properties: */
@@ -491,7 +491,6 @@
 void reiserfs_file_buffer (struct buffer_head * bh, int list);
 int reiserfs_is_super(struct super_block *s)  ;
 int journal_mark_dirty(struct reiserfs_transaction_handle *, struct super_block *, struct buffer_head *bh) ;
-int flush_old_commits(struct super_block *s, int) ;
 int show_reiserfs_locks(void) ;
 int reiserfs_resize(struct super_block *, unsigned long) ;
 
diff -uNr linux-2.4.18.original/mm/filemap.c linux-2.4.18.speedup/mm/filemap.c
--- linux-2.4.18.original/mm/filemap.c	Tue Feb 26 15:53:01 2002
+++ linux-2.4.18.speedup/mm/filemap.c	Wed Apr 10 10:36:18 2002
@@ -1241,6 +1241,7 @@
 	/* Mark the page referenced, AFTER checking for previous usage.. */
 	SetPageReferenced(page);
 }
+EXPORT_SYMBOL(mark_page_accessed);
 
 /*
  * This is a generic file read routine, and uses the
@@ -2826,6 +2827,14 @@
 	}
 }
 
+static void update_inode_times(struct inode *inode) 
+{
+	time_t now = CURRENT_TIME;
+	if (inode->i_ctime != now || inode->i_mtime != now) {
+	    inode->i_ctime = inode->i_mtime = now;
+	    mark_inode_dirty_sync(inode);
+	} 
+}
 /*
  * Write to a file through the page cache. 
  *
@@ -2955,8 +2964,7 @@
 		goto out;
 
 	remove_suid(inode);
-	inode->i_ctime = inode->i_mtime = CURRENT_TIME;
-	mark_inode_dirty_sync(inode);
+	update_inode_times(inode);
 
 	if (file->f_flags & O_DIRECT)
 		goto o_direct;

--mP3DRpeJDSE+ciuQ--
