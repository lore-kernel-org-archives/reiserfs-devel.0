From: Jan Kara <jack@suse.cz>
Subject: Re: [PATCH] reiserfs: don't preallocate blocks for extended
 attributes
Date: Fri, 23 Jun 2017 09:33:30 +0200
Message-ID: <20170623073330.GA25149@quack2.suse.cz>
References: <3c7d90d8-4f87-8c37-3ba3-11d5e5bf5c78@suse.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <3c7d90d8-4f87-8c37-3ba3-11d5e5bf5c78@suse.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeff Mahoney <jeffm@suse.com>
Cc: reiserfs-devel@vger.kernel.org, Jan Kara <jack@suse.com>

On Thu 22-06-17 16:35:04, Jeff Mahoney wrote:
> Most extended attributes will fit in a single block.  More importantly,
> we drop the reference to the inode while holding the transaction open
> so the preallocated blocks aren't released.  As a result, the inode
> may be evicted before it's removed from the transaction's prealloc list
> which can cause memory corruption.
> 
> Signed-off-by: Jeff Mahoney <jeffm@suse.com>

Thanks added to my tree.

								Honza

> ---
>  fs/reiserfs/bitmap.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> --- a/fs/reiserfs/bitmap.c
> +++ b/fs/reiserfs/bitmap.c
> @@ -980,7 +980,7 @@ static int determine_prealloc_size(reise
>  	hint->prealloc_size = 0;
>  
>  	if (!hint->formatted_node && hint->preallocate) {
> -		if (S_ISREG(hint->inode->i_mode)
> +		if (S_ISREG(hint->inode->i_mode) && !IS_PRIVATE(hint->inode)
>  		    && hint->inode->i_size >=
>  		    REISERFS_SB(hint->th->t_super)->s_alloc_options.
>  		    preallocmin * hint->inode->i_sb->s_blocksize)
> 
> -- 
> Jeff Mahoney
> SUSE Labs
> 



-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
