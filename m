From: Jeff Mahoney <jeffm@suse.com>
Subject: [PATCH] reiserfs: skip commit on io error
Date: Wed, 14 Dec 2005 14:38:36 -0500
Message-ID: <20051214193836.GA5982@locomotive.unixthugs.org>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S932426AbVLNTih@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@osdl.org>, Linus Torvalds <torvalds@osdl.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc: ReiserFS List <reiserfs-list@namesys.com>

 This should have been part of the original io error patch, but got dropped
 somewhere along the way.

 It's extremely important when handling the i/o error in the journal to not
 commit the transaction with corrupt data. This patch adds that code back in.

 fs/reiserfs/journal.c |   17 +++++++++++++----
 1 files changed, 13 insertions(+), 4 deletions(-)

Signed-off-by: Jeff Mahoney <jeffm@suse.com>

diff -ruNpX dontdiff linux-2.6.14.orig/fs/reiserfs/journal.c linux-2.6.14.fixed/fs/reiserfs/journal.c
--- linux-2.6.14.orig/fs/reiserfs/journal.c	2005-10-27 20:02:08.000000000 -0400
+++ linux-2.6.14.fixed/fs/reiserfs/journal.c	2005-12-05 17:15:59.000000000 -0500
@@ -1039,6 +1039,10 @@ static int flush_commit_list(struct supe
 	}
 	atomic_dec(&journal->j_async_throttle);
 
+	/* We're skipping the commit if there's an error */
+	if (retval || reiserfs_is_journal_aborted(journal))
+		barrier = 0;
+
 	/* wait on everything written so far before writing the commit
 	 * if we are in barrier mode, send the commit down now
 	 */
@@ -1077,10 +1081,16 @@ static int flush_commit_list(struct supe
 	BUG_ON(atomic_read(&(jl->j_commit_left)) != 1);
 
 	if (!barrier) {
-		if (buffer_dirty(jl->j_commit_bh))
-			BUG();
-		mark_buffer_dirty(jl->j_commit_bh);
-		sync_dirty_buffer(jl->j_commit_bh);
+		/* If there was a write error in the journal - we can't commit
+		 * this transaction - it will be invalid and, if successful,
+		 * will just end up propogating the write error out to
+		 * the file system. */
+		if (likely(!retval && !reiserfs_is_journal_aborted (journal))) {
+			if (buffer_dirty(jl->j_commit_bh))
+				BUG();
+			mark_buffer_dirty(jl->j_commit_bh) ;
+			sync_dirty_buffer(jl->j_commit_bh) ;
+		}
 	} else
 		wait_on_buffer(jl->j_commit_bh);
 
-- 
Jeff Mahoney
SuSE Labs
