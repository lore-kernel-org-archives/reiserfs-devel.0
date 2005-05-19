From: Jan Kara <jack@suse.cz>
Subject: [PATCH] Make reiserfs BUG on too big transaction
Date: Thu, 19 May 2005 11:36:13 +0200
Message-ID: <20050519093613.GB1871@atrey.karlin.mff.cuni.cz>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="k1lZvvs/B4yU6o8G"
Return-path: <reiserfs-list-return-24080-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com
Cc: mason@suse.com, akpm@osdl.org

--k1lZvvs/B4yU6o8G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

  Hello!

  Attached patch makes reiserfs BUG() when somebody tries to start a
larger transaction than it's allowed (currently the code just silently
deadlocks). I think this is a better behaviour. Can you please apply the
patch?

								Honza

--k1lZvvs/B4yU6o8G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="reiser-2.6.12-rc4-1-bigtrans.diff"

Make kernel BUG when someone tries to start a transaction which is too
large.

Signed-off-by: Jan Kara <jack@suse.cz>

diff -rup linux-2.6.12-rc4/fs/reiserfs/journal.c linux-2.6.12-rc4-reiserassert/fs/reiserfs/journal.c
--- linux-2.6.12-rc4/fs/reiserfs/journal.c	Sat May 14 13:02:01 2005
+++ linux-2.6.12-rc4-reiserassert/fs/reiserfs/journal.c	Sat May 14 13:21:43 2005
@@ -2631,6 +2631,8 @@ static int do_journal_begin_r(struct rei
   int retval;
 
   reiserfs_check_lock_depth(p_s_sb, "journal_begin") ;
+  if (nblocks > journal->j_trans_max)
+	BUG();
 
   PROC_INFO_INC( p_s_sb, journal.journal_being );
   /* set here for journal_join */

--k1lZvvs/B4yU6o8G--
