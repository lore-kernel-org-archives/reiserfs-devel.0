From: Jan Kara <jack@suse.cz>
Subject: Re: [PATCH] reiserfs: call truncate_setsize under tailpack mutex
Date: Wed, 21 May 2014 22:37:03 +0200
Message-ID: <20140521203703.GA5685@quack.suse.cz>
References: <537CE227.4040803@suse.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <537CE227.4040803@suse.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeff Mahoney <jeffm@suse.com>
Cc: reiserfs-devel <reiserfs-devel@vger.kernel.org>, Jan Kara <jack@suse.cz>

On Wed 21-05-14 13:28:07, Jeff Mahoney wrote:
> Prior to commit 0e4f6a791b1e (Fix reiserfs_file_release()), reiserfs
> truncates serialized on i_mutex. They mostly still do, with the exception
> of reiserfs_file_release. That blocks out other writers via the tailpack
> mutex and the inode openers counter adjusted in reiserfs_file_open.
> 
> However, NFS will call reiserfs_setattr without having called ->open, so
> we end up with a race when nfs is calling ->setattr while another
> process is releasing the file. Ultimately, it triggers the
> BUG_ON(inode->i_size != new_file_size) check in maybe_indirect_to_direct.
> 
> The solution is to pull the lock into reiserfs_setattr to encompass the
> truncate_setsize call as well.
  Thanks. I've merged the patch to my tree.

								Honza
> 
> Signed-off-by: Jeff Mahoney <jeffm@suse.com>
> Cc: <stable@vger.kernel.org>
> ---
>  fs/reiserfs/inode.c |    8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> --- a/fs/reiserfs/inode.c
> +++ b/fs/reiserfs/inode.c
> @@ -3214,8 +3214,14 @@ int reiserfs_setattr(struct dentry *dent
>  	    attr->ia_size != i_size_read(inode)) {
>  		error = inode_newsize_ok(inode, attr->ia_size);
>  		if (!error) {
> +			/*
> +			 * Could race against reiserfs_file_release
> +			 * if called from NFS, so take tailpack mutex.
> +			 */
> +			mutex_lock(&REISERFS_I(inode)->tailpack);
>  			truncate_setsize(inode, attr->ia_size);
> -			reiserfs_vfs_truncate_file(inode);
> +			reiserfs_truncate_file(inode, 1);
> +			mutex_unlock(&REISERFS_I(inode)->tailpack);
>  		}
>  	}
> 
> -- 
> Jeff Mahoney
> SUSE Labs
-- 
Jan Kara <jack@suse.cz>
SUSE Labs, CR
