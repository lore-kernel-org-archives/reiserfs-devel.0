From: Jan Kara <jack@suse.cz>
Subject: Re: [patch v3 2/3] reiserfs: locking, handle nested locks properly
Date: Wed, 7 Aug 2013 22:25:37 +0200
Message-ID: <20130807202537.GF26516@quack.suse.cz>
References: <20130807163515.986450231@suse.com>
 <20130807163550.503788994@suse.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20130807163550.503788994@suse.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeff Mahoney <jeffm@suse.com>
Cc: reiserfs-devel@vger.kernel.org, jack@suse.cz

On Wed 07-08-13 12:35:17, Jeff Mahoney wrote:
> The reiserfs write lock replaced the BKL and uses similar semantics.
> 
> Frederic's locking code makes a distinction between when the lock is nested
> and when it's being acquired/released, but I don't think that's the right
> distinction to make.
> 
> The right distinction is between the lock being released at end-of-use and
> the lock being released for a schedule. The unlock should return the depth
> and the lock should restore it, rather than the other way around as it is now.
> 
> This patch implements that and adds a number of places where the lock
> should be dropped.
> 
> Signed-off-by: Jeff Mahoney <jeffm@suse.com>
> ---
> 
>  fs/reiserfs/bitmap.c   |    5 +-
>  fs/reiserfs/dir.c      |    7 +--
>  fs/reiserfs/fix_node.c |   26 ++++++------
>  fs/reiserfs/inode.c    |   77 ++++++++++++++++--------------------
>  fs/reiserfs/ioctl.c    |    7 +--
>  fs/reiserfs/journal.c  |  104 ++++++++++++++++++++++++++-----------------------
>  fs/reiserfs/lock.c     |   43 ++++++++++----------
>  fs/reiserfs/namei.c    |   24 +++--------
>  fs/reiserfs/prints.c   |    5 +-
>  fs/reiserfs/reiserfs.h |   36 +++++++++-------
>  fs/reiserfs/resize.c   |   10 +++-
>  fs/reiserfs/stree.c    |   16 +++----
>  fs/reiserfs/super.c    |    5 --
>  13 files changed, 188 insertions(+), 177 deletions(-)
> 
  Just one smaller comment below, otherwise the patch looks good.

> --- a/fs/reiserfs/stree.c	2013-08-07 10:23:30.205643392 -0400
> +++ b/fs/reiserfs/stree.c	2013-08-07 10:23:34.037585247 -0400
> @@ -550,7 +550,8 @@ static bool search_by_key_reada(struct s
>  		 */
>  		if (!buffer_uptodate(bh[j])) {
>  			if (!unlocked) {
> -				reiserfs_write_unlock(s);
> +				int depth = -1; /* avoiding __must_check */
> +				depth = reiserfs_write_unlock_nested(s);
>  				unlocked = true;
>  			}
>  			ll_rw_block(READA, 1, bh + j);
  This is ugly. It shouldn't be too hard to either modify
search_by_key_reada() to return lock depth or wrap more from the callsite
of search_by_key_reada() into the function so that it always returns with
write lock locked...

> @@ -625,7 +626,7 @@ int search_by_key(struct super_block *sb
>  	block_number = SB_ROOT_BLOCK(sb);
>  	expected_level = -1;
>  	while (1) {
> -
> +		int depth;
>  #ifdef CONFIG_REISERFS_CHECK
>  		if (!(++repeat_counter % 50000))
>  			reiserfs_warning(sb, "PAP-5100",
> @@ -646,25 +647,26 @@ int search_by_key(struct super_block *sb
>  		if ((bh = last_element->pe_buffer =
>  		     sb_getblk(sb, block_number))) {
>  			bool unlocked = false;
> -
> +			depth = REISERFS_SB(sb)->lock_depth;
>  			if (!buffer_uptodate(bh) && reada_count > 1)
>  				/* may unlock the write lock */
>  				unlocked = search_by_key_reada(sb, reada_bh,
>  						    reada_blocks, reada_count);
> +
>  			/*
>  			 * If we haven't already unlocked the write lock,
>  			 * then we need to do that here before reading
>  			 * the current block
>  			 */
>  			if (!buffer_uptodate(bh) && !unlocked) {
> -				reiserfs_write_unlock(sb);
> +				depth = reiserfs_write_unlock_nested(sb);
>  				unlocked = true;
>  			}
>  			ll_rw_block(READ, 1, &bh);
>  			wait_on_buffer(bh);
>  
>  			if (unlocked)
> -				reiserfs_write_lock(sb);
> +				reiserfs_write_lock_nested(sb, depth);
>  			if (!buffer_uptodate(bh))
>  				goto io_error;
>  		} else {

								Honza
-- 
Jan Kara <jack@suse.cz>
SUSE Labs, CR
