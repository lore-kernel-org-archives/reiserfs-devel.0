From: Oleg Drokin <green@namesys.com>
Subject: Re: merge 2.4.21-pre4 with Direct IO bug fix
Date: Tue, 4 Mar 2003 11:18:07 +0300
Message-ID: <20030304111807.A18814@namesys.com>
References: <20030304013450.249cc096.philippe.gramoulle@mmania.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13057-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20030304013450.249cc096.philippe.gramoulle@mmania.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Philippe Gramoull? <philippe.gramoulle@mmania.com>
Cc: Chris Mason <mason@suse.com>, reiserfs <reiserfs-list@namesys.com>

Hello!

On Tue, Mar 04, 2003 at 01:34:50AM +0100, Philippe Gramoull? wrote:

> Could you please rediff the patch for the DIRECT IO bug fix (pre5) against 2.4.21-pre4 + 
> data-logging patches ? ( I've tried to merge it manually, but there are too many non trivial rejects
> for me to dare feeling comfortable :o)

Is it possible for you to use 2.4.21-pre5 instead of 2.4.21-pre4?
Patches from ftp://ftp.suse.com/pub/people/mason/patches/data-logging/2.4.21
should apply just fine, except that you need to apply my version of 05-data-logging... patch.
You can get it from ftp://namesys.com/pub/reiserfs-for-2.4/testing/05-2.4.21-pre5-data-logging-36.diff.gz

Also we have not merged that journal overflow patch (deleting highly-fragmented files) anywhere yet,
as you reported you had hangs with it and running quotacheck. Below is the patch you should apply on top of
all Chris' patches for this overflow fix.

Also another patch you probably want to apply is my iget5_locked bugfix for 2.4,
You can find it at ftp://namesys.com/pub/reiserfs-for-2.4/testing/iget5_locked_for_2.4.21-pre5-datalogging.diff.gz
it should be applied on top of datalogging/quota stuff I mentioned above.

Bye,
    Oleg

--- fs/reiserfs/stree.c.orig	Tue Mar  4 10:55:33 2003
+++ fs/reiserfs/stree.c	Tue Mar  4 10:57:30 2003
@@ -1125,6 +1125,19 @@
 		put_block_num(p_n_unfm_pointer, 0, 0);
 		journal_mark_dirty (th, p_s_sb, p_s_bh);
 		reiserfs_free_block(th, inode, tmp, 1);
+		/* In case of big fragmentation it is possible that each block
+		   freed will cause dirtying of one more bitmap and then we will
+		   quickly overflow our transaction space. This is a
+		   counter-measure against that scenario */
+		if (journal_transaction_should_end(th, th->t_blocks_allocated)) {
+		    int len = th->t_blocks_allocated;
+		    pathrelse(p_s_path) ;
+		    reiserfs_restart_transaction(th, len) ;
+		    reiserfs_update_inode_transaction(inode) ;
+		    need_research = 1;
+		    break;
+		}
+
 		if ( item_moved (&s_ih, p_s_path) )  {
 			need_research = 1;
 			break ;
