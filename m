From: Nick Piggin <npiggin@suse.de>
Subject: Re: [patch 30/41] reiserfs convert to new aops.
Date: Thu, 24 May 2007 03:29:45 +0200
Message-ID: <20070524012945.GA26802@wotan.suse.de>
References: <20070514060619.689648000@wotan.suse.de> <20070514224042.GD5531@wotan.suse.de> <200705162122.58327.vs@namesys.com> <200705240346.46629.vs@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-30655-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200705240346.46629.vs@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Vladimir V. Saveliev" <vs@namesys.com>
Cc: reiserfs-list@namesys.com, Andrew Morton <akpm@linux-foundation.org>

On Thu, May 24, 2007 at 03:46:46AM +0400, Vladimir V. Saveliev wrote:
> Hello, Nick
> 
> On Wednesday 16 May 2007 21:22, Vladimir V. Saveliev wrote:
> > 
> > Two questions - first, is it possible to get rid of reiserfs_prepare_write /
> > commit_write? 
> 
> I assume this is not a problem anymore as long as prepare_write and commit_write of address space operations are NULL now 
> (with last version of reiserfs-convert-to-new-aops.patch).

Yes, that should be fine and allow us to remove some of the generic code
now.

 
> > Second, can you make use of AOP_FLAG_CONT_EXPAND in order to 
> > get rid of the special generic_cont_expand routine for reiserfs?
> 
> Sorry for delay with this. Did you mean something like this?
 
Yes I did, thanks very much, we can now get rid of that weird
generic_cont_expand too (assuming these patches will ever get
merged).

Thanks for doing this Vladimir!

> 
> From: Vladimir Saveliev <vs@namesys.com>
> 
> This patch makes reiserfs to use AOP_FLAG_CONT_EXPAND
> in order to get rid of the special generic_cont_expand routine
>  
> Signed-off-by: Vladimir Saveliev <vs@namesys.com>
> 
> 
> 
> 
> diff -puN fs/reiserfs/inode.c~fs-reiserfs-use-generic_cont_expand_simple fs/reiserfs/inode.c
> --- linux-2.6.21-mm2/fs/reiserfs/inode.c~fs-reiserfs-use-generic_cont_expand_simple	2007-05-24 02:29:52.000000000 +0300
> +++ linux-2.6.21-mm2-vs/fs/reiserfs/inode.c	2007-05-24 02:34:26.000000000 +0300
> @@ -2561,13 +2561,20 @@ static int reiserfs_write_begin(struct f
>  	int ret;
>  	int old_ref = 0;
>  
> + 	inode = mapping->host;
> +	*fsdata = 0;
> + 	if (flags & AOP_FLAG_CONT_EXPAND &&
> + 	    (pos & (inode->i_sb->s_blocksize - 1)) == 0) {
> + 		pos ++;
> +		*fsdata = (void *)flags;
> +	}
> +
>  	index = pos >> PAGE_CACHE_SHIFT;
>  	page = __grab_cache_page(mapping, index);
>  	if (!page)
>  		return -ENOMEM;
>  	*pagep = page;
>  
> -	inode = mapping->host;
>  	reiserfs_wait_on_write_block(inode->i_sb);
>  	fix_tail_page_for_writing(page);
>  	if (reiserfs_transaction_running(inode->i_sb)) {
> @@ -2677,6 +2684,8 @@ static int reiserfs_write_end(struct fil
>  	struct reiserfs_transaction_handle *th;
>  	unsigned start;
>  
> +	if ((unsigned)fsdata & AOP_FLAG_CONT_EXPAND)
> +		pos ++;
>  
>  	reiserfs_wait_on_write_block(inode->i_sb);
>  	if (reiserfs_transaction_running(inode->i_sb))
> @@ -3065,7 +3074,7 @@ int reiserfs_setattr(struct dentry *dent
>  		}
>  		/* fill in hole pointers in the expanding truncate case. */
>  		if (attr->ia_size > inode->i_size) {
> -			error = generic_cont_expand(inode, attr->ia_size);
> +			error = generic_cont_expand_simple(inode, attr->ia_size);
>  			if (REISERFS_I(inode)->i_prealloc_count > 0) {
>  				int err;
>  				struct reiserfs_transaction_handle th;
> 
> _

