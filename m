From: berthiaume_wayne@emc.com
Subject: RE: fsync() Performance Issue
Date: Tue, 30 Apr 2002 10:45:28 -0400
Message-ID: <93F527C91A6ED411AFE10050040665D0049BF97D@corpusmx1.us.dg.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10206-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mason@suse.com, green@namesys.com
Cc: berthiaume_wayne@emc.com, reiserfs-list@namesys.com

	Thanks. I'll start putting this one into test.
Wayne.

-----Original Message-----
From: Chris Mason [mailto:mason@suse.com]
Sent: Tuesday, April 30, 2002 10:28 AM
To: Oleg Drokin
Cc: berthiaume_wayne@emc.com; reiserfs-list@namesys.com
Subject: Re: [reiserfs-list] fsync() Performance Issue


On Tue, 2002-04-30 at 10:20, Oleg Drokin wrote:

> Attached is a speedup patch for 2.4.19-pre7 that should help your fsync
> operations a little. (From Chris Mason).
> Filesystem cannot do very much at this point unfortunatelly, it is ending
up
> waiting for disk to finish write operations.
> 
> Also we are working on other speedup patches that would cover different
areas
> of write perfomance itself.

A newer one (against 2.4.19-pre7) is below.  It has not been through as
much testing on the namesys side, which is why Oleg sent the older one.

Wayne and I have been talking in private mail, he's getting a bunch of
beta patches later today (this speedup, data logging, updated barrier
code).  Along with instructions for testing.

-chris

# Veritas (Hugh Dickins supplied the patch) sent the bits in
# fs/super.c that allow the FS to leave super->s_dirt set after a
# write_super call.
#
diff -urN --exclude *.orig parent/fs/buffer.c comp/fs/buffer.c
--- parent/fs/buffer.c	Mon Apr 29 10:20:24 2002
+++ comp/fs/buffer.c	Mon Apr 29 10:20:22 2002
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
diff -urN --exclude *.orig parent/fs/reiserfs/bitmap.c
comp/fs/reiserfs/bitmap.c
--- parent/fs/reiserfs/bitmap.c	Mon Apr 29 10:20:24 2002
+++ comp/fs/reiserfs/bitmap.c	Mon Apr 29 10:20:19 2002
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
diff -urN --exclude *.orig parent/fs/reiserfs/ibalance.c
comp/fs/reiserfs/ibalance.c
--- parent/fs/reiserfs/ibalance.c	Mon Apr 29 10:20:24 2002
+++ comp/fs/reiserfs/ibalance.c	Mon Apr 29 10:20:19 2002
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
diff -urN --exclude *.orig parent/fs/reiserfs/journal.c
comp/fs/reiserfs/journal.c
--- parent/fs/reiserfs/journal.c	Mon Apr 29 10:20:24 2002
+++ comp/fs/reiserfs/journal.c	Mon Apr 29 10:20:21 2002
@@ -64,12 +64,15 @@
 */
 static int reiserfs_mounted_fs_count = 0 ;
 
+static struct list_head kreiserfsd_supers =
LIST_HEAD_INIT(kreiserfsd_supers);
+
 /* wake this up when you add something to the commit thread task queue */
 DECLARE_WAIT_QUEUE_HEAD(reiserfs_commit_thread_wait) ;
 
 /* wait on this if you need to be sure you task queue entries have been run
*/
 static DECLARE_WAIT_QUEUE_HEAD(reiserfs_commit_thread_done) ;
 DECLARE_TASK_QUEUE(reiserfs_commit_thread_tq) ;
+DECLARE_MUTEX(kreiserfsd_sem) ;
 
 #define JOURNAL_TRANS_HALF 1018   /* must be correct to keep the desc and
commit
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
 static int do_journal_release(struct reiserfs_transaction_handle *th,
struct super_block *p_s_sb, int error) {
   struct reiserfs_transaction_handle myth ;
 
+  down(&kreiserfsd_sem);
+  list_del(&p_s_sb->u.reiserfs_sb.s_reiserfs_supers);
+  up(&kreiserfsd_sem);
+
   /* we only want to flush out transactions if we were called with error ==
0
   */
   if (!error && !(p_s_sb->s_flags & MS_RDONLY)) {
@@ -1811,10 +1811,6 @@
   jl = SB_JOURNAL_LIST(ct->p_s_sb) + ct->jindex ;
 
   flush_commit_list(ct->p_s_sb, SB_JOURNAL_LIST(ct->p_s_sb) + ct->jindex,
1) ; 
-  if (jl->j_len > 0 && atomic_read(&(jl->j_nonzerolen)) > 0 && 
-      atomic_read(&(jl->j_commit_left)) == 0) {
-    kupdate_one_transaction(ct->p_s_sb, jl) ;
-  }
   reiserfs_kfree(ct->self, sizeof(struct reiserfs_journal_commit_task),
ct->p_s_sb) ;
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
   SB_JOURNAL(p_s_sb)->j_cnode_free_orig =
SB_JOURNAL(p_s_sb)->j_cnode_free_list ;
   SB_JOURNAL(p_s_sb)->j_cnode_free = SB_JOURNAL(p_s_sb)->j_cnode_free_list
? num_cnodes : 0 ;
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
     reiserfs_panic(th->t_super, "journal-1577: handle trans id %ld !=
current trans id %ld\n", 
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
-** also calls flush_journal_list with old_only == 1, which allows me to
reclaim
-** memory and such from the journal lists whose real blocks are all on
disk.
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
-    if (SB_JOURNAL_LIST(p_s_sb)[i].j_len > 0 && ((now -
SB_JOURNAL_LIST(p_s_sb)[i].j_timestamp) > JOURNAL_MAX_COMMIT_AGE ||
-       immediate)) {
+    if (SB_JOURNAL_LIST(p_s_sb)[i].j_len > 0 && ((now -
SB_JOURNAL_LIST(p_s_sb)[i].j_timestamp) > JOURNAL_MAX_COMMIT_AGE)) {
       /* we have to check again to be sure the current transaction did not
change */
       if (i != SB_JOURNAL_LIST_INDEX(p_s_sb))  {
 	flush_commit_list(p_s_sb, SB_JOURNAL_LIST(p_s_sb) + i, 1) ;
@@ -2439,26 +2446,26 @@
     i = (i + 1) % JOURNAL_LIST_COUNT ;
     count++ ;
   }
+
   /* now, check the current transaction.  If there are no writers, and it
is too old, finish it, and
   ** force the commit blocks to disk
   */
-  if (!immediate && atomic_read(&(SB_JOURNAL(p_s_sb)->j_wcount)) <= 0 &&  
+  if (atomic_read(&(SB_JOURNAL(p_s_sb)->j_wcount)) <= 0 &&  
      SB_JOURNAL(p_s_sb)->j_trans_start_time > 0 && 
      SB_JOURNAL(p_s_sb)->j_len > 0 && 
      (now - SB_JOURNAL(p_s_sb)->j_trans_start_time) >
JOURNAL_MAX_TRANS_AGE) {
     journal_join(&th, p_s_sb, 1) ;
     reiserfs_prepare_for_journal(p_s_sb, SB_BUFFER_WITH_SB(p_s_sb), 1) ;
     journal_mark_dirty(&th, p_s_sb, SB_BUFFER_WITH_SB(p_s_sb)) ;
-    do_journal_end(&th, p_s_sb,1, COMMIT_NOW) ;
-  } else if (immediate) { /* belongs above, but I wanted this to be very
explicit as a special case.  If they say to 
-                             flush, we must be sure old transactions hit
the disk too. */
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
 
diff -urN --exclude *.orig parent/fs/reiserfs/objectid.c
comp/fs/reiserfs/objectid.c
--- parent/fs/reiserfs/objectid.c	Mon Apr 29 10:20:24 2002
+++ comp/fs/reiserfs/objectid.c	Mon Apr 29 10:20:19 2002
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
diff -urN --exclude *.orig parent/fs/reiserfs/super.c
comp/fs/reiserfs/super.c
--- parent/fs/reiserfs/super.c	Mon Apr 29 10:20:24 2002
+++ comp/fs/reiserfs/super.c	Mon Apr 29 10:20:19 2002
@@ -29,23 +29,22 @@
 static int reiserfs_remount (struct super_block * s, int * flags, char *
data);
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
 
     if (parse_options ((char *) data, &(s->u.reiserfs_sb.s_mount_opt),
&blocks) == 0) {
 	return NULL;
diff -urN --exclude *.orig parent/fs/super.c comp/fs/super.c
--- parent/fs/super.c	Mon Apr 29 10:20:24 2002
+++ comp/fs/super.c	Mon Apr 29 10:20:19 2002
@@ -396,6 +396,7 @@
 	struct file_system_type *fs = s->s_type;
 
 	spin_lock(&sb_lock);
+	s->s_type = NULL;
 	list_del(&s->s_list);
 	list_del(&s->s_instances);
 	spin_unlock(&sb_lock);
@@ -440,12 +441,23 @@
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
 
@@ -453,25 +465,41 @@
 		sb = get_super(dev);
 		if (sb) {
 			if (sb->s_dirt)
-				write_super(sb);
+				func(sb);
 			drop_super(sb);
 		}
 		return;
 	}
-restart:
 	spin_lock(&sb_lock);
+restart:
 	sb = sb_entry(super_blocks.next);
-	while (sb != sb_entry(&super_blocks))
+	while (sb != sb_entry(&super_blocks)) {
 		if (sb->s_dirt) {
 			sb->s_count++;
 			spin_unlock(&sb_lock);
 			down_read(&sb->s_umount);
-			write_super(sb);
-			drop_super(sb);
-			goto restart;
-		} else
-			sb = sb_entry(sb->s_list.next);
+			func(sb);
+			up_read(&sb->s_umount);
+			spin_lock(&sb_lock);
+			if (!--sb->s_count) {
+				destroy_super(sb);
+				goto restart;
+			} else if (!sb->s_type)
+				goto restart;
+		}
+		sb = sb_entry(sb->s_list.next);
+	}
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
diff -urN --exclude *.orig parent/include/linux/fs.h comp/include/linux/fs.h
--- parent/include/linux/fs.h	Mon Apr 29 10:20:24 2002
+++ comp/include/linux/fs.h	Mon Apr 29 10:20:19 2002
@@ -918,6 +918,7 @@
 	struct dentry * (*fh_to_dentry)(struct super_block *sb, __u32 *fh,
int len, int fhtype, int parent);
 	int (*dentry_to_fh)(struct dentry *, __u32 *fh, int *lenp, int
need_parent);
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
diff -urN --exclude *.orig parent/include/linux/reiserfs_fs.h
comp/include/linux/reiserfs_fs.h
--- parent/include/linux/reiserfs_fs.h	Mon Apr 29 10:20:24 2002
+++ comp/include/linux/reiserfs_fs.h	Mon Apr 29 10:20:19 2002
@@ -1533,6 +1533,7 @@
 */
 #define JOURNAL_BUFFER(j,n) ((j)->j_ap_blocks[((j)->j_start + (n)) %
JOURNAL_BLOCK_COUNT])
 
+int reiserfs_flush_old_commits(struct super_block *);
 void reiserfs_commit_for_inode(struct inode *) ;
 void reiserfs_update_inode_transaction(struct inode *) ;
 void reiserfs_wait_on_write_block(struct super_block *s) ;
diff -urN --exclude *.orig parent/include/linux/reiserfs_fs_sb.h
comp/include/linux/reiserfs_fs_sb.h
--- parent/include/linux/reiserfs_fs_sb.h	Mon Apr 29 10:20:24 2002
+++ comp/include/linux/reiserfs_fs_sb.h	Mon Apr 29 10:20:21 2002
@@ -291,8 +291,7 @@
   */
   struct reiserfs_page_list *j_flush_pages ;
   time_t j_trans_start_time ;         /* time this transaction started */
-  wait_queue_head_t j_wait ;         /* wait  journal_end to finish I/O */
-  atomic_t j_wlock ;                       /* lock for j_wait */
+  struct semaphore j_lock ;
   wait_queue_head_t j_join_wait ;    /* wait for current transaction to
finish before starting new one */
   atomic_t j_jlock ;                       /* lock for j_join_wait */
   int j_journal_list_index ;	      /* journal list number of the current
trans */
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
 int journal_mark_dirty(struct reiserfs_transaction_handle *, struct
super_block *, struct buffer_head *bh) ;
-int flush_old_commits(struct super_block *s, int) ;
 int show_reiserfs_locks(void) ;
 int reiserfs_resize(struct super_block *, unsigned long) ;
 
