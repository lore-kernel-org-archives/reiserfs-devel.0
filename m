From: Oleg Drokin <green@namesys.com>
Subject: Re: Horrible ftruncate performance
Date: Tue, 15 Jul 2003 21:05:40 +0400
Message-ID: <20030715170540.GA1213@namesys.com>
References: <Pine.LNX.4.30.0307151407100.6563-100000@divine.city.tvnet.hu> <200307151848.59027.Dieter.Nuetzel@hamburg.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14943-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200307151848.59027.Dieter.Nuetzel@hamburg.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dieter N?tzel <Dieter.Nuetzel@hamburg.de>
Cc: Chris Mason <mason@suse.com>, Szakacsits Szabolcs <szaka@sienet.hu>, Carl-Daniel Hailfinger <c-d.hailfinger.kernel.2003@gmx.net>, reiserfs-list@namesys.com

Hello!

On Tue, Jul 15, 2003 at 06:48:58PM +0200, Dieter N?tzel wrote:

> !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
> The 'right' questions are:
> * Are the 204,804 MB really needed?

In reiserfs - yes.

> * How many space do XFS, JFS and ext3 'use'?

ext2 uses 16 kb for me (4k blocksize)

> * When the above three can do it a 1000 times faster why can't we?

We can, only in case of reiserfs we have nasty races if we do that.
Or may be not. I have something to discuss around, I guess ;)

> * Do the three other do it right?

I do not know.

> Removing of the sparse files can take horrible amount of time.

Does the patch below helps?

> If I 'create' a second sparse file with the same name over an existing one 
> (overwrite) I get the 1000 times speedup!

Hm. Interesting observation.

> Chris and Oleg what do you need?
> SYSRQ-P/M?

I guess I need additional pair of brains ;)
Also some time that I can spend thinking about all of this.
I guess I'd have plently of it in the Saturday, while flying to Canada.
Only I won't be able to do any experiments. Sigh.

Bye,
    Oleg

===== fs/reiserfs/stree.c 1.22 vs edited =====
--- 1.22/fs/reiserfs/stree.c	Tue Jun 24 11:30:22 2003
+++ edited/fs/reiserfs/stree.c	Tue Jul 15 20:57:09 2003
@@ -1773,6 +1773,8 @@
 	  journal_begin(th, p_s_inode->i_sb, orig_len_alloc) ;
 	  reiserfs_update_inode_transaction(p_s_inode) ;
 	}
+	if ( current->need_resched )
+	    schedule();
     } while ( n_file_size > ROUND_UP (n_new_file_size) &&
 	      search_for_position_by_key(p_s_inode->i_sb, &s_item_key, &s_search_path) == POSITION_FOUND )  ;
 
