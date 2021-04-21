From: Casey Schaufler <casey@schaufler-ca.com>
Subject: Re: [PATCH v2 3/6] security: Pass xattrs allocated by LSMs to the
 inode_init_security hook
Date: Wed, 21 Apr 2021 15:43:49 -0700
Message-ID: <0caf1e58-1e2d-c781-3f71-18aaf55cada2@schaufler-ca.com>
References: <20210421161925.968825-1-roberto.sassu@huawei.com>
 <20210421161925.968825-4-roberto.sassu@huawei.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-security-module-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1619045035; bh=MB9zO7McvPmioxzhN+e5Vh39AUmsx8/cXEwQ1feTM0s=; h=Subject:To:Cc:References:From:Date:In-Reply-To:From:Subject:Reply-To; b=DmWXKFnjz2d6JUBIVczNc/zjMfKTXbm21VW1dfa04ONIPY/snL8uluYvp4jhdUFbhYqzLMjOIcl+d/2/Z4LwOaQGug4Z4bsBS2ia9MbexNzsp9M6ILAmUepHbk5gizG8gz9vFB/dbajGuCXHBWXyFpbGPm1SbY1ObVSTlRdQDN/DPGFIbaVgTemQXlMqOhfLdflpaWELfFm2+TeqPSq2ntY6GNQIawXiXA0NfA6eRQF7B72QrhHQZZd/JEo+7XXr7N3ZBkSk6q6zqfhWMbsMYSjfGcVix2tCOFEKMSUrXms88Kp0WWkhx1Bb6W8iNIcivZ9U3SN5PTNyLrJOCpqRnw==
In-Reply-To: <20210421161925.968825-4-roberto.sassu@huawei.com>
Content-Language: en-US
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Roberto Sassu <roberto.sassu@huawei.com>, zohar@linux.ibm.com, jmorris@namei.org, paul@paul-moore.com
Cc: linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, selinux@vger.kernel.org, reiserfs-devel@vger.kernel.org, Casey Schaufler <casey@schaufler-ca.com>

On 4/21/2021 9:19 AM, Roberto Sassu wrote:
> In preparation for moving EVM to the LSM infrastructure, this patch
> replaces the name, value, len triple with the xattr array pointer provi=
ded
> by security_inode_init_security(). LSMs are expected to call the new
> function lsm_find_xattr_slot() to find the first unused slot of the arr=
ay
> where the xattr should be written.
>
> This patch modifies also SELinux and Smack to search for an unused slot=
, to
> have a consistent behavior across LSMs (the unmodified version would
> overwrite the xattr set by the first LSM in the chain). It is also
> desirable to have the modification in those LSMs, as they are likely us=
ed
> as a reference for the development of new LSMs.

This looks better than V1. One safety comment below.

>
> Signed-off-by: Roberto Sassu <roberto.sassu@huawei.com>
> ---
>  include/linux/lsm_hook_defs.h |  4 ++--
>  include/linux/lsm_hooks.h     | 18 +++++++++++++++---
>  security/security.c           | 13 +++++++------
>  security/selinux/hooks.c      | 13 ++++++-------
>  security/smack/smack_lsm.c    | 20 +++++++++-----------
>  5 files changed, 39 insertions(+), 29 deletions(-)
>
> diff --git a/include/linux/lsm_hook_defs.h b/include/linux/lsm_hook_def=
s.h
> index 477a597db013..afb9dd122f60 100644
> --- a/include/linux/lsm_hook_defs.h
> +++ b/include/linux/lsm_hook_defs.h
> @@ -111,8 +111,8 @@ LSM_HOOK(int, 0, path_notify, const struct path *pa=
th, u64 mask,
>  LSM_HOOK(int, 0, inode_alloc_security, struct inode *inode)
>  LSM_HOOK(void, LSM_RET_VOID, inode_free_security, struct inode *inode)=

>  LSM_HOOK(int, 0, inode_init_security, struct inode *inode,
> -	 struct inode *dir, const struct qstr *qstr, const char **name,
> -	 void **value, size_t *len)
> +	 struct inode *dir, const struct qstr *qstr, struct xattr *xattrs,
> +	 void *fs_data)
>  LSM_HOOK(int, 0, inode_init_security_anon, struct inode *inode,
>  	 const struct qstr *name, const struct inode *context_inode)
>  LSM_HOOK(int, 0, inode_create, struct inode *dir, struct dentry *dentr=
y,
> diff --git a/include/linux/lsm_hooks.h b/include/linux/lsm_hooks.h
> index c5498f5174ce..e8c9bac29b9d 100644
> --- a/include/linux/lsm_hooks.h
> +++ b/include/linux/lsm_hooks.h
> @@ -27,6 +27,7 @@
> =20
>  #include <linux/security.h>
>  #include <linux/init.h>
> +#include <linux/xattr.h>
>  #include <linux/rculist.h>
> =20
>  /**
> @@ -227,9 +228,11 @@
>   *	@inode contains the inode structure of the newly created inode.
>   *	@dir contains the inode structure of the parent directory.
>   *	@qstr contains the last path component of the new object
> - *	@name will be set to the allocated name suffix (e.g. selinux).
> - *	@value will be set to the allocated attribute value.
> - *	@len will be set to the length of the value.
> + *	@xattrs contains the full array of xattrs allocated by LSMs where
> + *	->name will be set to the allocated name suffix (e.g. selinux).
> + *	->value will be set to the allocated attribute value.
> + *	->len will be set to the length of the value.
> + *	@fs_data contains filesystem-specific data.
>   *	Returns 0 if @name and @value have been successfully set,
>   *	-EOPNOTSUPP if no security attribute is needed, or
>   *	-ENOMEM on memory allocation failure.
> @@ -1661,4 +1664,13 @@ static inline void security_delete_hooks(struct =
security_hook_list *hooks,
> =20
>  extern int lsm_inode_alloc(struct inode *inode);
> =20

Some "security researcher" with a fuzz tester is going to manage to dump =
junk
into the slots and ruin your week. I suggest a simple change to make boun=
ds checking
possible. It should never happen, but if that was sufficient people would=20
love C
string processing better.

> +static inline struct xattr *lsm_find_xattr_slot(struct xattr *xattrs)

+static inline struct xattr *lsm_find_xattr_slot(struct xattr *xattrs, in=
t available)

> +{
> +	struct xattr *slot;
> +
> +	for (slot =3D xattrs; slot && slot->name !=3D NULL; slot++)

+	for (slot =3D xattrs; slot && slot->name !=3D NULL; slot++)
 		if (WARN_ON(slot > xattrs[available]))
			return NULL;=20

> +		;
> +
> +	return slot;
> +}
>  #endif /* ! __LINUX_LSM_HOOKS_H */
> diff --git a/security/security.c b/security/security.c
> index 7f14e59c4f8e..2c1fe1496069 100644
> --- a/security/security.c
> +++ b/security/security.c
> @@ -1037,18 +1037,16 @@ int security_inode_init_security(struct inode *=
inode, struct inode *dir,
> =20
>  	if (!initxattrs)
>  		return call_int_hook(inode_init_security, -EOPNOTSUPP, inode,
> -				     dir, qstr, NULL, NULL, NULL);
> +				     dir, qstr, NULL, fs_data);
>  	memset(new_xattrs, 0, sizeof(new_xattrs));
>  	lsm_xattr =3D new_xattrs;
>  	ret =3D call_int_hook(inode_init_security, -EOPNOTSUPP, inode, dir, q=
str,
> -						&lsm_xattr->name,
> -						&lsm_xattr->value,
> -						&lsm_xattr->value_len);
> +			    lsm_xattr, fs_data);
>  	if (ret)
>  		goto out;
> =20
>  	evm_xattr =3D lsm_xattr + 1;
> -	ret =3D evm_inode_init_security(inode, lsm_xattr, evm_xattr);
> +	ret =3D evm_inode_init_security(inode, new_xattrs, evm_xattr);
>  	if (ret)
>  		goto out;
>  	ret =3D initxattrs(inode, new_xattrs, fs_data);
> @@ -1071,10 +1069,13 @@ int security_old_inode_init_security(struct ino=
de *inode, struct inode *dir,
>  				     const struct qstr *qstr, const char **name,
>  				     void **value, size_t *len)
>  {
> +	struct xattr xattr =3D { .name =3D NULL, .value =3D NULL, .value_len =
=3D 0 };
> +	struct xattr *lsm_xattr =3D (name && value && len) ? &xattr : NULL;
> +
>  	if (unlikely(IS_PRIVATE(inode)))
>  		return -EOPNOTSUPP;
>  	return call_int_hook(inode_init_security, -EOPNOTSUPP, inode, dir,
> -			     qstr, name, value, len);
> +			     qstr, lsm_xattr, NULL);
>  }
>  EXPORT_SYMBOL(security_old_inode_init_security);
> =20
> diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
> index ddd097790d47..806827eb132a 100644
> --- a/security/selinux/hooks.c
> +++ b/security/selinux/hooks.c
> @@ -2916,11 +2916,11 @@ static int selinux_dentry_create_files_as(struc=
t dentry *dentry, int mode,
> =20
>  static int selinux_inode_init_security(struct inode *inode, struct ino=
de *dir,
>  				       const struct qstr *qstr,
> -				       const char **name,
> -				       void **value, size_t *len)
> +				       struct xattr *xattrs, void *fs_data)
>  {
>  	const struct task_security_struct *tsec =3D selinux_cred(current_cred=
());
>  	struct superblock_security_struct *sbsec;
> +	struct xattr *xattr =3D lsm_find_xattr_slot(xattrs);
>  	u32 newsid, clen;
>  	int rc;
>  	char *context;
> @@ -2947,16 +2947,15 @@ static int selinux_inode_init_security(struct i=
node *inode, struct inode *dir,
>  	    !(sbsec->flags & SBLABEL_MNT))
>  		return -EOPNOTSUPP;
> =20
> -	if (name)
> -		*name =3D XATTR_SELINUX_SUFFIX;
> +	if (xattr) {
> +		xattr->name =3D XATTR_SELINUX_SUFFIX;
> =20
> -	if (value && len) {
>  		rc =3D security_sid_to_context_force(&selinux_state, newsid,
>  						   &context, &clen);
>  		if (rc)
>  			return rc;
> -		*value =3D context;
> -		*len =3D clen;
> +		xattr->value =3D context;
> +		xattr->value_len =3D clen;
>  	}
> =20
>  	return 0;
> diff --git a/security/smack/smack_lsm.c b/security/smack/smack_lsm.c
> index 12a45e61c1a5..af7eee0fee52 100644
> --- a/security/smack/smack_lsm.c
> +++ b/security/smack/smack_lsm.c
> @@ -962,26 +962,24 @@ static int smack_inode_alloc_security(struct inod=
e *inode)
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
>  static int smack_inode_init_security(struct inode *inode, struct inode=20
*dir,
> -				     const struct qstr *qstr, const char **name,
> -				     void **value, size_t *len)
> +				     const struct qstr *qstr,
> +				     struct xattr *xattrs, void *fs_data)
>  {
>  	struct inode_smack *issp =3D smack_inode(inode);
>  	struct smack_known *skp =3D smk_of_current();
>  	struct smack_known *isp =3D smk_of_inode(inode);
>  	struct smack_known *dsp =3D smk_of_inode(dir);
> +	struct xattr *xattr =3D lsm_find_xattr_slot(xattrs);
>  	int may;
> =20
> -	if (name)
> -		*name =3D XATTR_SMACK_SUFFIX;
> +	if (xattr) {
> +		xattr->name =3D XATTR_SMACK_SUFFIX;
> =20
> -	if (value && len) {
>  		rcu_read_lock();
>  		may =3D smk_access_entry(skp->smk_known, dsp->smk_known,
>  				       &skp->smk_rules);
> @@ -999,11 +997,11 @@ static int smack_inode_init_security(struct inode=20
*inode, struct inode *dir,
>  			issp->smk_flags |=3D SMK_INODE_CHANGED;
>  		}
> =20
> -		*value =3D kstrdup(isp->smk_known, GFP_NOFS);
> -		if (*value =3D=3D NULL)
> +		xattr->value =3D kstrdup(isp->smk_known, GFP_NOFS);
> +		if (xattr->value =3D=3D NULL)
>  			return -ENOMEM;
> =20
> -		*len =3D strlen(isp->smk_known);
> +		xattr->value_len =3D strlen(isp->smk_known);
>  	}
> =20
>  	return 0;

