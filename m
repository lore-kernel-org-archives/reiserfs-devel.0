From: Jan Kara <jack@suse.cz>
Subject: Re: [PATCH] reiserfs: Fix locking in reiserfs_quota_on()
Date: Tue, 9 Nov 2010 16:37:40 +0100
Message-ID: <20101109153740.GC4936@quack.suse.cz>
References: <1288225703-8170-1-git-send-email-jack@suse.cz>
 <20101028013604.GB6233@nowhere>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20101028013604.GB6233@nowhere>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Frederic Weisbecker <fweisbec@gmail.com>
Cc: Jan Kara <jack@suse.cz>, reiserfs-devel@vger.kernel.org, linux-fsdevel@vger.kernel.org, Al Viro <viro@ZenIV.linux.org.uk>, Andrew Morton <akpm@linux-foundation.org>

On Thu 28-10-10 03:36:07, Frederic Weisbecker wrote:
> On Thu, Oct 28, 2010 at 02:28:23AM +0200, Jan Kara wrote:
> > reiserfs_quota_on() unpacks a tail of quota file in case it has one. But after
> > BKL conversion, reiserfs_unpack() expects to be called with write_lock held.
> > So acquire the lock before calling reiserfs_unpack() to avoid assertion
> > failures.
> > 
> > Reported-by: markus.gapp@gmx.net
> > Signed-off-by: Jan Kara <jack@suse.cz>
> > ---
> >  fs/reiserfs/super.c |    2 ++
> >  1 files changed, 2 insertions(+), 0 deletions(-)
> > 
> >  Frederic, would you merge this patch or should I merge it?
> > 
> > diff --git a/fs/reiserfs/super.c b/fs/reiserfs/super.c
> > index 6e85cfd..73c000f 100644
> > --- a/fs/reiserfs/super.c
> > +++ b/fs/reiserfs/super.c
> > @@ -2059,7 +2059,9 @@ static int reiserfs_quota_on(struct super_block *sb, int type, int format_id,
> >  	inode = path->dentry->d_inode;
> >  	/* We must not pack tails for quota files on reiserfs for quota IO to work */
> >  	if (!(REISERFS_I(inode)->i_flags & i_nopack_mask)) {
> > +		reiserfs_write_lock(sb);
> >  		err = reiserfs_unpack(inode, NULL);
> > +		reiserfs_write_unlock(sb);
> >  		if (err) {
> >  			reiserfs_warning(sb, "super-6520",
> >  				"Unpacking tail of quota file failed"
> > -- 
> > 1.7.1
> > 
> 
> 
> 
> Yeah. This is due to a recent fix in reiserfs_unpack().
> And in this fix I assumed reiserfs_unpack() was always called under the
> reiserfs lock.
> I was wrong, I thought that reiserfs_quota_on() was ok because it can
> call joural_begin() which appears to have the same requirements.
> But no that's probably another bug, journal_begin() should also
> be called under the reiserfs lock.
> Anyway that must be another patch.
> 
> 
> For this specific problem, it might be slightly more proper to do the
> below. It lowers a bit the reiserfs lock coverage and also fixes
> a weird lock-unlock ordering in reiserfs_unpack() that was doing:
> 
> 	Lock A - Lock B - Unlock A - Unlock B
> 
> Hmm?
  Looks OK to me. Do you plan to merge it?

								Honza

> diff --git a/fs/reiserfs/ioctl.c b/fs/reiserfs/ioctl.c
> index 5cbb81e..af2a58f 100644
> --- a/fs/reiserfs/ioctl.c
> +++ b/fs/reiserfs/ioctl.c
> @@ -189,8 +189,8 @@ int reiserfs_unpack(struct inode *inode, struct file *filp)
>  	/* we need to make sure nobody is changing the file size beneath
>  	 ** us
>  	 */
> -	reiserfs_mutex_lock_safe(&inode->i_mutex, inode->i_sb);
>  	depth = reiserfs_write_lock_once(inode->i_sb);
> +	reiserfs_mutex_lock_safe(&inode->i_mutex, inode->i_sb);
>  
>  	write_from = inode->i_size & (blocksize - 1);
>  	/* if we are on a block boundary, we are already unpacked.  */
> 
> 
-- 
Jan Kara <jack@suse.cz>
SUSE Labs, CR
