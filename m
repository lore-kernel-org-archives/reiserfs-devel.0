From: Chris Mason <mason@suse.com>
Subject: Re: Oops with in nfsd - 2.4.19-pre6
Date: 13 Nov 2002 21:33:17 -0500
Message-ID: <1037241197.288.206.camel@tiny>
References: <20021031210828.45F4A216991@server5.fastmail.fm>
	<1036099804.14984.165.camel@tiny>
	<20021112182949.45436c95.philippe.gramoulle@mmania.com>
	<1037211258.288.97.camel@tiny> 
	<20021113194008.6dadeed5.philippe.gramoulle@mmania.com> 
	<1037219001.21957.151.camel@tiny>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11989-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1037219001.21957.151.camel@tiny>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Chris Mason <mason@suse.com>
Cc: Philippe =?ISO-8859-1?Q?Gramoull=E9?= <philippe.gramoulle@mmania.com>, reiserfs-list@namesys.com

On Wed, 2002-11-13 at 15:23, Chris Mason wrote:

> > Being unable to run the quota anyway with 2.4.19-pre6,as it would make the filer crash, i upgraded to
> > 2.4.20rc1 + data-logging patches and mounted the fs witn noatime,nodiratime and data=journal
> 
> Ok, I'll make a patch against that.

Ok, I'm sending a beta of the patch, it has been through light testing. 
I'm going to run extended tests overnight (in data=journal mode for
Philippe), but I wanted to give Philippe the chance to use this on his
own non-critical machines as well.

The patch is fairly simple, but the code involved can be very subtle to
I'm trying to be as cautious as possible.

This is against 2.4.20-rc1 + the data logging code.  It should fix
possible transaction overflows in the journal by pre-reserving space in
the transaction during unbounded operations (truncate and hole
creation).

It also shows that I owe namesys 1 beer, because it makes hole creation
a whole lot faster (I've been blaming the balancing code for poor hole
creation speed).

-chris

--- 1.40/fs/reiserfs/inode.c	Wed Nov 13 17:47:56 2002
+++ edited/fs/reiserfs/inode.c	Wed Nov 13 19:20:39 2002
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
+++ edited/fs/reiserfs/journal.c	Wed Nov 13 21:23:47 2002
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
+++ edited/fs/reiserfs/stree.c	Wed Nov 13 19:29:01 2002
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
+++ edited/include/linux/reiserfs_fs.h	Wed Nov 13 19:29:32 2002
@@ -1806,7 +1806,7 @@
 int push_journal_writer(char *w) ;
 int pop_journal_writer(int windex) ;
 int journal_transaction_should_end(struct reiserfs_transaction_handle *, int) ;
-int reiserfs_restart_transaction(struct reiserfs_transaction_handle *) ;
+int reiserfs_restart_transaction(struct reiserfs_transaction_handle *, int) ;
 int reiserfs_in_journal(struct super_block *p_s_sb, kdev_t dev, int bmap_nr, int bit_nr, int size, int searchall, unsigned int *next) ;
 int journal_begin(struct reiserfs_transaction_handle *, struct super_block *p_s_sb, unsigned long) ;
 

