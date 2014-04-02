From: Jan Kara <jack@suse.cz>
Subject: Re: [PATCH] reiserfs: fix race in readdir
Date: Wed, 2 Apr 2014 20:09:55 +0200
Message-ID: <20140402180955.GA13479@quack.suse.cz>
References: <533C3382.3000808@suse.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <533C3382.3000808@suse.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeff Mahoney <jeffm@suse.com>
Cc: reiserfs-devel <reiserfs-devel@vger.kernel.org>, Jan Kara <jack@suse.cz>

On Wed 02-04-14 11:57:54, Jeff Mahoney wrote:
> jdm-20004 reiserfs_delete_xattrs: Couldn't delete all xattrs (-2)
> 
> The -ENOENT is due to readdir calling dir_emit on the same entry twice.
> 
> If the dir_emit callback sleeps and the tree is changed underneath us,
> we won't be able to trust deh_offset(deh) anymore. We need to save
> next_pos before we might sleep so we can find the next entry.
> 
> This can also affect non-xattr users of readdir, though the race is tighter.
> 
> Cc: <stable@vger.kernel.org> 
> Signed-off-by: Jeff Mahoney <jeffm@suse.com>
  The patch looks good to me so unless someone objects, I'll merge this
patch with Linus.

								Honza

> ---
>  fs/reiserfs/dir.c |    9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> --- a/fs/reiserfs/dir.c
> +++ b/fs/reiserfs/dir.c
> @@ -179,6 +179,13 @@ int reiserfs_readdir_inode(struct inode
>  				memcpy(local_buf, d_name, d_reclen);
>  
>  				/*
> +				 * deh_offset(deh) will be invalid if dir_emit
> +				 * sleeps. We need to know the offset after
> +				 * this one to continue.
> +				 */
> +				next_pos = deh_offset(deh) + 1;
> +
> +				/*
>  				 * Since filldir might sleep, we can release
>  				 * the write lock here for other waiters
>  				 */
> @@ -196,8 +203,6 @@ int reiserfs_readdir_inode(struct inode
>  				if (local_buf != small_buf) {
>  					kfree(local_buf);
>  				}
> -				// next entry should be looked for with such offset
> -				next_pos = deh_offset(deh) + 1;
>  
>  				if (item_moved(&tmp_ih, &path_to_entry)) {
>  					set_cpu_key_k_offset(&pos_key,
> 
> -- 
> Jeff Mahoney
> SUSE Labs
-- 
Jan Kara <jack@suse.cz>
SUSE Labs, CR
