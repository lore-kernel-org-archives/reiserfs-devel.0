From: Dieter =?iso-8859-15?q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Subject: Re: [PATCH] updated data=ordered patch for 2.6.3
Date: Mon, 23 Feb 2004 10:42:08 +0100
Message-ID: <200402231042.08173.Dieter.Nuetzel@hamburg.de>
References: <1077165373.22253.45.camel@watt.suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16885-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1077165373.22253.45.camel@watt.suse.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: Chris Mason <mason@suse.com>

Am Donnerstag, 19. Februar 2004 05:36 schrieb Chris Mason:
> Hello everyone,
>
> I've updated the reiserfs logging speedups and data=ordered support to
> 2.6.3, and fixed a few bugs:
>
> i_block count not properly updated on files with holes
> oops when the disk is full
> small files were not being packed into tails
>
> Also, the code has some extra performance tweaks to smooth out
> performance both with and without data=ordered.  There are new
> mechanisms to trigger metadata/commit block writeback and to help
> throttle writers.  The goal is to reduce the huge bursts of io during a
> commit and during data=ordered writeback.

On-top of SuSE 9.0, kernel 2.6.3-0:

01-reiserfs-journal-writer

Apply clean.


02-reiserfs-nesting
03-reiserfs-iosize

Are in.


04-reiserfs-logging
05-reiserfs-jh-3

Need some handwork due to ACLs.


You've forgotten in linux/fs/buffer.c
EXPORT_SYMBOL(try_to_release_page);
again ;-)


And the FIX in stree.c:

--- linux.test/fs/reiserfs/stree.c.1    2004-02-16 09:26:33.643567752 -0500
+++ linux.test/fs/reiserfs/stree.c      2004-02-16 09:27:24.166887040 -0500
@@ -1754,7 +1754,7 @@
          reiserfs_update_sd(th, p_s_inode) ;
 
          journal_end(th, p_s_inode->i_sb, orig_len_alloc) ;
-         journal_begin(th, p_s_inode->i_sb, orig_len_alloc) ;
+         journal_begin(th, p_s_inode->i_sb, JOURNAL_PER_BALANCE_CNT * 5) ;
          reiserfs_update_inode_transaction(p_s_inode) ;
        }
     } while ( n_file_size > ROUND_UP (n_new_file_size) &&


> I'm very interested in benchmarks here and info about how the patches
> feel for interactive performance.

Not, yet.
But same as with stree.c on 2.6.2-6.

Greetings,
	Dieter
