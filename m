From: Nikita Danilov <Nikita@Namesys.COM>
Subject: Re: [PATCH]: reiser4 [8/8] reiser4 code
Date: Thu, 31 Oct 2002 21:16:21 +0300
Message-ID: <15809.29557.756663.288173@laputa.namesys.com>
References: <15809.25023.211776.529580@laputa.namesys.com>
	<Pine.GSO.4.21.0210311203300.16688-100000@weyl.math.psu.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11871-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.GSO.4.21.0210311203300.16688-100000@weyl.math.psu.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Alexander Viro <viro@math.psu.edu>
Cc: Linus Torvalds <Torvalds@Transmeta.COM>, Linux Kernel Mailing List <Linux-Kernel@vger.kernel.org>, Reiserfs mail-list <Reiserfs-List@Namesys.COM>

[Reiserfs-List@Namesys.COM is no longer subscribers-only, back into CC]

Alexander Viro writes:
 > 
 > 
 > On Thu, 31 Oct 2002, Nikita Danilov wrote:
 > 
 > > generic_shutdown_super() calls fsync_super(sb) (which will call
 > > ->writepage() on each dirty page) and then invalidate_inodes().
 > > 
 > > Reiser4 has commit out-standing transactions -between- these two points:
 > > after ->writepage() has been called on all dirty pages, but before
 > > inodes were destroyed. Thus, we cannot use
 > > kill_block_super()/generic_shutdown_super().
 > 
 > Why don't you do that from within fsync_super()?  That would be much
 > more natural point for such stuff...
 > 
 > I hadn't looked into akpm's stuff in fs-writeback.c for a while, but
 > if one can't stick such flush point in there I'd argue that this is
 > a bug that needs to be fixed - either there or by providing explicit

->writepages gets (in wbc->sync_mode) enough information to tell
synchronization request like umount or sync from
balance_dirty_pages(). Yes, it looks like better solution,
->writepages(inode, WB_SYNC_ALL) should just synchronously commit all
transactions involving any of inode's pages.

 > callback from fsync_super().

Hmm, I just noted that for now we probably could simply use exported
fsync_bdev(s->s_bdev) in fsync_super(s) stead. How simple. Thank you for
the useful discussion. :-)

Nikita.
