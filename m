From: Oleg Drokin <green@namesys.com>
Subject: Re: 2.4.18 & journal_mark_dirty?
Date: Thu, 13 Mar 2003 11:45:38 +0300
Message-ID: <20030313114538.A8610@namesys.com>
References: <3E704476.9090601@dotcom.pl>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13240-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3E704476.9090601@dotcom.pl>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: myciel <myciel@dotcom.pl>
Cc: reiserfs-list@namesys.com

Hello!

On Thu, Mar 13, 2003 at 09:42:30AM +0100, myciel wrote:

> I run nfs server using reiserfs on 2.4.18 + NFSALL patches, and
> I've just got "nice" oops.  System did not crash, but anyway I had to 
> reboot to restart nfs.
> Could You please tell me if  "journal_mark_dirty:...." in following log 
> is harmless or not?

No, it is not.
Here's the patch. You need the patch, otherwise you would see this message
quite often when trying to delete/truncate certain file.

Bye,
    Oleg

# This is a BitKeeper generated patch for the following project:
# Project Name: Linux kernel tree
# This patch format is intended for GNU patch command version 2.5 or higher.
# This patch includes the following deltas:
#	           ChangeSet	1.1009  -> 1.1010 
#	 fs/reiserfs/stree.c	1.20    -> 1.21   
#
# The following is the BitKeeper ChangeSet Log
# --------------------------------------------
# 03/03/04	green@angband.namesys.com	1.1010
# reiserfs: Fix possible transaction overflow when deleting highly fragmented large files.
# 
# --------------------------------------------
#
diff -Nru a/fs/reiserfs/stree.c b/fs/reiserfs/stree.c
--- a/fs/reiserfs/stree.c	Thu Mar 13 11:44:43 2003
+++ b/fs/reiserfs/stree.c	Thu Mar 13 11:44:43 2003
@@ -1125,6 +1125,21 @@
 		journal_mark_dirty (th, p_s_sb, p_s_bh);
 		inode->i_blocks -= p_s_sb->s_blocksize / 512;
 		reiserfs_free_block(th, tmp);
+		/* In case of big fragmentation it is possible that each block
+		   freed will cause dirtying of one more bitmap and then we will
+		   quickly overflow our transaction space. This is a
+		   counter-measure against that scenario */
+		if (journal_transaction_should_end(th, th->t_blocks_allocated)) {
+		    int orig_len_alloc = th->t_blocks_allocated ;
+		    pathrelse(p_s_path) ;
+
+		    journal_end(th, p_s_sb, orig_len_alloc) ;
+		    journal_begin(th, p_s_sb, orig_len_alloc) ;
+		    reiserfs_update_inode_transaction(inode) ;
+		    need_research = 1;
+		    break;
+		}
+
 		if ( item_moved (&s_ih, p_s_path) )  {
 			need_research = 1;
 			break ;
