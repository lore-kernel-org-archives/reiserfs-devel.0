From: Jan Kara <jack@suse.cz>
Subject: Re: [PATCH] reiserfs: fix deadlocks with quotas
Date: Tue, 14 Aug 2012 19:20:32 +0200
Message-ID: <20120814172032.GL7122@quack.suse.cz>
References: <501B2B04.2050706@suse.com>
Mime-Version: 1.0
Return-path: <linux-fsdevel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <501B2B04.2050706@suse.com>
Sender: linux-fsdevel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeff Mahoney <jeffm@suse.com>
Cc: Linux FS Maling List <linux-fsdevel@vger.kernel.org>, Jan Kara <jack@suse.cz>, reiserfs-devel <reiserfs-devel@vger.kernel.org>

On Thu 02-08-12 21:36:04, Jeff Mahoney wrote:
> The BKL push-down for reiserfs made lock recursion a special case that needs
> to be handled explicitly. One of the cases that was unhandled is dropping
> the quota during inode eviction. Both reiserfs_evict_inode and
> reiserfs_write_dquot take the write lock, but when the journal lock is
> taken it only drops one the references. The locking rules are that the journal
> lock be acquired before the write lock so leaving the reference open leads
> to a ABBA deadlock.
> 
> This patch pushes the unlock up before clear_inode and avoids the recursive
> locking.
> 
> Another ABBA situation can occur when the write lock is dropped while reading
> the bitmap buffer while in the quota code. When the lock is reacquired, it
> will deadlock against dquot->dq_lock and dqopt->dqio_mutex in the dquot_acquire
> path. It's safe to retain the lock across the read and should be cached under
> write load.
> 
> Signed-off-by: Jeff Mahoney <jeffm@suse.com>
  Yeah, the patch looks good. Since we don't have reiserfs maintainer, I
guess I'll push this through my tree.

								Honza

> ---
>  fs/reiserfs/bitmap.c |    2 --
>  fs/reiserfs/inode.c  |    2 +-
>  2 files changed, 1 insertion(+), 3 deletions(-)
> 
> --- a/fs/reiserfs/bitmap.c
> +++ b/fs/reiserfs/bitmap.c
> @@ -1334,9 +1334,7 @@ struct buffer_head *reiserfs_read_bitmap
>  	else if (bitmap == 0)
>  		block = (REISERFS_DISK_OFFSET_IN_BYTES >> sb->s_blocksize_bits) + 1;
>  
> -	reiserfs_write_unlock(sb);
>  	bh = sb_bread(sb, block);
> -	reiserfs_write_lock(sb);
>  	if (bh == NULL)
>  		reiserfs_warning(sb, "sh-2029: %s: bitmap block (#%u) "
>  		                 "reading failed", __func__, block);
> --- a/fs/reiserfs/inode.c
> +++ b/fs/reiserfs/inode.c
> @@ -76,10 +76,10 @@ void reiserfs_evict_inode(struct inode *
>  		;
>  	}
>        out:
> +	reiserfs_write_unlock_once(inode->i_sb, depth);
>  	clear_inode(inode);	/* note this must go after the journal_end to prevent deadlock */
>  	dquot_drop(inode);
>  	inode->i_blocks = 0;
> -	reiserfs_write_unlock_once(inode->i_sb, depth);
>  	return;
>  
>  no_delete:
> 
> -- 
> Jeff Mahoney
> SUSE Labs
-- 
Jan Kara <jack@suse.cz>
SUSE Labs, CR
