From: Nikita Danilov <Nikita@Namesys.COM>
Subject: Re: BUG in reiserfs_write_full_page().
Date: Fri, 18 Jul 2003 17:45:16 +0400
Message-ID: <16151.63980.766223.769053@laputa.namesys.com>
References: <3F1712F6.7080204@polyserve.com>
	<1058477610.4012.333.camel@tiny.suse.com>
	<3F171ABF.6080601@polyserve.com>
	<1058534583.7878.351.camel@tiny.suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14963-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1058534583.7878.351.camel@tiny.suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Chris Mason <mason@suse.com>
Cc: Michael Gaughen <mgaughen@polyserve.com>, reiserfs-list@namesys.com

Chris Mason writes:
 > On Thu, 2003-07-17 at 17:53, Michael Gaughen wrote:
 > > Chris Mason wrote:
 > > 
 > > >
 > > >Hmmm, the allocation masks are supposed to be set such that writepage
 > > >won't get called.  I'll take a look.  How easy is it to reproduce?  If
 > > >you have any tests cases that can trigger it, please send them along.
 > > >
 > > 
 > > Actually, the problem may have to do with the common journal_info kept
 > > within the task structure.  Looking at ext3_writepage, they have this to 
 > > say:
 > > 
 > >         /*
 > >          * We give up here if we're reentered, because it might be
 > >          * for a different filesystem.  One *could* look for a
 > >          * nested transaction opportunity.
 > >          */
 > >         lock_kernel();
 > >         if (ext3_journal_current_handle())
 > >                 goto out_fail;
 > > 
 > > and in the case of out_fail, they do:
 > > 
 > >         unlock_kernel();
 > >         SetPageDirty(page);
 > >         UnlockPage(page);
 > >         return ret;
 > > 
 > > So, in the case of reiserfs_write_full_page(), the BUG() is falsely 
 > > triggered
 > > due to a transaction that was started on another filesystem (ext3).  And the
 > > fix would simply be to do something along the lines of ext3...
 > 
 > The reiserfs data logging actually does more than ext3 to make sure
 > things get along, recording the super of the filesystem holding the
 > transaction.  So, it is actually possible to start a new non-nested
 > transaction.

This can result in a/b<->b/a deadlock, right?

 > 
 > But, we shouldn't have to.  Other parts of the OS should be protecting
 > us from a writepage being called at this time, which is why the bug is
 > there.  Someone did a non GFP_NOFS allocation with a transaction

__bread()->__getblk()->__find_get_block()->find_get_page() allocates
page with bdev->bd_inode->i_mapping->gfp_flags, which is GFP_USER, that
includes GFP_FS.

 > running, which can trigger a variety of deadlocks, especially from
 > shrink_icache and friends.
 > 
 > -chris
 > 

Nikita.

 > 

