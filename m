From: Chris Mason <mason@suse.com>
Subject: Re: data-logging-20  BUG?!
Date: 29 Jul 2002 15:29:15 -0400
Message-ID: <1027970955.12087.6.camel@tiny>
References: <3D427179.2070401@mb.tu-ilmenau.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11094-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <3D427179.2070401@mb.tu-ilmenau.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>
Cc: reiserfs-list <reiserfs-list@namesys.com>

On Sat, 2002-07-27 at 06:10, Manuel Krause wrote:

> 
> After having upgraded from data-logging -19 to -20 and using it for some 
> hours I keep getting this bug (kernel BUG at journal.c:724!):

Ok, I've uploaded -21, and it should fix the BUG().  It was a debugging
check to make sure the journal code had properly sent all the ordered
buffers to disk before sending the commit down.  There was a race in -20
that broke this rule.

The oops should not have caused any corruptions, the incremental from
-20 to -21 is below.

-chris

diff -u comp/fs/reiserfs/journal.c comp/fs/reiserfs/journal.c
--- comp/fs/reiserfs/journal.c	Fri Jul 26 10:06:44 2002
+++ comp/fs/reiserfs/journal.c	Mon Jul 29 13:07:31 2002
@@ -3652,6 +3652,9 @@
 
   SB_JOURNAL(p_s_sb)->j_current_jl = alloc_journal_list(p_s_sb);
 
+  /* write any buffers that must hit disk before the commit is done */
+  fsync_buffers_list(&jl->j_ordered_bh_list);
+
   /* now it is safe to insert this transaction on the main list */
   list_add_tail(&jl->j_list, &SB_JOURNAL(p_s_sb)->j_journal_list);
   list_add_tail(&jl->j_working_list, &SB_JOURNAL(p_s_sb)->j_working_list);
@@ -3738,9 +3741,6 @@
   if (!(SB_JOURNAL(p_s_sb)->j_current_jl->j_list_bitmap)) {
     reiserfs_panic(p_s_sb, "journal-1996: do_journal_end, could not get a list bitmap\n") ;
   }
-
-  /* write any buffers that must hit disk before the commit is done */
-  fsync_buffers_list(&jl->j_ordered_bh_list);
 
   unlock_journal(p_s_sb) ;
   atomic_set(&(SB_JOURNAL(p_s_sb)->j_jlock), 0) ;

