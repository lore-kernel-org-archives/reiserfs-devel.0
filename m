From: Chris Mason <mason@suse.com>
Subject: Re: BUG in reiserfs_write_full_page().
Date: 18 Jul 2003 10:00:45 -0400
Message-ID: <1058536844.7878.371.camel@tiny.suse.com>
References: <3F1712F6.7080204@polyserve.com>
	 <1058477610.4012.333.camel@tiny.suse.com> <3F171ABF.6080601@polyserve.com>
	 <1058534583.7878.351.camel@tiny.suse.com>
	 <16151.63980.766223.769053@laputa.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14964-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <16151.63980.766223.769053@laputa.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Nikita Danilov <Nikita@Namesys.COM>
Cc: Michael Gaughen <mgaughen@polyserve.com>, reiserfs-list@namesys.com

On Fri, 2003-07-18 at 09:45, Nikita Danilov wrote:

>  > > So, in the case of reiserfs_write_full_page(), the BUG() is falsely 
>  > > triggered
>  > > due to a transaction that was started on another filesystem (ext3).  And the
>  > > fix would simply be to do something along the lines of ext3...
>  > 
>  > The reiserfs data logging actually does more than ext3 to make sure
>  > things get along, recording the super of the filesystem holding the
>  > transaction.  So, it is actually possible to start a new non-nested
>  > transaction.
> 
> This can result in a/b<->b/a deadlock, right?
> 
Sorry, I wasn't clear.  The transaction nesting code could detect and
deal with it (making sure not to nest into an ext3 transaction or a
reiserfs transaction on a different FS), but there are still other
deadlocks to deal with.

>  > 
>  > But, we shouldn't have to.  Other parts of the OS should be protecting
>  > us from a writepage being called at this time, which is why the bug is
>  > there.  Someone did a non GFP_NOFS allocation with a transaction
> 
> __bread()->__getblk()->__find_get_block()->find_get_page() allocates
> page with bdev->bd_inode->i_mapping->gfp_flags, which is GFP_USER, that
> includes GFP_FS.

You're in 2.5 land ;-)  There seem to be a few problems there, I've got
an oops in find_inode and a deadlock under load, but I still need to
read the (huge) sysrq-t to figure things out.

-chris


