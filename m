From: Jan Kara <jack@suse.cz>
Subject: Re: [PATCH] reiserfs: fix handling of -EOPNOTSUPP in
 reiserfs_for_each_xattr
Date: Thu, 16 Jan 2020 16:53:09 +0100
Message-ID: <20200116155309.GA17141@quack2.suse.cz>
References: <20200115180059.6935-1-jeffm@suse.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200115180059.6935-1-jeffm@suse.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jeffm@suse.com
Cc: reiserfs-devel@vger.kernel.org, jack@suse.cz, brunni@netestate.de

On Wed 15-01-20 13:00:59, jeffm@suse.com wrote:
> From: Jeff Mahoney <jeffm@suse.com>
> 
> Commit 60e4cf67a58 (reiserfs: fix extended attributes on the root
> directory) introduced a regression open_xa_root started returning
> -EOPNOTSUPP but it was not handled properly in reiserfs_for_each_xattr.
> 
> When the reiserfs module is built without CONFIG_REISERFS_FS_XATTR,
> deleting an inode would result in a warning and chowning an inode
> would also result in a warning and then fail to complete.
> 
> With CONFIG_REISERFS_FS_XATTR enabled, the xattr root would always be
> present for read-write operations.
> 
> This commit handles -EOPNOSUPP in the same way -ENODATA is handled.
> 
> Fixes: 60e4cf67a58 (reiserfs: fix extended attributes on the root directory)
> Reported-by: Michael Brunnbauer <brunni@netestate.de>
> Signed-off-by: Jeff Mahoney <jeffm@suse.com>

Thanks Jeff! I've queued the patch to my tree and will push it to Linus
next week.

								Honza

> ---
>  fs/reiserfs/xattr.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/reiserfs/xattr.c b/fs/reiserfs/xattr.c
> index 06497965f0a0..d843c4789ced 100644
> --- a/fs/reiserfs/xattr.c
> +++ b/fs/reiserfs/xattr.c
> @@ -319,8 +319,12 @@ static int reiserfs_for_each_xattr(struct inode *inode,
>  out_dir:
>  	dput(dir);
>  out:
> -	/* -ENODATA isn't an error */
> -	if (err == -ENODATA)
> +	/*
> +	 * -ENODATA: this object doesn't have any xattrs
> +	 * -EOPNOTSUPP: this file system doesn't have xattrs enabled on disk.
> +	 * Neither are errors
> +	 */
> +	if (err == -ENODATA || err == -EOPNOTSUPP)
>  		err = 0;
>  	return err;
>  }
> -- 
> 2.16.4
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
