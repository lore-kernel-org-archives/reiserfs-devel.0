From: Mimi Zohar <zohar@linux.ibm.com>
Subject: Re: [PATCH v10 3/4] evm: Align evm_inode_init_security() definition
 with LSM infrastructure
Date: Tue, 11 Apr 2023 03:22:43 -0400
Message-ID: <404a022216d33063ff8f8b4f0d31d9d38a2da4d4.camel@linux.ibm.com>
References: <20230331123221.3273328-1-roberto.sassu@huaweicloud.com>
         <20230331123221.3273328-4-roberto.sassu@huaweicloud.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-security-module-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=F5oaR7mQS9YSO9cMB8O+css1vtlsYjRNMU5UQxqGHHU=;
 b=f/a2vBUGI0uqJSxc8Gujiw6NHg7uuX4idlXVQcqO8jQYbu4EMQIV+w4AP4mhdQg4H8T2
 EGGT6WIA5iuYXMLq+eYeJ5LXcb/twzbuc5dENjyvt0X16yWXkMx7ZPrKvfrX7uQOpkMw
 CT5aNsXF9k8tebQnEp687qLG5CddIWA2Xp2iY/5S1mzNtiybPGvxvRfvOw4cjVoTHE8a
 cfgSo72sz5ZVvrzkpyqSpX5B233PPYA1Dk/Tzs2wvBzq0pKn4A9VSKkc9ULkjPeYWzf5
 TkPUrdmH2YleC2Gncwk0AclqPVjWO0e1m/mb07+sshPZc3qSQYvvGqkXTE533cXQyMAw pA== 
In-Reply-To: <20230331123221.3273328-4-roberto.sassu@huaweicloud.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Roberto Sassu <roberto.sassu@huaweicloud.com>, dmitry.kasatkin@gmail.com, paul@paul-moore.com, jmorris@namei.org, serge@hallyn.com, stephen.smalley.work@gmail.com, eparis@parisplace.org, casey@schaufler-ca.com
Cc: reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org, linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org, selinux@vger.kernel.org, bpf@vger.kernel.org, kpsingh@kernel.org, keescook@chromium.org, nicolas.bouchinet@clip-os.org, Roberto Sassu <roberto.sassu@huawei.com>

On Fri, 2023-03-31 at 14:32 +0200, Roberto Sassu wrote:
> From: Roberto Sassu <roberto.sassu@huawei.com>
> 
> Change the evm_inode_init_security() definition to align with the LSM
> infrastructure. Keep the existing behavior of including in the HMAC
> calculation only the first xattr provided by LSMs.
> 
> Changing the evm_inode_init_security() definition requires passing the
> xattr array allocated by security_inode_init_security(), and the number of
> xattrs filled by previously invoked LSMs.
> 
> Use the newly introduced lsm_get_xattr_slot() to position EVM correctly in
> the xattrs array, like a regular LSM, and to increment the number of filled
> slots. For now, the LSM infrastructure allocates enough xattrs slots to
> store the EVM xattr, without using the reservation mechanism.
> 
> Signed-off-by: Roberto Sassu <roberto.sassu@huawei.com>
> ---
>  include/linux/evm.h               | 13 +++++++------
>  security/integrity/evm/evm_main.c | 16 ++++++++++------
>  security/security.c               |  6 +++---
>  3 files changed, 20 insertions(+), 15 deletions(-)
> 
> diff --git a/include/linux/evm.h b/include/linux/evm.h
> index 7dc1ee74169..597632c71c7 100644
> --- a/include/linux/evm.h
> +++ b/include/linux/evm.h
> @@ -56,9 +56,9 @@ static inline void evm_inode_post_set_acl(struct dentry *dentry,
>  {
>  	return evm_inode_post_setxattr(dentry, acl_name, NULL, 0);
>  }
> -extern int evm_inode_init_security(struct inode *inode,
> -				   const struct xattr *xattr_array,
> -				   struct xattr *evm);
> +extern int evm_inode_init_security(struct inode *inode, struct inode *dir,
> +				   const struct qstr *qstr,
> +				   struct xattr *xattrs, int *xattr_count);
>  extern bool evm_revalidate_status(const char *xattr_name);
>  extern int evm_protected_xattr_if_enabled(const char *req_xattr_name);
>  extern int evm_read_protected_xattrs(struct dentry *dentry, u8 *buffer,
> @@ -157,9 +157,10 @@ static inline void evm_inode_post_set_acl(struct dentry *dentry,
>  	return;
>  }
>  
> -static inline int evm_inode_init_security(struct inode *inode,
> -					  const struct xattr *xattr_array,
> -					  struct xattr *evm)
> +static inline int evm_inode_init_security(struct inode *inode, struct inode *dir,
> +					  const struct qstr *qstr,
> +					  struct xattr *xattrs,
> +					  int *xattr_count)
>  {
>  	return 0;
>  }
> diff --git a/security/integrity/evm/evm_main.c b/security/integrity/evm/evm_main.c
> index cf24c525558..475196ce712 100644
> --- a/security/integrity/evm/evm_main.c
> +++ b/security/integrity/evm/evm_main.c
> @@ -21,6 +21,7 @@
>  #include <linux/evm.h>
>  #include <linux/magic.h>
>  #include <linux/posix_acl_xattr.h>
> +#include <linux/lsm_hooks.h>
>  
>  #include <crypto/hash.h>
>  #include <crypto/hash_info.h>
> @@ -864,23 +865,26 @@ void evm_inode_post_setattr(struct dentry *dentry, int ia_valid)
>  /*
>   * evm_inode_init_security - initializes security.evm HMAC value
>   */
> -int evm_inode_init_security(struct inode *inode,
> -				 const struct xattr *lsm_xattr,
> -				 struct xattr *evm_xattr)
> +int evm_inode_init_security(struct inode *inode, struct inode *dir,
> +			    const struct qstr *qstr, struct xattr *xattrs,
> +			    int *xattr_count)
>  {
>  	struct evm_xattr *xattr_data;
> +	struct xattr *evm_xattr;
>  	int rc;
>  
> -	if (!(evm_initialized & EVM_INIT_HMAC) ||
> -	    !evm_protected_xattr(lsm_xattr->name))
> +	if (!(evm_initialized & EVM_INIT_HMAC) || !xattrs ||
> +	    !evm_protected_xattr(xattrs->name))
>  		return 0;
>  
> +	evm_xattr = lsm_get_xattr_slot(xattrs, xattr_count);
> +
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
> index 1aeaa8ce449..ef7779ec8b2 100644
> --- a/security/security.c
> +++ b/security/security.c
> @@ -1645,9 +1645,9 @@ int security_inode_init_security(struct inode *inode, struct inode *dir,
>  	if (!xattr_count)
>  		goto out;
>  
> -	ret = evm_inode_init_security(inode, new_xattrs,
> -				      new_xattrs + xattr_count);
> -	if (ret)
> +	ret = evm_inode_init_security(inode, dir, qstr, new_xattrs,
> +				      &xattr_count);
> +	if (ret && ret != -EOPNOTSUPP)

As previously discussed, -EOPNOTSUPP originally meant that the
filesystem itself did not support writing xattrs.  So there was no
point in trying to write the EVM security xattr.   With the change in
-EOPNOTSUPP meaning, it will now try to write the EVM security xattr. 
Instead of glossing over the change in behavior, it needs to at least
be mentioned in the patch description.

>  		goto out;
>  	ret = initxattrs(inode, new_xattrs, fs_data);
>  out:

-- 
thanks,

Mimi

