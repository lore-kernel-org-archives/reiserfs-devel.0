From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [PATCH] reiser4: implement ->rename2() of struct
 inode_operations.
Date: Tue, 4 Oct 2016 17:40:48 +0200
Message-ID: <810035f9-2b09-5552-73a3-f5ce6c05160c@gmail.com>
References: <20160930064937.21460-1-intelfx@intelfx.name>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding;
        bh=odUcCtdeDDRiwZGRP21ERdwMJJRs4WvdQrtDK/TloeQ=;
        b=NimQOHlDsWtx3oX3Ji+ode+BCjrUyccTs1dhuLjY/hRBZg2zsDZl72exjTfJ+RKJj4
         cZGRaqPAdpVVjlVllyWaXrVGn1auKyFb1wJMWGFKV6bDnjZjJdc4AlBh0TdF7KdKIWQW
         CLRH97qEwMeBWg9vs6HAN+h5TKk+h4lXMZfLJw+lYQIyS8l0LpDitaSSg2AwTM4pS9Sz
         l2H1uTN25Ui1Em3RilMYuAIvC8KRM/MUNNzaefF6gjHeKiym9b67SH2hQYDvF+s5sqOJ
         nY5VSv79lNlCUpGydFWsnb/+vGivbilhf0b5Eh/+CehjMdn71nTDA6AeX0onCxWLMKa9
         nmMw==
In-Reply-To: <20160930064937.21460-1-intelfx@intelfx.name>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ivan Shapovalov <intelfx@intelfx.name>, reiserfs-devel@vger.kernel.org

OK

On 09/30/2016 08:49 AM, Ivan Shapovalov wrote:
> For now, only support the basic case of flags == 0.
> Also support the case of flags == RENAME_NOREPLACE, because it is a no-op for
> local filesystems (destination existence is already checked by VFS).
>
> Thus no functional changes to the existing code.
>
> Signed-off-by: Ivan Shapovalov <intelfx@intelfx.name>
> ---
>   plugin/inode_ops_rename.c | 47 ++++++++++++++++++++++++++++++++++++++++-------
>   plugin/object.c           |  2 +-
>   plugin/object.h           |  5 +++--
>   3 files changed, 44 insertions(+), 10 deletions(-)
>
> diff --git a/plugin/inode_ops_rename.c b/plugin/inode_ops_rename.c
> index 4d461dc..ddb7bf5 100644
> --- a/plugin/inode_ops_rename.c
> +++ b/plugin/inode_ops_rename.c
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
> +	if ((flags & supported_flags) != flags)
> +		return RETERR(-EINVAL);
> +
>   	old_entry = kzalloc(3 * sizeof(*old_entry) + 2 * sizeof(*new_lh) +
>   			    sizeof(*dotdot_name) + sizeof(*dataonstack),
>   			    reiser4_ctx_gfp_mask_get());
> diff --git a/plugin/object.c b/plugin/object.c
> index 7b0c2d2..9d10a0c 100644
> --- a/plugin/object.c
> +++ b/plugin/object.c
> @@ -179,7 +179,7 @@ static struct inode_operations directory_i_ops = {
>   	.mkdir = reiser4_mkdir_common,
>   	.rmdir = reiser4_unlink_common,
>   	.mknod = reiser4_mknod_common,
> -	.rename = reiser4_rename_common,
> +	.rename2 = reiser4_rename2_common,
>   	.permission = reiser4_permission_common,
>   	.setattr = reiser4_setattr_common,
>   	.getattr = reiser4_getattr_common
> diff --git a/plugin/object.h b/plugin/object.h
> index b5fd962..c69c6b0 100644
> --- a/plugin/object.h
> +++ b/plugin/object.h
> @@ -22,8 +22,9 @@ int reiser4_symlink_common(struct inode *parent, struct dentry *dentry,
>   		   const char *linkname);
>   int reiser4_mknod_common(struct inode *parent, struct dentry *dentry,
>   		 umode_t mode, dev_t rdev);
> -int reiser4_rename_common(struct inode *old_dir, struct dentry *old_name,
> -			  struct inode *new_dir, struct dentry *new_name);
> +int reiser4_rename2_common(struct inode *old_dir, struct dentry *old_name,
> +			   struct inode *new_dir, struct dentry *new_name,
> +			   unsigned flags);
>   const char *reiser4_get_link_common(struct dentry *, struct inode *inode,
>   				    struct delayed_call *done);
>   int reiser4_permission_common(struct inode *, int mask);

