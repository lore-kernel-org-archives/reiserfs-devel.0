From: Chris Mason <mason@suse.com>
Subject: Re: speedup patch for 2.4.19-pre6
Date: 12 Apr 2002 09:05:37 -0400
Message-ID: <1018616737.14483.109.camel@tiny>
References: <200204112344.41906.Dieter.Nuetzel@hamburg.de> 
	<20020412085300.A6171@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10056-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <20020412085300.A6171@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Drokin <green@namesys.com>
Cc: Dieter N?tzel <Dieter.Nuetzel@hamburg.de>, ReiserFS List <reiserfs-list@namesys.com>

Hello everyone,

Here is a slightly different version of the speedup patch.  The only
real change is how the commit_super call interfaces with the VFS layer,
performance should be the same.

Hugh Dickins supplied the changes to fs/super.c that allow a filesystem
to leave the dirty flag set, so with this patch reiserfs leaves the
super dirty all the time, and only clears it on sync().

bk receivable patch at the end, parented against rev 1.388 from
Marcelo's tree.

-chris

ChangeSet@1.391, 2002-04-12 08:54:50-04:00, mason@suse.com
  Change reiserfs journal lock to a semaphore, increases performance
  by reducing lots of calls to wakeup when nobody is waiting.

ChangeSet@1.390, 2002-04-11 15:58:02-04:00, mason@suse.com
  Use super_op->commit_super for sync, and write_super only for
  periodic updates.  This allows the journaled filesystems to avoid
  triggering a commit on every write_super call.

ChangeSet@1.389, 2002-04-11 14:48:14-04:00, mason@suse.com
  change so that sync_supers doesn't have to restart
  after each dirty super.  It allows the FS to leave the
  dirty bit set during a write_super call.
  
  From veritas (Hugh Dickins)

diff -Nru a/fs/buffer.c b/fs/buffer.c
--- a/fs/buffer.c	Fri Apr 12 08:55:59 2002
+++ b/fs/buffer.c	Fri Apr 12 08:55:59 2002
@@ -325,6 +325,8 @@
 	lock_super(sb);
 	if (sb->s_dirt && sb->s_op && sb->s_op->write_super)
 		sb->s_op->write_super(sb);
+	if (sb->s_op && sb->s_op->commit_super)
+		sb->s_op->commit_super(sb);
 	unlock_super(sb);
 	unlock_kernel();
 
@@ -344,7 +346,7 @@
 	lock_kernel();
 	sync_inodes(dev);
 	DQUOT_SYNC(dev);
-	sync_supers(dev);
+	commit_supers(dev);
 	unlock_kernel();
 
 	return sync_buffers(dev, 1);
diff -Nru a/fs/reiserfs/bitmap.c b/fs/reiserfs/bitmap.c
--- a/fs/reiserfs/bitmap.c	Fri Apr 12 08:55:59 2002
+++ b/fs/reiserfs/bitmap.c	Fri Apr 12 08:55:59 2002
@@ -122,7 +122,6 @@
   set_sb_free_blocks( rs, sb_free_blocks(rs) + 1 );
 
   journal_mark_dirty (th, s, sbh);
-  s->s_dirt = 1;
 }
 
 void reiserfs_free_block (struct reiserfs_transaction_handle *th, 
@@ -433,7 +432,6 @@
   /* update free block count in super block */
   PUT_SB_FREE_BLOCKS( s, SB_FREE_BLOCKS(s) - init_amount_needed );
   journal_mark_dirty (th, s, SB_BUFFER_WITH_SB (s));
-  s->s_dirt = 1;
 
   return CARRY_ON;
 }
diff -Nru a/fs/reiserfs/ibalance.c b/fs/reiserfs/ibalance.c
--- a/fs/reiserfs/ibalance.c	Fri Apr 12 08:55:59 2002
+++ b/fs/reiserfs/ibalance.c	Fri Apr 12 08:55:59 2002
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
diff -Nru a/fs/reiserfs/journal.c b/fs/reiserfs/journal.c
--- a/fs/reiserfs/journal.c	Fri Apr 12 08:55:59 2002
+++ b/fs/reiserfs/journal.c	Fri Apr 12 08:55:59 2002
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
 
 #define JOURNAL_TRANS_HALF 1018   /* must be correct to keep the desc and commit
 				     structs at 4k */
@@ -576,17 +579,12 @@
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
@@ -756,7 +754,6 @@
   atomic_set(&(jl->j_commit_flushing), 0) ;
   wake_up(&(jl->j_commit_wait)) ;
 
-  s->s_dirt = 1 ;
   return 0 ;
 }
 
@@ -1220,7 +1217,6 @@
     if (run++ == 0) {
         goto loop_start ;
     }
-
     atomic_set(&(jl->j_flushing), 0) ;
     wake_up(&(jl->j_flush_wait)) ;
     return ret ;
@@ -1250,7 +1246,7 @@
     while(i != start) {
         jl = SB_JOURNAL_LIST(s) + i  ;
         age = CURRENT_TIME - jl->j_timestamp ;
-        if (jl->j_len > 0 && // age >= (JOURNAL_MAX_COMMIT_AGE * 2) && 
+        if (jl->j_len > 0 && age >= JOURNAL_MAX_COMMIT_AGE && 
             atomic_read(&(jl->j_nonzerolen)) > 0 &&
             atomic_read(&(jl->j_commit_left)) == 0) {
 
@@ -1325,6 +1321,10 @@
 static int do_journal_release(struct reiserfs_transaction_handle *th, struct super_block *p_s_sb, int error) {
   struct reiserfs_transaction_handle myth ;
 
+  down(&kreiserfsd_sem);
+  list_del(&p_s_sb->u.reiserfs_sb.s_reiserfs_supers);
+  up(&kreiserfsd_sem);
+
   /* we only want to flush out transactions if we were called with error == 0
   */
   if (!error && !(p_s_sb->s_flags & MS_RDONLY)) {
@@ -1811,10 +1811,6 @@
   jl = SB_JOURNAL_LIST(ct->p_s_sb) + ct->jindex ;
 
   flush_commit_list(ct->p_s_sb, SB_JOURNAL_LIST(ct->p_s_sb) + ct->jindex, 1) ; 
-  if (jl->j_len > 0 && atomic_read(&(jl->j_nonzerolen)) > 0 && 
-      atomic_read(&(jl->j_commit_left)) == 0) {
-    kupdate_one_transaction(ct->p_s_sb, jl) ;
-  }
   reiserfs_kfree(ct->self, sizeof(struct reiserfs_journal_commit_task), ct->p_s_sb) ;
 }
 
@@ -1864,6 +1860,9 @@
 ** then run the per filesystem commit task queue when we wakeup.
 */
 static int reiserfs_journal_commit_thread(void *nullp) {
+  struct list_head *entry, *safe ;
+  struct super_block *s;
+  time_t last_run = 0;
 
   daemonize() ;
 
@@ -1879,6 +1878,18 @@
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
@@ -1953,13 +1964,12 @@
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
@@ -1989,6 +1999,9 @@
     kernel_thread((void *)(void *)reiserfs_journal_commit_thread, NULL,
                   CLONE_FS | CLONE_FILES | CLONE_VM) ;
   }
+  down(&kreiserfsd_sem);
+  list_add(&p_s_sb->u.reiserfs_sb.s_reiserfs_supers, &kreiserfsd_supers);
+  up(&kreiserfsd_sem);
   return 0 ;
 }
 
@@ -2117,7 +2130,6 @@
   th->t_trans_id = SB_JOURNAL(p_s_sb)->j_trans_id ;
   th->t_caller = "Unknown" ;
   unlock_journal(p_s_sb) ;
-  p_s_sb->s_dirt = 1; 
   return 0 ;
 }
 
@@ -2159,7 +2171,7 @@
     reiserfs_panic(th->t_super, "journal-1577: handle trans id %ld != current trans id %ld\n", 
                    th->t_trans_id, SB_JOURNAL(p_s_sb)->j_trans_id);
   }
-  p_s_sb->s_dirt = 1 ;
+  p_s_sb->s_dirt = 1;
 
   prepared = test_and_clear_bit(BH_JPrepared, &bh->b_state) ;
   /* already in this transaction, we are done */
@@ -2407,12 +2419,8 @@
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
@@ -2429,8 +2437,7 @@
   /* starting with oldest, loop until we get to the start */
   i = (SB_JOURNAL_LIST_INDEX(p_s_sb) + 1) % JOURNAL_LIST_COUNT ;
   while(i != start) {
-    if (SB_JOURNAL_LIST(p_s_sb)[i].j_len > 0 && ((now - SB_JOURNAL_LIST(p_s_sb)[i].j_timestamp) > JOURNAL_MAX_COMMIT_AGE ||
-       immediate)) {
+    if (SB_JOURNAL_LIST(p_s_sb)[i].j_len > 0 && ((now - SB_JOURNAL_LIST(p_s_sb)[i].j_timestamp) > JOURNAL_MAX_COMMIT_AGE)) {
       /* we have to check again to be sure the current transaction did not change */
       if (i != SB_JOURNAL_LIST_INDEX(p_s_sb))  {
 	flush_commit_list(p_s_sb, SB_JOURNAL_LIST(p_s_sb) + i, 1) ;
@@ -2439,26 +2446,26 @@
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
+  return p_s_sb->s_dirt;
 }
 
 /*
@@ -2497,7 +2504,7 @@
   if (SB_JOURNAL(p_s_sb)->j_len == 0) {
     int wcount = atomic_read(&(SB_JOURNAL(p_s_sb)->j_wcount)) ;
     unlock_journal(p_s_sb) ;
-    if (atomic_read(&(SB_JOURNAL(p_s_sb)->j_jlock))  > 0 && wcount <= 0) {
+    if (atomic_read(&(SB_JOURNAL(p_s_sb)->j_jlock)) > 0 && wcount <= 0) {
       atomic_dec(&(SB_JOURNAL(p_s_sb)->j_jlock)) ;
       wake_up(&(SB_JOURNAL(p_s_sb)->j_join_wait)) ;
     }
@@ -2768,6 +2775,7 @@
   ** it tells us if we should continue with the journal_end, or just return
   */
   if (!check_journal_end(th, p_s_sb, nblocks, flags)) {
+    p_s_sb->s_dirt = 1;
     return 0 ;
   }
 
diff -Nru a/fs/reiserfs/objectid.c b/fs/reiserfs/objectid.c
--- a/fs/reiserfs/objectid.c	Fri Apr 12 08:55:59 2002
+++ b/fs/reiserfs/objectid.c	Fri Apr 12 08:55:59 2002
@@ -87,7 +87,6 @@
     }
 
     journal_mark_dirty(th, s, SB_BUFFER_WITH_SB (s));
-    s->s_dirt = 1;
     return unused_objectid;
 }
 
@@ -106,8 +105,6 @@
 
     reiserfs_prepare_for_journal(s, SB_BUFFER_WITH_SB(s), 1) ;
     journal_mark_dirty(th, s, SB_BUFFER_WITH_SB (s)); 
-    s->s_dirt = 1;
-
 
     /* start at the beginning of the objectid map (i = 0) and go to
        the end of it (i = disk_sb->s_oid_cursize).  Linear search is
diff -Nru a/fs/reiserfs/super.c b/fs/reiserfs/super.c
--- a/fs/reiserfs/super.c	Fri Apr 12 08:55:59 2002
+++ b/fs/reiserfs/super.c	Fri Apr 12 08:55:59 2002
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
+    return;
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
@@ -58,7 +57,6 @@
 static void reiserfs_write_super_lockfs (struct super_block * s)
 {
 
-  int dirty = 0 ;
   struct reiserfs_transaction_handle th ;
   lock_kernel() ;
   if (!(s->s_flags & MS_RDONLY)) {
@@ -68,7 +66,7 @@
     reiserfs_block_writes(&th) ;
     journal_end(&th, s, 1) ;
   }
-  s->s_dirt = dirty;
+  s->s_dirt = 0;
   unlock_kernel() ;
 }
 
@@ -357,6 +355,7 @@
   ** to do a journal_end
   */
   journal_release(&th, s) ;
+  s->s_dirt = 0;
 
   for (i = 0; i < SB_BMAP_NR (s); i ++)
     brelse (SB_AP_BITMAP (s)[i]);
@@ -413,6 +412,7 @@
   put_super: reiserfs_put_super,
   write_super: reiserfs_write_super,
   write_super_lockfs: reiserfs_write_super_lockfs,
+  commit_super: reiserfs_commit_super,
   unlockfs: reiserfs_unlockfs,
   statfs: reiserfs_statfs,
   remount_fs: reiserfs_remount,
@@ -968,6 +968,7 @@
 

     memset (&s->u.reiserfs_sb, 0, sizeof (struct reiserfs_sb_info));
+    INIT_LIST_HEAD(&s->u.reiserfs_sb.s_reiserfs_supers);
 
     if (parse_options ((char *) data, &(s->u.reiserfs_sb.s_mount_opt), &blocks) == 0) {
 	return NULL;
diff -Nru a/fs/super.c b/fs/super.c
--- a/fs/super.c	Fri Apr 12 08:55:59 2002
+++ b/fs/super.c	Fri Apr 12 08:55:59 2002
@@ -441,12 +441,23 @@
 	unlock_super(sb);
 }
 
+static inline void commit_super(struct super_block *sb)
+{
+	lock_super(sb);
+	if (sb->s_root && sb->s_dirt)
+		if (sb->s_op && sb->s_op->write_super)
+			sb->s_op->write_super(sb);
+		if (sb->s_op && sb->s_op->commit_super)
+			sb->s_op->commit_super(sb);
+	unlock_super(sb);
+}
+
 /*
  * Note: check the dirty flag before waiting, so we don't
  * hold up the sync while mounting a device. (The newly
  * mounted device won't need syncing.)
  */
-void sync_supers(kdev_t dev)
+static void dirty_super_op(kdev_t dev, void (*func)(struct super_block *))
 {
 	struct super_block * sb;
 
@@ -454,7 +465,7 @@
 		sb = get_super(dev);
 		if (sb) {
 			if (sb->s_dirt)
-				write_super(sb);
+				func(sb);
 			drop_super(sb);
 		}
 		return;
@@ -467,7 +478,7 @@
 			sb->s_count++;
 			spin_unlock(&sb_lock);
 			down_read(&sb->s_umount);
-			write_super(sb);
+			func(sb);
 			up_read(&sb->s_umount);
 			spin_lock(&sb_lock);
 			if (!--sb->s_count) {
@@ -479,6 +490,16 @@
 		sb = sb_entry(sb->s_list.next);
 	}
 	spin_unlock(&sb_lock);
+}
+
+void sync_supers(kdev_t dev)
+{
+    dirty_super_op(dev, write_super);
+}
+
+void commit_supers(kdev_t dev)
+{
+    dirty_super_op(dev, commit_super);
 }
 
 /**
diff -Nru a/include/linux/fs.h b/include/linux/fs.h
--- a/include/linux/fs.h	Fri Apr 12 08:55:59 2002
+++ b/include/linux/fs.h	Fri Apr 12 08:55:59 2002
@@ -918,6 +918,7 @@
 	struct dentry * (*fh_to_dentry)(struct super_block *sb, __u32 *fh, int len, int fhtype, int parent);
 	int (*dentry_to_fh)(struct dentry *, __u32 *fh, int *lenp, int need_parent);
 	int (*show_options)(struct seq_file *, struct vfsmount *);
+	void (*commit_super) (struct super_block *);
 };
 
 /* Inode state bits.. */
@@ -1226,6 +1227,7 @@
 extern int filemap_fdatasync(struct address_space *);
 extern int filemap_fdatawait(struct address_space *);
 extern void sync_supers(kdev_t);
+extern void commit_supers(kdev_t);
 extern int bmap(struct inode *, int);
 extern int notify_change(struct dentry *, struct iattr *);
 extern int permission(struct inode *, int);
diff -Nru a/include/linux/reiserfs_fs.h b/include/linux/reiserfs_fs.h
--- a/include/linux/reiserfs_fs.h	Fri Apr 12 08:55:59 2002
+++ b/include/linux/reiserfs_fs.h	Fri Apr 12 08:55:59 2002
@@ -1533,6 +1533,7 @@
 */
 #define JOURNAL_BUFFER(j,n) ((j)->j_ap_blocks[((j)->j_start + (n)) % JOURNAL_BLOCK_COUNT])
 
+int reiserfs_flush_old_commits(struct super_block *);
 void reiserfs_commit_for_inode(struct inode *) ;
 void reiserfs_update_inode_transaction(struct inode *) ;
 void reiserfs_wait_on_write_block(struct super_block *s) ;
diff -Nru a/include/linux/reiserfs_fs_sb.h b/include/linux/reiserfs_fs_sb.h
--- a/include/linux/reiserfs_fs_sb.h	Fri Apr 12 08:55:59 2002
+++ b/include/linux/reiserfs_fs_sb.h	Fri Apr 12 08:55:59 2002
@@ -291,8 +291,7 @@
   */
   struct reiserfs_page_list *j_flush_pages ;
   time_t j_trans_start_time ;         /* time this transaction started */
-  wait_queue_head_t j_wait ;         /* wait  journal_end to finish I/O */
-  atomic_t j_wlock ;                       /* lock for j_wait */
+  struct semaphore j_lock ;
   wait_queue_head_t j_join_wait ;    /* wait for current transaction to finish before starting new one */
   atomic_t j_jlock ;                       /* lock for j_join_wait */
   int j_journal_list_index ;	      /* journal list number of the current trans */
@@ -444,6 +443,7 @@
     int s_is_unlinked_ok;
     reiserfs_proc_info_data_t s_proc_info_data;
     struct proc_dir_entry *procdir;
+    struct list_head s_reiserfs_supers;
 };
 
 /* Definitions of reiserfs on-disk properties: */
@@ -510,7 +510,6 @@
 void reiserfs_file_buffer (struct buffer_head * bh, int list);
 int reiserfs_is_super(struct super_block *s)  ;
 int journal_mark_dirty(struct reiserfs_transaction_handle *, struct super_block *, struct buffer_head *bh) ;
-int flush_old_commits(struct super_block *s, int) ;
 int show_reiserfs_locks(void) ;
 int reiserfs_resize(struct super_block *, unsigned long) ;
 

================================================================


This BitKeeper patch contains the following changesets:
1.389..1.391
## Wrapped with gzip_uu ##


begin 664 bkpatch12243
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
*_P%;+27JSS(`````
`
end

