From: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>
Subject: Re: 2.4.20 at kernel.org and data logging
Date: Fri, 17 Jan 2003 01:33:26 +0100
Message-ID: <3E274F56.9090208@mb.tu-ilmenau.de>
References: <0E18D85A21D2874080456C3B8A12E83E01009FAD@cof110avexu4.global.avaya.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------000507090308030307070403"
Return-path: <reiserfs-list-return-12417-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: "Sewell, Cassandra D (Cassandra)" <csewell@avaya.com>
Cc: reiserfs-list <reiserfs-list@namesys.com>

This is a multi-part message in MIME format.
--------------000507090308030307070403
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

On 01/17/2003 12:51 AM, Sewell, Cassandra D (Cassandra) wrote:
> Is the data logging patch for 2.4.20 kernel considered
> complete?  I see a patch at 
> ftp.suse.com/pub/people/mason/patches/data-logging/2.4.20.  Also will 
> this patch be considered working for the last stable 2.4.20 posted at 
> the kernel.org location? 
> 
> I am in the process of upgrading some machines from 2.2.x (I know way 
> overdue), and need the data-logging capability. 
> 
> 
> Thanks,
> 
> C. Sewell
> 

Hi Cassandra,

just apply these patches in the row they're numbered and mount the 
related partitions like you want, -o journal _or_ -o ordered (-o 
writeback represents the non data-logging standard/default so far).

If you want to mount a root fs you still need to pass 
rootflags=data=ordered (or =journal) to the kernel. Until the testing on 
2.4.21-preX is finished if I understood Chris correctly.

Chris posted a patch to the list as solution for an overflow bug hitting 
2.4.20-final and its -pres -- I'll attach it at the end so you needn't 
dig too far.

For my home system these patches have been stable since posting of that 
set and they're working with the related preempt-kernel-patch as well.


Currently I'm using the 2.4.21 version of these patches that have more 
improvements. Please, refer to Chris Masons original regarding mail to 
the list "[PATCH] data logging patches available for 2.4.21-preX".
BTW, I'm not getting system freezes like Anders Widman posted recently.

So to say, the patches are not really complete, but they seem very 
close... ;-))


Best regards,

Manuel


--------------000507090308030307070403
Content-Type: text/plain;
 name="patch-2.4.20.rfs.06.05-transaction-overflow-fix-0.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="patch-2.4.20.rfs.06.05-transaction-overflow-fix-0.diff"

--- 1.40/fs/reiserfs/inode.c	Wed Nov 13 17:47:56 2002
+++ linux/fs/reiserfs/inode.c	Wed Nov 13 19:20:39 2002
@@ -205,14 +205,15 @@
 }
 
 static void restart_transaction(struct reiserfs_transaction_handle *th,
-				struct inode *inode, struct path *path) {
+				struct inode *inode, struct path *path,
+				int jbegin_count) {
   /* we cannot restart while nested unless the parent allows it */
   if (!reiserfs_restartable_handle(th) && th->t_refcount > 1) {
       return  ;
   }
   pathrelse(path) ;
   reiserfs_update_sd(th, inode) ;
-  reiserfs_restart_transaction(th) ;
+  reiserfs_restart_transaction(th, jbegin_count) ;
   reiserfs_update_inode_transaction(inode) ;
 }
 
@@ -652,7 +653,7 @@
 	    ** some blocks.  releases the path, so we have to go back to
 	    ** research if we succeed on the second try
 	    */
-	    restart_transaction(th, inode, &path) ; 
+	    restart_transaction(th, inode, &path, jbegin_count) ; 
 	    repeat = _allocate_block(th, block, inode, &allocated_block_nr, NULL, create);
 
 	    if (repeat != NO_DISK_SPACE) {
@@ -882,8 +883,8 @@
 	** this only happens when inserting holes into the file, so it
 	** does not affect data=ordered safety at all
 	*/
-	if (journal_transaction_should_end(th, th->t_blocks_allocated)) {
-	    restart_transaction(th, inode, &path) ; 
+	if (journal_transaction_should_end(th, jbegin_count)) {
+	    restart_transaction(th, inode, &path, jbegin_count) ; 
 	}
 	/* inserting indirect pointers for a hole can take a 
 	** long time.  reschedule if needed
--- 1.25/fs/reiserfs/journal.c	Wed Nov 13 17:47:56 2002
+++ linux/fs/reiserfs/journal.c	Wed Nov 13 21:23:47 2002
@@ -2532,8 +2532,6 @@
 */
 int journal_transaction_should_end(struct reiserfs_transaction_handle *th, int new_alloc) {
   time_t now = CURRENT_TIME ;
-  if (reiserfs_dont_log(th->t_super)) 
-    return 0 ;
 
   /* cannot restart while nested unless the parent allows it */
   if (!reiserfs_restartable_handle(th) && th->t_refcount > 1)
@@ -2545,13 +2543,20 @@
        SB_JOURNAL(th->t_super)->j_cnode_free < (SB_JOURNAL_TRANS_MAX(th->t_super) * 3)) { 
     return 1 ;
   }
+
+  /* we are allowing them to continue in the current transaction, so
+  * we have to bump the blocks allocated now.
+  */
+  th->t_blocks_allocated += new_alloc;
+  SB_JOURNAL(th->t_super)->j_len_alloc += new_alloc;
+
   return 0 ;
 }
 
-int reiserfs_restart_transaction(struct reiserfs_transaction_handle *th) {
+int 
+reiserfs_restart_transaction(struct reiserfs_transaction_handle *th, int num) {
     int refcount = th->t_refcount ;
     struct super_block *s = th->t_super ;
-    int num = th->t_blocks_allocated ;
     int flags = th->t_flags ;
     int parent_flags = 0;
     struct reiserfs_transaction_handle *saved_th = current->journal_info ;
@@ -2568,7 +2573,7 @@
 	parent_flags = saved_th->t_flags ;
     }
     th->t_flags = 0 ;
-    journal_end(th, s, num) ;
+    journal_end(th, s, th->t_blocks_allocated) ;
     journal_begin(th, s, num) ;
     th->t_flags = flags; 
     if (refcount > 1) {
--- 1.21/fs/reiserfs/stree.c	Wed Nov 13 17:47:56 2002
+++ linux/fs/reiserfs/stree.c	Wed Nov 13 19:29:01 2002
@@ -1705,6 +1705,7 @@
 	n_new_file_size;/* New file size. */
     int                   n_deleted;      /* Number of deleted or truncated bytes. */
     int retval;
+    int jbegin_count = th->t_blocks_allocated;
 
     if ( ! (S_ISREG(p_s_inode->i_mode) || S_ISDIR(p_s_inode->i_mode) || S_ISLNK(p_s_inode->i_mode)) )
 	return;
@@ -1784,14 +1785,14 @@
 	** sure the file is consistent before ending the current trans
 	** and starting a new one
 	*/
-        if (journal_transaction_should_end(th, th->t_blocks_allocated)) {
+        if (journal_transaction_should_end(th, jbegin_count)) {
 	  decrement_counters_in_path(&s_search_path) ;
 
 	  if (update_timestamps) {
 	      p_s_inode->i_mtime = p_s_inode->i_ctime = CURRENT_TIME;
 	  } 
 	  reiserfs_update_sd(th, p_s_inode) ;
-	  reiserfs_restart_transaction(th) ;
+	  reiserfs_restart_transaction(th, jbegin_count) ;
 	  reiserfs_update_inode_transaction(p_s_inode) ;
 	}
     } while ( n_file_size > ROUND_UP (n_new_file_size) &&
--- 1.26/include/linux/reiserfs_fs.h	Wed Nov 13 17:47:56 2002
+++ linux/include/linux/reiserfs_fs.h	Wed Nov 13 19:29:32 2002
@@ -1806,7 +1806,7 @@
 int push_journal_writer(char *w) ;
 int pop_journal_writer(int windex) ;
 int journal_transaction_should_end(struct reiserfs_transaction_handle *, int) ;
-int reiserfs_restart_transaction(struct reiserfs_transaction_handle *) ;
+int reiserfs_restart_transaction(struct reiserfs_transaction_handle *, int) ;
 int reiserfs_in_journal(struct super_block *p_s_sb, kdev_t dev, int bmap_nr, int bit_nr, int size, int searchall, unsigned int *next) ;
 int journal_begin(struct reiserfs_transaction_handle *, struct super_block *p_s_sb, unsigned long) ;
 

--------------000507090308030307070403--

