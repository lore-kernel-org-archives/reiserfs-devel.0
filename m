From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [PATCH] reiser4: implement ->rename2() of struct inode_operations.
Date: Fri, 27 Feb 2015 12:57:41 +0100
Message-ID: <54F05BB5.5030104@gmail.com>
References: <1424992884-29692-1-git-send-email-intelfx100@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject:references
         :in-reply-to:content-type:content-transfer-encoding;
        bh=x0+xxrqqn3pSGX3+ZvTGYRAF+ayOhMMbHqiiW8/NOY0=;
        b=hOxF0BNwZesbpf41k2v761RfBABPu0uN4UzIptTl4ee8rsyzWXCxAklSYqIRY3TT6P
         +JHZU5NEyABbY6cWElW9l6KhBSrbmDsN627CmlNnrxArlxAuzPYJpPNQTHInKQk9fKnE
         FNGg3SF4EYVglMuxVPpTBozwTvljFhNByN9x74wfjgmEqblyeNwx908sdWsh3ygKVYvu
         +gwgNlVTgG7JEHVjc7vWv8cGLZWg204tWB8MGhov9bC9Qo91q9ut53ElZyZTGQDGfJuX
         a0onH8r1XIUnmSRF+5GHhdC0c2hy2KYMoa7CaScswUy05JCZm9lSi14eMOt781nYWpOs
         eMXQ==
In-Reply-To: <1424992884-29692-1-git-send-email-intelfx100@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ivan Shapovalov <intelfx100@gmail.com>, reiserfs-devel@vger.kernel.org


On 02/27/2015 12:21 AM, Ivan Shapovalov wrote:
> For now, only support the basic case of flags == 0.
> Also support the case of flags == RENAME_NOREPLACE, because it is a no-op for
> local filesystems (destination existence is already checked by VFS).

Great,
Thanks!

> Thus no functional changes to the existing code.
>
> Signed-off-by: Ivan Shapovalov <intelfx100@gmail.com>
> ---
>
> Could you please estimate whether it would be hard to also implement the
> RENAME_EXCHANGE flag?

Why do we need this?

Thanks,
Edward.

>   It is defined as follows:
>
> 	Atomically exchange oldpath and newpath. Both pathnames must exist but may
> 	be of different types (e.g., one could be a non-empty directory and the other
> 	a symbolic link).
>
> If there are no caveats, I'll try to do it as a kind of a junior job...
>
>   fs/reiser4/plugin/inode_ops_rename.c | 47 ++++++++++++++++++++++++++++++------
>   fs/reiser4/plugin/object.c           |  2 +-
>   fs/reiser4/plugin/object.h           |  5 ++--
>   3 files changed, 44 insertions(+), 10 deletions(-)
>
> diff --git a/fs/reiser4/plugin/inode_ops_rename.c b/fs/reiser4/plugin/inode_ops_rename.c
> index 4d461dc..6744e14 100644
> --- a/fs/reiser4/plugin/inode_ops_rename.c
> +++ b/fs/reiser4/plugin/inode_ops_rename.c
> @@ -288,7 +288,7 @@ int reiser4_find_entry(struct inode *, struct dentry *, lock_handle * ,
>   	       znode_lock_mode, reiser4_dir_entry_desc *);
>   int reiser4_update_dir(struct inode *);
>   
> -/* this is common implementation of vfs's rename method of struct
> +/* this is common implementation of vfs's rename2 method of struct
>      inode_operations
>      See comments in the body.
>   
> @@ -299,12 +299,13 @@ int reiser4_update_dir(struct inode *);
>      entry. This should be re-considered when more than one different
>      directory plugin will be implemented.
>   */
> -int reiser4_rename_common(struct inode *old_dir /* directory where @old
> -						 * is located */ ,
> -			  struct dentry *old_name /* old name */ ,
> -			  struct inode *new_dir /* directory where @new
> -						 * is located */ ,
> -			  struct dentry *new_name/* new name */)
> +int reiser4_rename2_common(struct inode *old_dir /* directory where @old
> +						  * is located */ ,
> +			   struct dentry *old_name /* old name */ ,
> +			   struct inode *new_dir /* directory where @new
> +						  * is located */ ,
> +			   struct dentry *new_name /* new name */ ,
> +			   unsigned flags /* specific flags */)
>   {
>   	/* From `The Open Group Base Specifications Issue 6'
>   
> @@ -384,6 +385,26 @@ int reiser4_rename_common(struct inode *old_dir /* directory where @old
>   	   [N/A]
>   
>   	 */
> +
> +	/* From Documentation/filesystems/vfs.txt:
> +
> +	   rename2: this has an additional flags argument compared to rename.
> +		f no flags are supported by the filesystem then this method
> +		need not be implemented.  If some flags are supported then the
> +		filesystem must return -EINVAL for any unsupported or unknown
> +		flags.  Currently the following flags are implemented:
> +		(1) RENAME_NOREPLACE: this flag indicates that if the target
> +		of the rename exists the rename should fail with -EEXIST
> +		instead of replacing the target.  The VFS already checks for
> +		existence, so for local filesystems the RENAME_NOREPLACE
> +		implementation is equivalent to plain rename.
> +		(2) RENAME_EXCHANGE: exchange source and target.  Both must
> +		exist; this is checked by the VFS.  Unlike plain rename,
> +		source and target may be of different type.
> +	 */
> +
> +	static const unsigned supported_flags = RENAME_NOREPLACE;
> +
>   	reiser4_context *ctx;
>   	int result;
>   	int is_dir;		/* is @old_name directory */
> @@ -405,6 +426,18 @@ int reiser4_rename_common(struct inode *old_dir /* directory where @old
>   	if (IS_ERR(ctx))
>   		return PTR_ERR(ctx);
>   
> +	/*
> +	 * Check rename2() flags.
> +	 *
> +	 * "If some flags are supported then the filesystem must return
> +	 * -EINVAL for any unsupported or unknown flags."
> +	 *
> +	 * We support:
> +	 * - RENAME_NOREPLACE (no-op)
> +	 */
> +	if (flags & supported_flags != flags)
> +		return RETERR(-EINVAL);
> +
>   	old_entry = kzalloc(3 * sizeof(*old_entry) + 2 * sizeof(*new_lh) +
>   			    sizeof(*dotdot_name) + sizeof(*dataonstack),
>   			    reiser4_ctx_gfp_mask_get());
> diff --git a/fs/reiser4/plugin/object.c b/fs/reiser4/plugin/object.c
> index 553f1e2..1b86408 100644
> --- a/fs/reiser4/plugin/object.c
> +++ b/fs/reiser4/plugin/object.c
> @@ -241,7 +241,7 @@ static struct inode_operations directory_i_ops = {
>   	.mkdir = reiser4_mkdir_common,
>   	.rmdir = reiser4_unlink_common,
>   	.mknod = reiser4_mknod_common,
> -	.rename = reiser4_rename_common,
> +	.rename2 = reiser4_rename2_common,
>   	.permission = reiser4_permission_common,
>   	.setattr = reiser4_setattr_common,
>   	.getattr = reiser4_getattr_common
> diff --git a/fs/reiser4/plugin/object.h b/fs/reiser4/plugin/object.h
> index 80aef3e..f8a5133 100644
> --- a/fs/reiser4/plugin/object.h
> +++ b/fs/reiser4/plugin/object.h
> @@ -22,8 +22,9 @@ int reiser4_symlink_common(struct inode *parent, struct dentry *dentry,
>   		   const char *linkname);
>   int reiser4_mknod_common(struct inode *parent, struct dentry *dentry,
>   		 umode_t mode, dev_t rdev);
> -int reiser4_rename_common(struct inode *old_dir, struct dentry *old_name,
> -			  struct inode *new_dir, struct dentry *new_name);
> +int reiser4_rename2_common(struct inode *old_dir, struct dentry *old_name,
> +			   struct inode *new_dir, struct dentry *new_name,
> +			   unsigned flags);
>   void *reiser4_follow_link_common(struct dentry *, struct nameidata *data);
>   int reiser4_permission_common(struct inode *, int mask);
>   int reiser4_setattr_common(struct dentry *, struct iattr *);

