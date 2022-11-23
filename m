From: Mimi Zohar <zohar@linux.ibm.com>
Subject: Re: [PATCH v5 1/6] reiserfs: Switch to
 security_inode_init_security()
Date: Wed, 23 Nov 2022 08:12:27 -0500
Message-ID: <c5cea3cad1eaf79c29e91e9ecf8e8b7dcee2ce2c.camel@linux.ibm.com>
References: <20221123095202.599252-1-roberto.sassu@huaweicloud.com>
         <20221123095202.599252-2-roberto.sassu@huaweicloud.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=9PXQukpxuogl+8l31b8WwhvCbvp+U7J+XqCX2qkFTGE=;
 b=ieoJPpTfsIcCtPXvKSpUqs6UfKHqFjLGBdXPXTWDX9kLITBSJQkI4eRL/YTgUx19nMG0
 7IYmKhlPfE4sk2o655ekHeTIY2y+rO2ctE5x6TTSJwzN2cOjMzhD+w17h7wZvS+naXgu
 /i+CRkTTazmTk+kVp4j3A8srGQsMSirQVZ3JWj14Zouvh67riSn+ZBFCgNW5510Wzt09
 a1HuV8vZlRlg2fyXyq2EI8RgJ0V/p37IKFRUL3xmAUxOdDkG7APYRuD+dq2TzV2Mhl1l
 x6ZB8GXBgIWfrB9hQQRG/KfqEj0P+1Un1P1nJQRZGzw6QlXcLGtioBIccPxENfZIgxDR yw== 
In-Reply-To: <20221123095202.599252-2-roberto.sassu@huaweicloud.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Roberto Sassu <roberto.sassu@huaweicloud.com>, mark@fasheh.com, jlbec@evilplan.org, joseph.qi@linux.alibaba.com, dmitry.kasatkin@gmail.com, paul@paul-moore.com, jmorris@namei.org, serge@hallyn.com, stephen.smalley.work@gmail.com, eparis@parisplace.org, casey@schaufler-ca.com
Cc: ocfs2-devel@oss.oracle.com, reiserfs-devel@vger.kernel.org, linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org, selinux@vger.kernel.org, linux-kernel@vger.kernel.org, keescook@chromium.org, nicolas.bouchinet@clip-os.org, Roberto Sassu <roberto.sassu@huawei.com>

On Wed, 2022-11-23 at 10:51 +0100, Roberto Sassu wrote:
> From: Roberto Sassu <roberto.sassu@huawei.com>
> 
> In preparation for removing security_old_inode_init_security(), switch to
> security_inode_init_security().
> 
> Define the initxattrs callback reiserfs_initxattrs(), to populate the
> name/value/len triple in the reiserfs_security_handle() with the first
> xattr provided by LSMs. Multiple xattrs are currently not supported, as the
> reiserfs_security_handle structure is exported to user space.

The security_old_inode_init_security() hook doesn't support EVM. 
Missing from this patch description is whether the move to the
security_inode_init_security() hook changes security.evm.  FYI, I'm not
suggesting it should.  Please update the patch description accordingly.

Mimi

> 
> In reiserfs_initxattrs(), make a copy of the first xattr value, as
> security_inode_init_security() frees it.
> 
> After the call to security_inode_init_security(), remove the check for
> returning -EOPNOTSUPP, as security_inode_init_security() changes it to
> zero.
> 
> Signed-off-by: Roberto Sassu <roberto.sassu@huawei.com>
> ---
>  fs/reiserfs/xattr_security.c | 23 ++++++++++++++++++-----
>  1 file changed, 18 insertions(+), 5 deletions(-)
> 
> diff --git a/fs/reiserfs/xattr_security.c b/fs/reiserfs/xattr_security.c
> index 857a65b05726..0ba96757681d 100644
> --- a/fs/reiserfs/xattr_security.c
> +++ b/fs/reiserfs/xattr_security.c
> @@ -39,6 +39,22 @@ static bool security_list(struct dentry *dentry)
>  	return !IS_PRIVATE(d_inode(dentry));
>  }
>  
> +static int
> +reiserfs_initxattrs(struct inode *inode, const struct xattr *xattr_array,
> +		    void *fs_info)
> +{
> +	struct reiserfs_security_handle *sec = fs_info;
> +
> +	sec->value = kmemdup(xattr_array->value, xattr_array->value_len,
> +			     GFP_KERNEL);
> +	if (!sec->value)
> +		return -ENOMEM;
> +
> +	sec->name = xattr_array->name;
> +	sec->length = xattr_array->value_len;
> +	return 0;
> +}
> +
>  /* Initializes the security context for a new inode and returns the number
>   * of blocks needed for the transaction. If successful, reiserfs_security
>   * must be released using reiserfs_security_free when the caller is done. */
> @@ -56,12 +72,9 @@ int reiserfs_security_init(struct inode *dir, struct inode *inode,
>  	if (IS_PRIVATE(dir))
>  		return 0;
>  
> -	error = security_old_inode_init_security(inode, dir, qstr, &sec->name,
> -						 &sec->value, &sec->length);
> +	error = security_inode_init_security(inode, dir, qstr,
> +					     &reiserfs_initxattrs, sec);
>  	if (error) {
> -		if (error == -EOPNOTSUPP)
> -			error = 0;
> -
>  		sec->name = NULL;
>  		sec->value = NULL;
>  		sec->length = 0;


