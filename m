From: Mimi Zohar <zohar@linux.ibm.com>
Subject: Re: [PATCH v7 5/6] evm: Align evm_inode_init_security() definition
 with LSM infrastructure
Date: Sun, 19 Feb 2023 14:41:47 -0500
Message-ID: <b7b4eeb060d1f662f990b3ebb3848fa4ab7e8c97.camel@linux.ibm.com>
References: <20221201104125.919483-1-roberto.sassu@huaweicloud.com>
         <20221201104125.919483-6-roberto.sassu@huaweicloud.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=s63DfqR4NiC3QZGz8yhFyKSMoul9bYlY7/ahn77RpF4=;
 b=LbScWa+/jpKBo4XSMLSlaXfty+s6n+EDSLfluGUo9+gnmcsIlrU60INox9/lcZY2PA0Y
 hLUj2vm/woxrkwlXp9aPJyZcZLhHCe47gKAnzahmfx+2llFIMZQg/xWAAYljYpqXzIrT
 +s4CyusDNGasMpUZhNdevGPBnkjLMu+uZb4hg0iWwMgW6+FfMZVy2/DA6Xvrsql2vXHf
 /q+69TaoJ2Zwff4Mq2xQ7lYYPndr/6dzTThx2p3UCW5fVIS55gkIxwOkYUaIojQdToQ1
 GvT/pl9rfqLZBqfElAXk5BI6+RUM6FeLNE1iDfgE3m2ysyPmmE5WAsBqCekdw1U8RskP /w== 
In-Reply-To: <20221201104125.919483-6-roberto.sassu@huaweicloud.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Roberto Sassu <roberto.sassu@huaweicloud.com>, mark@fasheh.com, jlbec@evilplan.org, joseph.qi@linux.alibaba.com, dmitry.kasatkin@gmail.com, paul@paul-moore.com, jmorris@namei.org, serge@hallyn.com, stephen.smalley.work@gmail.com, eparis@parisplace.org, casey@schaufler-ca.com
Cc: ocfs2-devel@oss.oracle.com, reiserfs-devel@vger.kernel.org, linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org, selinux@vger.kernel.org, linux-kernel@vger.kernel.org, keescook@chromium.org, nicolas.bouchinet@clip-os.org, Roberto Sassu <roberto.sassu@huawei.com>

On Thu, 2022-12-01 at 11:41 +0100, Roberto Sassu wrote:
> From: Roberto Sassu <roberto.sassu@huawei.com>
> 
> Change the evm_inode_init_security() definition to align with the LSM
> infrastructure. Keep the existing behavior of including in the HMAC
> calculation only the first xattr provided by LSMs.
> 
> Changing the evm_inode_init_security() definition requires passing only the
> xattr array allocated by security_inode_init_security(), instead of the
> first LSM xattr and the place where the EVM xattr should be filled. In lieu
> of passing the EVM xattr, EVM must position itself after the last filled
> xattr (by checking the xattr name), since only the beginning of the xattr
> array is given.
> 
> Finally, make evm_inode_init_security() return value compatible with the
> inode_init_security hook conventions, i.e. return -EOPNOTSUPP if it is not
> setting an xattr.
> 
> EVM is a bit tricky, because xattrs is both an input and an output. If it
> was just output, EVM should have returned zero if xattrs is NULL. But,
> since xattrs is also input, EVM is unable to do its calculations, so return
> -EOPNOTSUPP and handle this error in security_inode_init_security().
> 
> Signed-off-by: Roberto Sassu <roberto.sassu@huawei.com>
> Reviewed-by: Casey Schaufler <casey@schaufler-ca.com>

One comment below, otherwise,
Reviewed-by: Mimi  Zohar <zohar@linux.ibm.com>


> ---
>  include/linux/evm.h               | 12 ++++++------
>  security/integrity/evm/evm_main.c | 20 +++++++++++++-------
>  security/security.c               |  5 ++---
>  3 files changed, 21 insertions(+), 16 deletions(-)
> 
> diff --git a/include/linux/evm.h b/include/linux/evm.h
> index aa63e0b3c0a2..3bb2ae9fe098 100644
> --- a/include/linux/evm.h
> +++ b/include/linux/evm.h
> @@ -35,9 +35,9 @@ extern int evm_inode_removexattr(struct user_namespace *mnt_userns,
>  				 struct dentry *dentry, const char *xattr_name);
>  extern void evm_inode_post_removexattr(struct dentry *dentry,
>  				       const char *xattr_name);
> -extern int evm_inode_init_security(struct inode *inode,
> -				   const struct xattr *xattr_array,
> -				   struct xattr *evm);
> +extern int evm_inode_init_security(struct inode *inode, struct inode *dir,
> +				   const struct qstr *qstr,
> +				   struct xattr *xattrs);
>  extern bool evm_revalidate_status(const char *xattr_name);
>  extern int evm_protected_xattr_if_enabled(const char *req_xattr_name);
>  extern int evm_read_protected_xattrs(struct dentry *dentry, u8 *buffer,
> @@ -108,9 +108,9 @@ static inline void evm_inode_post_removexattr(struct dentry *dentry,
>  	return;
>  }
>  
> -static inline int evm_inode_init_security(struct inode *inode,
> -					  const struct xattr *xattr_array,
> -					  struct xattr *evm)
> +static inline int evm_inode_init_security(struct inode *inode, struct inode *dir,
> +					  const struct qstr *qstr,
> +					  struct xattr *xattrs)
>  {
>  	return 0;
>  }
> diff --git a/security/integrity/evm/evm_main.c b/security/integrity/evm/evm_main.c
> index 23d484e05e6f..0a312cafb7de 100644
> --- a/security/integrity/evm/evm_main.c
> +++ b/security/integrity/evm/evm_main.c
> @@ -845,23 +845,29 @@ void evm_inode_post_setattr(struct dentry *dentry, int ia_valid)
>  /*
>   * evm_inode_init_security - initializes security.evm HMAC value
>   */
> -int evm_inode_init_security(struct inode *inode,
> -				 const struct xattr *lsm_xattr,
> -				 struct xattr *evm_xattr)
> +int evm_inode_init_security(struct inode *inode, struct inode *dir,
> +			    const struct qstr *qstr,
> +			    struct xattr *xattrs)
>  {
>  	struct evm_xattr *xattr_data;
> +	struct xattr *xattr, *evm_xattr;
>  	int rc;
>  
> -	if (!(evm_initialized & EVM_INIT_HMAC) ||
> -	    !evm_protected_xattr(lsm_xattr->name))
> -		return 0;
> +	if (!(evm_initialized & EVM_INIT_HMAC) || !xattrs ||
> +	    !evm_protected_xattr(xattrs->name))
> +		return -EOPNOTSUPP;
> +
> +	for (xattr = xattrs; xattr->value != NULL; xattr++)
> +		;

security_inode_init_security() already contains a comment for
allocating +2 extra space.   Adding a similar comment here to explain
why walking the xattrs like this is safe would be nice.

> +
> +	evm_xattr = xattr;
>  
>  	xattr_data = kzalloc(sizeof(*xattr_data), GFP_NOFS);
>  	if (!xattr_data)
>  		return -ENOMEM;
>  
>  	xattr_data->data.type = EVM_XATTR_HMAC;
> -	rc = evm_init_hmac(inode, lsm_xattr, xattr_data->digest);
> +	rc = evm_init_hmac(inode, xattrs, xattr_data->digest);
>  	if (rc < 0)
>  		goto out;
>  
> diff --git a/security/security.c b/security/security.c
> index 36804609caaa..44ce579daec1 100644
> --- a/security/security.c
> +++ b/security/security.c
> @@ -1190,9 +1190,8 @@ int security_inode_init_security(struct inode *inode, struct inode *dir,
>  	if (!num_filled_xattrs)
>  		goto out;
>  
> -	ret = evm_inode_init_security(inode, new_xattrs,
> -				      new_xattrs + num_filled_xattrs);
> -	if (ret)
> +	ret = evm_inode_init_security(inode, dir, qstr, new_xattrs);
> +	if (ret && ret != -EOPNOTSUPP)
>  		goto out;
>  	ret = initxattrs(inode, new_xattrs, fs_data);
>  out:


