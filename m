From: Chris Mason <chris.mason@oracle.com>
Subject: Re: [PATCH 5/6] kill-the-BKL/reiserfs: release the write lock
 inside reiserfs_read_bitmap_block()
Date: Fri, 01 May 2009 09:30:51 -0400
Message-ID: <1241184651.13084.15.camel@think.oraclecorp.com>
References: <1241145862-21700-1-git-send-email-fweisbec@gmail.com>
	 <1241145862-21700-6-git-send-email-fweisbec@gmail.com>
	 <20090501054734.GE5983@elte.hu>  <20090501131955.GC6011@nowhere>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <20090501131955.GC6011@nowhere>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Frederic Weisbecker <fweisbec@gmail.com>
Cc: Ingo Molnar <mingo@elte.hu>, LKML <linux-kernel@vger.kernel.org>, Jeff Mahoney <jeffm@suse.com>, ReiserFS Development List <reiserfs-devel@vger.kernel.org>, Alexander Beregalov <a.beregalov@gmail.com>, Alessio Igor Bogani <abogani@texware.it>, Jonathan Corbet <corbet@lwn.net>, Alexander Viro <viro@zeniv.linux.org.uk>

On Fri, 2009-05-01 at 15:19 +0200, Frederic Weisbecker wrote:
> On Fri, May 01, 2009 at 07:47:34AM +0200, Ingo Molnar wrote:
> > 
> > * Frederic Weisbecker <fweisbec@gmail.com> wrote:
> > 
> > > reiserfs_read_bitmap_block() uses sb_bread() to read the bitmap block. This
> > > helper might sleep.
> > > 
> > > Then, when the bkl was used, it was released at this point. We can then
> > > relax the write lock too here.
> > > 
> > > [ Impact: release the reiserfs write lock when it is not needed ]
> > > 
> > > Cc: Jeff Mahoney <jeffm@suse.com>
> > > Cc: Chris Mason <chris.mason@oracle.com>
> > > Cc: Alexander Beregalov <a.beregalov@gmail.com>
> > > Signed-off-by: Frederic Weisbecker <fweisbec@gmail.com>
> > > ---
> > >  fs/reiserfs/bitmap.c |    2 ++
> > >  1 files changed, 2 insertions(+), 0 deletions(-)
> > > 
> > > diff --git a/fs/reiserfs/bitmap.c b/fs/reiserfs/bitmap.c
> > > index 1470334..6854957 100644
> > > --- a/fs/reiserfs/bitmap.c
> > > +++ b/fs/reiserfs/bitmap.c
> > > @@ -1249,7 +1249,9 @@ struct buffer_head *reiserfs_read_bitmap_block(struct super_block *sb,
> > >  	else if (bitmap == 0)
> > >  		block = (REISERFS_DISK_OFFSET_IN_BYTES >> sb->s_blocksize_bits) + 1;
> > >  
> > > +	reiserfs_write_unlock(sb);
> > >  	bh = sb_bread(sb, block);
> > > +	reiserfs_write_lock(sb);
> > >  	if (bh == NULL)
> > >  		reiserfs_warning(sb, "sh-2029: %s: bitmap block (#%u) "
> > >  		                 "reading failed", __func__, block);
> > 
> > Note, there's a side-effect here: the access to sb->b_blocksize is 
> > moved outside of the lock. Previously it was accessed via the BKL. 
> > On a mounted filesystem sb->b_blocksize is not supposed to change, 
> > so it's probably not an issue - but wanted to mention it.

> Indeed. Well I guess it can't be dynamically changed.
> This is something that can be chosen with mkfs on filesystem creation
> but I guess it can't be changed, at least not while the filesystem
> is mounted. I hope...

The blocksize should only be changing very early in the mount.  It is
basically:

set the block size to something
read the super block
read the block size from the super block
set the block size to the correct value
use it from then on.

This should all be done with by the time we read bitmaps.

-chris


