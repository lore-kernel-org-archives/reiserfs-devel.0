From: Chris Mason <mason@suse.com>
Subject: Re: reiserfs v3 patches updated
Date: Tue, 06 Apr 2004 17:10:52 -0400
Message-ID: <1081285851.30813.269.camel@watt.suse.com>
References: <1081210239.4994.69.camel@watt.suse.com>
	 <200404061838.05099.christian.mayrhuber@gmx.net>
	 <4072F6F1.3090806@mweb.co.za> <1081277245.30813.81.camel@watt.suse.com>
	 <4073022E.3090100@mweb.co.za> <1081279465.30829.128.camel@watt.suse.com>
	 <40730ABD.3070507@mweb.co.za> <1081283607.30811.206.camel@watt.suse.com>
	 <4073186C.3010601@mweb.co.za>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-xWXByjsfcBXaTggXtC0U"
Return-path: <reiserfs-list-return-17767-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4073186C.3010601@mweb.co.za>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Cami <camis@mweb.co.za>
Cc: reiserfs-list@namesys.com

--=-xWXByjsfcBXaTggXtC0U
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2004-04-06 at 16:51, Cami wrote:
> >>>>The majority of the rest of the machines iowait hover around the 1%
> >>>>mark.. CPU time tends to be about the same, just the iowait is much
> >>>>much higher..
> >>>
> >>>Very interesting.  data=ordered makes fsync more expensive, since it
> >>>ends up syncing more then just the buffers for that one file.  Could you
> >>>please try removing data=ordered from machine1?
> >>
> >>Ok.. after leaving it for a few minutes..
> > 
> > I'm a little slow today.  data=ordered is the default with these
> > patches.  You need to mount -o data=writeback.
> 
> data=writeback yields pretty much the same iowait results..
> (machine 1+2 are around 5%->8% whereas machine 3->8 are at around 0.8%)

This is so much faster I'm worried the io isn't actually getting done. 
In the mail server benchmark I use (synctest -n 1 -t 50 -f -F), the time
went from 2m15s to 43s.  The old 2m15s was still faster then I used to
get with unpatched reiserfs.

I'm posting this for the truly brave among you and a little review.  I
need to do more tests on it.  The basic idea is to make sure we don't
start writeback on the log buffers and metadata if someone is already
doing it.

Also, the reiserfs work queue is not kicked during transaction end if
some other process is going to do the commit.  This saves a lot of
context switches.

-chris


--=-xWXByjsfcBXaTggXtC0U
Content-Disposition: attachment; filename=reiserfs-delayed-work
Content-Type: text/x-patch; name=reiserfs-delayed-work; charset=iso-8859-1
Content-Transfer-Encoding: 7bit

Index: linux.mm/fs/reiserfs/journal.c
===================================================================
--- linux.mm.orig/fs/reiserfs/journal.c	2004-04-05 17:46:12.000000000 -0400
+++ linux.mm/fs/reiserfs/journal.c	2004-04-06 17:00:25.391877520 -0400
@@ -86,6 +86,7 @@ static struct workqueue_struct *commit_w
 /* journal list state bits */
 #define LIST_TOUCHED 1
 #define LIST_DIRTY   2
+#define LIST_COMMIT_PENDING  4		/* someone will commit this list */
 
 /* flags for do_journal_end */
 #define FLUSH_ALL   1		/* flush commit and real blocks */
@@ -2484,7 +2485,9 @@ static void let_transaction_grow(struct 
 {
     unsigned long bcount = SB_JOURNAL(sb)->j_bcount;
     while(1) {
-	yield();
+	set_current_state(TASK_UNINTERRUPTIBLE);
+	schedule_timeout(1);
+	SB_JOURNAL(sb)->j_current_jl->j_state |= LIST_COMMIT_PENDING;
         while ((atomic_read(&SB_JOURNAL(sb)->j_wcount) > 0 ||
 	        atomic_read(&SB_JOURNAL(sb)->j_jlock)) &&
 	       SB_JOURNAL(sb)->j_trans_id == trans_id) {
@@ -2920,9 +2923,15 @@ static void flush_async_commits(void *p)
       flush_commit_list(p_s_sb, jl, 1);
   }
   unlock_kernel();
-  atomic_inc(&SB_JOURNAL(p_s_sb)->j_async_throttle);
-  filemap_fdatawrite(p_s_sb->s_bdev->bd_inode->i_mapping);
-  atomic_dec(&SB_JOURNAL(p_s_sb)->j_async_throttle);
+  /*
+   * this is a little racey, but there's no harm in missing
+   * the filemap_fdata_write
+   */
+  if (!atomic_read(&SB_JOURNAL(p_s_sb)->j_async_throttle)) {
+      atomic_inc(&SB_JOURNAL(p_s_sb)->j_async_throttle);
+      filemap_fdatawrite(p_s_sb->s_bdev->bd_inode->i_mapping);
+      atomic_dec(&SB_JOURNAL(p_s_sb)->j_async_throttle);
+  }
 }
 
 /*
@@ -3011,7 +3020,8 @@ static int check_journal_end(struct reis
 
       jl = SB_JOURNAL(p_s_sb)->j_current_jl;
       trans_id = jl->j_trans_id;
-
+      if (wait_on_commit)
+        jl->j_state |= LIST_COMMIT_PENDING;
       atomic_set(&(SB_JOURNAL(p_s_sb)->j_jlock), 1) ;
       if (flush) {
         SB_JOURNAL(p_s_sb)->j_next_full_flush = 1 ;
@@ -3533,8 +3543,8 @@ static int do_journal_end(struct reiserf
   if (flush) {
     flush_commit_list(p_s_sb, jl, 1) ;
     flush_journal_list(p_s_sb, jl, 1) ;
-  } else
-    queue_work(commit_wq, &SB_JOURNAL(p_s_sb)->j_work);
+  } else if (!(jl->j_state & LIST_COMMIT_PENDING))
+    queue_delayed_work(commit_wq, &SB_JOURNAL(p_s_sb)->j_work, HZ/10);
 
 
   /* if the next transaction has any chance of wrapping, flush 

--=-xWXByjsfcBXaTggXtC0U--

