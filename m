From: Jan Kara <jack@suse.cz>
Subject: [PATCH] Fix assertion failure in reiserfs+journaled quotas
Date: Mon, 9 Jan 2006 22:25:42 +0100
Message-ID: <20060109212542.GB1232@atrey.karlin.mff.cuni.cz>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="C7zPtVaVf+AK4Oqc"
Return-path: <reiserfs-list-return-27646-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com
Cc: akpm@osdl.org

--C7zPtVaVf+AK4Oqc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

  Hello,

  attached patch fixes assertion failure caused by journaled quotas run
on reiserfs. The problem is when there are some files with preallocated
blocks and we decide to close the transaction. At that point all
preallocation is discarded. Quota code needs to record the amount of
freed blocks into quota file but the handle of the transaction in
current->journal_info has already refcount 0 and so reiserfs check fails
because quota code tries to nest into a transaction with refcount < 1.
  Attached patch just temporarily raises the refcount for the time of
discarding the preallocation - that should be pretty safe as we are
still holding the reference in fact. As the needed blocks for quota
operation are already attached to the transaction from the previous
allocation (that must have taken place in the same transaction) we don't
have to be afraid about growing the transaction...
  The patch is against 2.6.14 but should apply fine against newer
kernels too. Andrew, could you please put the fix into -mm if there are
no objections? Thanks.

								Honza


--C7zPtVaVf+AK4Oqc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="reiser-2.6.14-1-prealloc_oops.diff"

Sometimes we call do_journal_end() with t_refcount == 0. If quota is turned on
and we happen to have some inode with preallocation bad things happen as we try
to use the current handle for quota operations. Checks for t_refcount in
journal_begin() fail and we Oops. We raise t_refcount to make those checks
happy. We should not cause any bad as all the needed quota blocks should be
already attached to the transaction (they were attached to the transaction
when we allocated those preallocation blocks).

Signed-off-by: Jan Kara <jack@suse.cz>

diff -rupX /home/jack/.kerndiffexclude linux-2.6.14/fs/reiserfs/journal.c linux-2.6.14-1-reiser_prealloc_oops/fs/reiserfs/journal.c
--- linux-2.6.14/fs/reiserfs/journal.c	2005-11-24 16:27:30.000000000 +0100
+++ linux-2.6.14-1-reiser_prealloc_oops/fs/reiserfs/journal.c	2006-01-08 01:48:28.000000000 +0100
@@ -3906,10 +3906,13 @@ static int do_journal_end(struct reiserf
 		flush = 1;
 	}
 #ifdef REISERFS_PREALLOCATE
-	/* quota ops might need to nest, setup the journal_info pointer for them */
+	/* quota ops might need to nest, setup the journal_info pointer for them
+	 * and raise the refcount so that it is > 0. */
 	current->journal_info = th;
+	th->t_refcount++;
 	reiserfs_discard_all_prealloc(th);	/* it should not involve new blocks into
 						 * the transaction */
+	th->t_refcount--;
 	current->journal_info = th->t_handle_save;
 #endif
 

--C7zPtVaVf+AK4Oqc--
