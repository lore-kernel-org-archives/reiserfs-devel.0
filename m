From: Casey Schaufler <casey@schaufler-ca.com>
Subject: Re: [PATCH v6 4/6] security: Allow all LSMs to provide xattrs for
 inode_init_security hook
Date: Wed, 23 Nov 2022 09:17:04 -0800
Message-ID: <7eaacdff-521e-c30f-8ca0-3791a5dc4d45@schaufler-ca.com>
References: <20221123154712.752074-1-roberto.sassu@huaweicloud.com>
 <20221123154712.752074-5-roberto.sassu@huaweicloud.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-security-module-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1669223832; bh=9BI0WqEg/J8uZZ2nld6CrIGO8vM4bZEIj91ZlyjWVHU=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=Gh119z4IPcUm6bBkODAlIrthxwaz022TxJUGLPDs8yJjF+Lzvb1naRF76pKi9OFQ6SCAD24AZFf9vjhsJu11HT2CftTGyUjyXSf1KcmBaMDqxF/mr67g0biTITj+aJpIOqTfgn0wGCTUMsEFK3e4roa1ooHaMcj7oSTaeheweLJcPSVB++ckh4QN3xozE5QKsHWNRPGsOcUrXkg4sDTACqOxlk2fzjnx6jFzTmz0EgCdYf5111fKygkA1zs4bwH+u6nSDbbZ4l6OWKtOoszIJgHddR0WctFheSLhDrx58zT0eh5hclFskQ+UrNoM5UEBkehevn2qnoC9uU3rGlEnXA==
Content-Language: en-US
In-Reply-To: <20221123154712.752074-5-roberto.sassu@huaweicloud.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Roberto Sassu <roberto.sassu@huaweicloud.com>, mark@fasheh.com, jlbec@evilplan.org, joseph.qi@linux.alibaba.com, zohar@linux.ibm.com, dmitry.kasatkin@gmail.com, paul@paul-moore.com, jmorris@namei.org, serge@hallyn.com, stephen.smalley.work@gmail.com, eparis@parisplace.org
Cc: ocfs2-devel@oss.oracle.com, reiserfs-devel@vger.kernel.org, linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org, selinux@vger.kernel.org, linux-kernel@vger.kernel.org, keescook@chromium.org, nicolas.bouchinet@clip-os.org, Roberto Sassu <roberto.sassu@huawei.com>, casey@schaufler-ca.com

On 11/23/2022 7:47 AM, Roberto Sassu wrote:
> From: Roberto Sassu <roberto.sassu@huawei.com>
>
> Currently, security_inode_init_security() supports only one LSM providing
> an xattr and EVM calculating the HMAC on that xattr, plus other inode
> metadata.
>
> Allow all LSMs to provide one or multiple xattrs, by extending the security
> blob reservation mechanism. Introduce the new lbs_xattr field of the
> lsm_blob_sizes structure, so that each LSM can specify how many xattrs it
> needs, and the LSM infrastructure knows how many xattr slots it should
> allocate.
>
> Dynamically allocate the xattrs array to be populated by LSMs with the
> inode_init_security hook, and pass it to the latter instead of the
> name/value/len triple. Update the documentation accordingly, and fix the
> description of the xattr name, as it is not allocated anymore.
>
> Since the LSM infrastructure, at initialization time, updates the number of
> the requested xattrs provided by each LSM with a corresponding offset in
> the security blob (in this case the xattr array), it makes straightforward
> for an LSM to access the right position in the xattr array.
>
> There is still the issue that an LSM might not fill the xattr, even if it
> requests it (legitimate case, for example it might have been loaded but not
> initialized with a policy). Since users of the xattr array (e.g. the
> initxattrs() callbacks) detect the end of the xattr array by checking if
> the xattr name is NULL, not filling an xattr would cause those users to
> stop scanning xattrs prematurely.
>
> Solve that issue by introducing security_check_compact_filled_xattrs(),
> which does a basic check of the xattr array (if the xattr name is filled,
> the xattr value should be too, and viceversa), and compacts the xattr array
> by removing the holes.
>
> An alternative solution would be to let users of the xattr array know the
> number of elements of that array, so that they don't have to check the
> termination. However, this seems more invasive, compared to a simple move
> of few array elements.
>
> security_check_compact_filled_xattrs() also determines how many xattrs in
> the xattr array have been filled. If there is none, skip
> evm_inode_init_security() and initxattrs(). Skipping the former also avoids
> EVM to crash the kernel, as it is expecting a filled xattr.
>
> Finally, adapt both SELinux and Smack to use the new definition of the
> inode_init_security hook, and to correctly fill the designated slots in the
> xattr array. For Smack, reserve space for the other defined xattrs although
> they are not set yet in smack_inode_init_security().
>
> Signed-off-by: Roberto Sassu <roberto.sassu@huawei.com>
> ---
>  include/linux/lsm_hook_defs.h |   3 +-
>  include/linux/lsm_hooks.h     |  17 ++++--
>  security/security.c           | 103 +++++++++++++++++++++++++++++-----
>  security/selinux/hooks.c      |  19 ++++---
>  security/smack/smack_lsm.c    |  26 +++++----
>  5 files changed, 127 insertions(+), 41 deletions(-)
>
> diff --git a/include/linux/lsm_hook_defs.h b/include/linux/lsm_hook_defs.h
> index ec119da1d89b..be344d0211f8 100644
> --- a/include/linux/lsm_hook_defs.h
> +++ b/include/linux/lsm_hook_defs.h
> @@ -112,8 +112,7 @@ LSM_HOOK(int, 0, path_notify, const struct path *path, u64 mask,
>  LSM_HOOK(int, 0, inode_alloc_security, struct inode *inode)
>  LSM_HOOK(void, LSM_RET_VOID, inode_free_security, struct inode *inode)
>  LSM_HOOK(int, 0, inode_init_security, struct inode *inode,
> -	 struct inode *dir, const struct qstr *qstr, const char **name,
> -	 void **value, size_t *len)
> +	 struct inode *dir, const struct qstr *qstr, struct xattr *xattrs)
>  LSM_HOOK(int, 0, inode_init_security_anon, struct inode *inode,
>  	 const struct qstr *name, const struct inode *context_inode)
>  LSM_HOOK(int, 0, inode_create, struct inode *dir, struct dentry *dentry,
> diff --git a/include/linux/lsm_hooks.h b/include/linux/lsm_hooks.h
> index 4ec80b96c22e..ba1655370643 100644
> --- a/include/linux/lsm_hooks.h
> +++ b/include/linux/lsm_hooks.h
> @@ -229,18 +229,22 @@
>   *	This hook is called by the fs code as part of the inode creation
>   *	transaction and provides for atomic labeling of the inode, unlike
>   *	the post_create/mkdir/... hooks called by the VFS.  The hook function
> - *	is expected to allocate the name and value via kmalloc, with the caller
> - *	being responsible for calling kfree after using them.
> + *	is expected to allocate the value via kmalloc, with the caller
> + *	being responsible for calling kfree after using it.
>   *	If the security module does not use security attributes or does
>   *	not wish to put a security attribute on this particular inode,
>   *	then it should return -EOPNOTSUPP to skip this processing.
>   *	@inode contains the inode structure of the newly created inode.
>   *	@dir contains the inode structure of the parent directory.
>   *	@qstr contains the last path component of the new object
> - *	@name will be set to the allocated name suffix (e.g. selinux).
> - *	@value will be set to the allocated attribute value.
> - *	@len will be set to the length of the value.
> - *	Returns 0 if @name and @value have been successfully set,
> + *	@xattrs contains the full array of xattrs provided by LSMs where
> + *	->name will be set to the name suffix (e.g. selinux).
> + *	->value will be set to the allocated attribute value.
> + *	->value_len will be set to the length of the value.
> + *	Slots in @xattrs need to be reserved by LSMs by providing the number of
> + *	the desired xattrs in the lbs_xattr field of the lsm_blob_sizes
> + *	structure.
> + *	Returns 0 if the requested slots in @xattrs have been successfully set,
>   *	-EOPNOTSUPP if no security attribute is needed, or
>   *	-ENOMEM on memory allocation failure.
>   * @inode_init_security_anon:
> @@ -1624,6 +1628,7 @@ struct lsm_blob_sizes {
>  	int	lbs_ipc;
>  	int	lbs_msg_msg;
>  	int	lbs_task;
> +	int	lbs_xattr;
>  };
>  
>  /*
> diff --git a/security/security.c b/security/security.c
> index e2857446fd32..26aaa5850867 100644
> --- a/security/security.c
> +++ b/security/security.c
> @@ -30,8 +30,6 @@
>  #include <linux/msg.h>
>  #include <net/flow.h>
>  
> -#define MAX_LSM_EVM_XATTR	2
> -
>  /* How many LSMs were built into the kernel? */
>  #define LSM_COUNT (__end_lsm_info - __start_lsm_info)
>  
> @@ -210,6 +208,7 @@ static void __init lsm_set_blob_sizes(struct lsm_blob_sizes *needed)
>  	lsm_set_blob_size(&needed->lbs_msg_msg, &blob_sizes.lbs_msg_msg);
>  	lsm_set_blob_size(&needed->lbs_superblock, &blob_sizes.lbs_superblock);
>  	lsm_set_blob_size(&needed->lbs_task, &blob_sizes.lbs_task);
> +	lsm_set_blob_size(&needed->lbs_xattr, &blob_sizes.lbs_xattr);
>  }
>  
>  /* Prepare LSM for initialization. */
> @@ -346,6 +345,7 @@ static void __init ordered_lsm_init(void)
>  	init_debug("msg_msg blob size    = %d\n", blob_sizes.lbs_msg_msg);
>  	init_debug("superblock blob size = %d\n", blob_sizes.lbs_superblock);
>  	init_debug("task blob size       = %d\n", blob_sizes.lbs_task);
> +	init_debug("xattr slots          = %d\n", blob_sizes.lbs_xattr);
>  
>  	/*
>  	 * Create any kmem_caches needed for blobs
> @@ -1089,37 +1089,110 @@ int security_dentry_create_files_as(struct dentry *dentry, int mode,
>  }
>  EXPORT_SYMBOL(security_dentry_create_files_as);
>  
> +/**
> + * security_check_compact_filled_xattrs - check xattrs and make array contiguous
> + * @xattrs: xattr array filled by LSMs
> + * @num_xattrs: length of xattr array
> + * @num_filled_xattrs: number of already processed xattrs
> + *
> + * Ensure that each xattr slot is correctly filled and close the gaps in the
> + * xattr array if an LSM didn't provide an xattr for which it asked space
> + * (legitimate case, it might have been loaded but not initialized). An LSM
> + * might request space in the xattr array for one or multiple xattrs. The LSM
> + * infrastructure ensures that all requests by LSMs are satisfied.
> + *
> + * Track the number of filled xattrs in @num_filled_xattrs, so that it is easy
> + * to determine whether the currently processed xattr is fine in its position
> + * (if all previous xattrs were filled) or it should be moved after the last
> + * filled xattr.
> + *
> + * Return: zero if all xattrs are valid, -EINVAL otherwise.
> + */
> +static int security_check_compact_filled_xattrs(struct xattr *xattrs,
> +						int num_xattrs,
> +						int *num_filled_xattrs)
> +{
> +	int i;
> +
> +	for (i = *num_filled_xattrs; i < num_xattrs; i++) {
> +		if ((!xattrs[i].name && xattrs[i].value) ||
> +		    (xattrs[i].name && !xattrs[i].value))
> +			return -EINVAL;
> +
> +		if (!xattrs[i].name)
> +			continue;
> +
> +		if (i == *num_filled_xattrs) {
> +			(*num_filled_xattrs)++;
> +			continue;
> +		}
> +
> +		memcpy(xattrs + (*num_filled_xattrs)++, xattrs + i,
> +		       sizeof(*xattrs));
> +		memset(xattrs + i, 0, sizeof(*xattrs));
> +	}
> +
> +	return 0;
> +}
> +
>  int security_inode_init_security(struct inode *inode, struct inode *dir,
>  				 const struct qstr *qstr,
>  				 const initxattrs initxattrs, void *fs_data)
>  {
> -	struct xattr new_xattrs[MAX_LSM_EVM_XATTR + 1];
> -	struct xattr *lsm_xattr, *evm_xattr, *xattr;
> -	int ret;
> +	struct security_hook_list *P;
> +	struct xattr *new_xattrs;
> +	struct xattr *xattr;
> +	int ret = -EOPNOTSUPP, num_filled_xattrs = 0;
>  
>  	if (unlikely(IS_PRIVATE(inode)))
>  		return 0;
>  
> +	if (!blob_sizes.lbs_xattr)
> +		return 0;
> +
>  	if (!initxattrs)
>  		return call_int_hook(inode_init_security, -EOPNOTSUPP, inode,
> -				     dir, qstr, NULL, NULL, NULL);
> -	memset(new_xattrs, 0, sizeof(new_xattrs));
> -	lsm_xattr = new_xattrs;
> -	ret = call_int_hook(inode_init_security, -EOPNOTSUPP, inode, dir, qstr,
> -						&lsm_xattr->name,
> -						&lsm_xattr->value,
> -						&lsm_xattr->value_len);
> -	if (ret)
> +				    dir, qstr, NULL);
> +	/* Allocate +1 for EVM and +1 as terminator. */
> +	new_xattrs = kcalloc(blob_sizes.lbs_xattr + 2, sizeof(*new_xattrs),
> +			     GFP_NOFS);
> +	if (!new_xattrs)
> +		return -ENOMEM;
> +
> +	hlist_for_each_entry(P, &security_hook_heads.inode_init_security,
> +			     list) {
> +		ret = P->hook.inode_init_security(inode, dir, qstr, new_xattrs);
> +		if (ret && ret != -EOPNOTSUPP)
> +			goto out;
> +		if (ret == -EOPNOTSUPP)
> +			continue;
> +		/*
> +		 * As the number of xattrs reserved by LSMs is not directly
> +		 * available, directly use the total number blob_sizes.lbs_xattr
> +		 * to keep the code simple, while being not the most efficient
> +		 * way.
> +		 */
> +		ret = security_check_compact_filled_xattrs(new_xattrs,
> +							   blob_sizes.lbs_xattr,
> +							   &num_filled_xattrs);
> +		if (ret < 0) {
> +			ret = -ENOMEM;
> +			goto out;
> +		}
> +	}
> +
> +	if (!num_filled_xattrs)
>  		goto out;
>  
> -	evm_xattr = lsm_xattr + 1;
> -	ret = evm_inode_init_security(inode, lsm_xattr, evm_xattr);
> +	ret = evm_inode_init_security(inode, new_xattrs,
> +				      new_xattrs + num_filled_xattrs);
>  	if (ret)
>  		goto out;
>  	ret = initxattrs(inode, new_xattrs, fs_data);
>  out:
>  	for (xattr = new_xattrs; xattr->value != NULL; xattr++)
>  		kfree(xattr->value);
> +	kfree(new_xattrs);
>  	return (ret == -EOPNOTSUPP) ? 0 : ret;
>  }
>  EXPORT_SYMBOL(security_inode_init_security);
> diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
> index f553c370397e..57e5bc7c9ed8 100644
> --- a/security/selinux/hooks.c
> +++ b/security/selinux/hooks.c
> @@ -104,6 +104,8 @@
>  #include "audit.h"
>  #include "avc_ss.h"
>  
> +#define SELINUX_INODE_INIT_XATTRS 1
> +
>  struct selinux_state selinux_state;
>  
>  /* SECMARK reference count */
> @@ -2868,11 +2870,11 @@ static int selinux_dentry_create_files_as(struct dentry *dentry, int mode,
>  
>  static int selinux_inode_init_security(struct inode *inode, struct inode *dir,
>  				       const struct qstr *qstr,
> -				       const char **name,
> -				       void **value, size_t *len)
> +				       struct xattr *xattrs)
>  {
>  	const struct task_security_struct *tsec = selinux_cred(current_cred());
>  	struct superblock_security_struct *sbsec;
> +	struct xattr *xattr = NULL;
>  	u32 newsid, clen;
>  	int rc;
>  	char *context;
> @@ -2899,16 +2901,18 @@ static int selinux_inode_init_security(struct inode *inode, struct inode *dir,
>  	    !(sbsec->flags & SBLABEL_MNT))
>  		return -EOPNOTSUPP;
>  
> -	if (name)
> -		*name = XATTR_SELINUX_SUFFIX;
> +	if (xattrs)
> +		xattr = xattrs + selinux_blob_sizes.lbs_xattr;
> +
> +	if (xattr) {
> +		xattr->name = XATTR_SELINUX_SUFFIX;
>  
> -	if (value && len) {
>  		rc = security_sid_to_context_force(&selinux_state, newsid,
>  						   &context, &clen);
>  		if (rc)
>  			return rc;
> -		*value = context;
> -		*len = clen;
> +		xattr->value = context;
> +		xattr->value_len = clen;
>  	}
>  
>  	return 0;
> @@ -6900,6 +6904,7 @@ struct lsm_blob_sizes selinux_blob_sizes __lsm_ro_after_init = {
>  	.lbs_ipc = sizeof(struct ipc_security_struct),
>  	.lbs_msg_msg = sizeof(struct msg_security_struct),
>  	.lbs_superblock = sizeof(struct superblock_security_struct),
> +	.lbs_xattr = SELINUX_INODE_INIT_XATTRS,
>  };
>  
>  #ifdef CONFIG_PERF_EVENTS
> diff --git a/security/smack/smack_lsm.c b/security/smack/smack_lsm.c
> index b6306d71c908..a7c3e4284754 100644
> --- a/security/smack/smack_lsm.c
> +++ b/security/smack/smack_lsm.c
> @@ -52,6 +52,8 @@
>  #define SMK_RECEIVING	1
>  #define SMK_SENDING	2
>  

How about a comment here to answer the inevitable "What 4 attributes?" question.

+/*
+ * Smack uses multiple xattrs.
+ * SMACK64 - for access control, SMACK64EXEC - label for the program,
+ * SMACK64MMAP - controls library loading, SMACK64TRANSMUTE - label initialization
+ * Not saved on files - SMACK64IPIN and SMACK64IPOUT
+ */

> +#define SMACK_INODE_INIT_XATTRS 4
> +
>  #ifdef SMACK_IPV6_PORT_LABELING
>  static DEFINE_MUTEX(smack_ipv6_lock);
>  static LIST_HEAD(smk_ipv6_port_list);
> @@ -939,26 +941,27 @@ static int smack_inode_alloc_security(struct inode *inode)
>   * @inode: the newly created inode
>   * @dir: containing directory object
>   * @qstr: unused
> - * @name: where to put the attribute name
> - * @value: where to put the attribute value
> - * @len: where to put the length of the attribute
> + * @xattrs: where to put the attribute
>   *
>   * Returns 0 if it all works out, -ENOMEM if there's no memory
>   */
>  static int smack_inode_init_security(struct inode *inode, struct inode *dir,
> -				     const struct qstr *qstr, const char **name,
> -				     void **value, size_t *len)
> +				     const struct qstr *qstr,
> +				     struct xattr *xattrs)
>  {
>  	struct inode_smack *issp = smack_inode(inode);
>  	struct smack_known *skp = smk_of_current();
>  	struct smack_known *isp = smk_of_inode(inode);
>  	struct smack_known *dsp = smk_of_inode(dir);
> +	struct xattr *xattr = NULL;
>  	int may;
>  
> -	if (name)
> -		*name = XATTR_SMACK_SUFFIX;
> +	if (xattrs)
> +		xattr = xattrs + smack_blob_sizes.lbs_xattr;
> +
> +	if (xattr) {
> +		xattr->name = XATTR_SMACK_SUFFIX;
>  
> -	if (value && len) {
>  		rcu_read_lock();
>  		may = smk_access_entry(skp->smk_known, dsp->smk_known,
>  				       &skp->smk_rules);
> @@ -976,11 +979,11 @@ static int smack_inode_init_security(struct inode *inode, struct inode *dir,
>  			issp->smk_flags |= SMK_INODE_CHANGED;
>  		}
>  
> -		*value = kstrdup(isp->smk_known, GFP_NOFS);
> -		if (*value == NULL)
> +		xattr->value = kstrdup(isp->smk_known, GFP_NOFS);
> +		if (xattr->value == NULL)
>  			return -ENOMEM;
>  
> -		*len = strlen(isp->smk_known);
> +		xattr->value_len = strlen(isp->smk_known);
>  	}
>  
>  	return 0;
> @@ -4785,6 +4788,7 @@ struct lsm_blob_sizes smack_blob_sizes __lsm_ro_after_init = {
>  	.lbs_ipc = sizeof(struct smack_known *),
>  	.lbs_msg_msg = sizeof(struct smack_known *),
>  	.lbs_superblock = sizeof(struct superblock_smack),
> +	.lbs_xattr = SMACK_INODE_INIT_XATTRS,
>  };
>  
>  static struct security_hook_list smack_hooks[] __lsm_ro_after_init = {
