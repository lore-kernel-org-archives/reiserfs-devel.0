From: Chris Mason <mason@suse.com>
Subject: Re: Strange errors with 2.4.22 patches (from Chris) and bonnie++
Date: Thu, 04 Dec 2003 11:33:17 -0500
Message-ID: <1070555596.27597.184.camel@tiny.suse.com>
References: <bq8f7u$ufn$1@sea.gmane.org>
	 <1070286549.12807.22.camel@tiny.suse.com> <bqhisl$7il$1@sea.gmane.org>
	 <1070478784.27611.105.camel@tiny.suse.com>  <bqna7g$8gg$1@sea.gmane.org>
	 <1070555322.27612.181.camel@tiny.suse.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-YwCjYveAaxdvMtWkFEqe"
Return-path: <reiserfs-list-return-16227-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1070555322.27612.181.camel@tiny.suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Jens Benecke <jens-unibw@spamfreemail.de>
Cc: reiserfs-list@namesys.com

--=-YwCjYveAaxdvMtWkFEqe
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2003-12-04 at 11:28, Chris Mason wrote:
> On Thu, 2003-12-04 at 07:44, Jens Benecke wrote:
> > Chris Mason wrote:
> > 
> > >> so... the worst-case impact on this bug is that reiserfs will report
> > >> "disk full" when you still have some space available. Right? No data
> > >> loss, corruption, or similar Bad Things(tm)?
> > >> 
> > > Correct.  I'll have a fix available today along with a remerge of data
> > > logging and quota against 2.4.23.
> 
> The -ENOSPC fix is attached, 2.6 should have the same bug (it was
> introduced with the new allocator) so I'm porting the fix there. 
> Basically after a data block allocation fails, we need to trigger and
> wait on a commit so we can reclaim any blocks freed in transactions that
> have not yet been comitted.

Hmpf, this time it is really attached.

-chris


--=-YwCjYveAaxdvMtWkFEqe
Content-Disposition: attachment; filename=01-reiserfs-free-blocks
Content-Type: text/plain; name=01-reiserfs-free-blocks; charset=iso-8859-1
Content-Transfer-Encoding: 7bit

%patch

trigger a commit when a data block allocation fails, this will
allow us to reclaim any blocks freed in uncommitted transactsions

diff -Nru a/fs/reiserfs/inode.c b/fs/reiserfs/inode.c
--- a/fs/reiserfs/inode.c	Wed Dec  3 18:13:01 2003
+++ b/fs/reiserfs/inode.c	Wed Dec  3 18:13:01 2003
@@ -628,7 +628,11 @@
 	    /* restart the transaction to give the journal a chance to free
 	    ** some blocks.  releases the path, so we have to go back to
 	    ** research if we succeed on the second try
+	    **
+	    ** the journal won't free the blocks if we don't force a commit
+	    ** and wait for it
 	    */
+	    SB_JOURNAL(inode->i_sb)->j_next_async_flush = 1;
 	    restart_transaction(&th, inode, &path) ; 
 	    repeat = _allocate_block(&th, block, inode, &allocated_block_nr, NULL, create);
 
diff -Nru a/fs/reiserfs/journal.c b/fs/reiserfs/journal.c
--- a/fs/reiserfs/journal.c	Wed Dec  3 18:13:01 2003
+++ b/fs/reiserfs/journal.c	Wed Dec  3 18:13:01 2003
@@ -2996,7 +2996,6 @@
   int jindex ;
   int orig_jindex ;
   int flush = flags & FLUSH_ALL ;
-  int commit_now = flags & COMMIT_NOW ;
   int wait_on_commit = flags & WAIT ;
   struct reiserfs_super_block *rs ; 
 
@@ -3010,8 +3009,8 @@
     flush = 1 ;
   }
   if (SB_JOURNAL(p_s_sb)->j_next_async_flush) {
-    flags |= COMMIT_NOW ;
-    commit_now = 1 ;
+    flags |= COMMIT_NOW | WAIT;
+    wait_on_commit = 1;
   }
 
   /* check_journal_end locks the journal, and unlocks if it does not return 1 
@@ -3025,9 +3024,6 @@
   if (SB_JOURNAL(p_s_sb)->j_next_full_flush) {
     flush = 1 ;
   }
-  if (SB_JOURNAL(p_s_sb)->j_next_async_flush) {
-    commit_now = 1 ;
-  }
   /*
   ** j must wait means we have to flush the log blocks, and the real blocks for
   ** this transaction
@@ -3191,15 +3187,12 @@
 
   /* honor the flush and async wishes from the caller */
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
+  } else if (wait_on_commit) {
+    flush_commit_list(p_s_sb, SB_JOURNAL_LIST(p_s_sb) + orig_jindex, 1) ;
+  } else {
+    commit_flush_async(p_s_sb, orig_jindex) ; 
   }
 
   /* reset journal values for the next transaction */
@@ -3263,6 +3256,3 @@
   wake_up(&(SB_JOURNAL(p_s_sb)->j_join_wait)) ;
   return 0 ;
 }
-
-
-

--=-YwCjYveAaxdvMtWkFEqe--

