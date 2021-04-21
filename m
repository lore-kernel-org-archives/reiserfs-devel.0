From: Casey Schaufler <casey@schaufler-ca.com>
Subject: Re: [PATCH v2 4/6] security: Support multiple LSMs implementing the
 inode_init_security hook
Date: Wed, 21 Apr 2021 16:09:51 -0700
Message-ID: <e888aa66-25d3-f72c-1aa9-cd5bc6df3789@schaufler-ca.com>
References: <20210421161925.968825-1-roberto.sassu@huawei.com>
 <20210421161925.968825-5-roberto.sassu@huawei.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1619046594; bh=J26x1w023ecUL/6MxhVFKfp+hf3nFHwJodfkAA19G0w=; h=Subject:To:Cc:References:From:Date:In-Reply-To:From:Subject:Reply-To; b=YTJ9PAE/K0UMwdsKfarpJNRp2LIrpfxSra5knvIk0Y6uUvjmJToV55tQOERp5C1fUEw5Qa4nK4IR0U2JFwqFMRwhgJrr+gWMaD2P1jM82tItJiz5BoaS2Cj+8MkMX1zLiQibgXenOa+4j9/YU/Cl8wNMpiXsxqLrrP+2AScjvNXgzu/H3nMVmP6X1oWkIqD67rHQXsLIrZSUQ+6RXQv8zSlFmqUXiNLLkJSEL/R+CTtTZwPRPpQauP2Ix6REBkm4nrzF8/X7aTgJHJBc32XL6EZ7f0/u0kksASm2fb9YC906qFS43Tt6CiLlP65F/yCSAk17sGaPGENnZ1ZU9pVQKg==
In-Reply-To: <20210421161925.968825-5-roberto.sassu@huawei.com>
Content-Language: en-US
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Roberto Sassu <roberto.sassu@huawei.com>, zohar@linux.ibm.com, jmorris@namei.org, paul@paul-moore.com
Cc: linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, selinux@vger.kernel.org, reiserfs-devel@vger.kernel.org, Casey Schaufler <casey@schaufler-ca.com>

On 4/21/2021 9:19 AM, Roberto Sassu wrote:
> The current implementation of security_inode_init_security() is capable=20
of
> handling only one LSM providing an xattr to be set at inode creation. T=
hat
> xattr is then passed to EVM to calculate the HMAC.
>
> To support multiple LSMs, each providing an xattr, this patch makes the=

> following modifications:
>
> security_inode_init_security():
> - dynamically allocates new_xattrs, based on the number of
>   inode_init_security hooks registered by LSMs;
> - replaces the call_int_hook() macro with its definition, to correctly
>   handle the case of an LSM returning -EOPNOTSUPP (the loop should not =
be
>   stopped).
>
> security_old_inode_init_security():
> - replaces the call_int_hook() macro with its definition, to stop the l=
oop
>   at the first LSM providing an xattr, to avoid a memory leak (due to
>   overwriting the *value pointer).
>
> The modifications necessary for EVM to calculate the HMAC on all xattrs=

> will be done in a separate patch.
>
> Signed-off-by: Roberto Sassu <roberto.sassu@huawei.com>
> ---
>  security/security.c | 93 +++++++++++++++++++++++++++++++++++++++------=

>  1 file changed, 82 insertions(+), 11 deletions(-)
>
> diff --git a/security/security.c b/security/security.c
> index 2c1fe1496069..2ab67fa4422e 100644
> --- a/security/security.c
> +++ b/security/security.c
> @@ -30,8 +30,6 @@
>  #include <linux/msg.h>
>  #include <net/flow.h>
> =20
> -#define MAX_LSM_EVM_XATTR	2
> -
>  /* How many LSMs were built into the kernel? */
>  #define LSM_COUNT (__end_lsm_info - __start_lsm_info)
> =20
> @@ -1028,9 +1026,10 @@ int security_inode_init_security(struct inode *i=
node, struct inode *dir,
>  				 const struct qstr *qstr,
>  				 const initxattrs initxattrs, void *fs_data)
>  {
> -	struct xattr new_xattrs[MAX_LSM_EVM_XATTR + 1];
> +	struct xattr *new_xattrs;
>  	struct xattr *lsm_xattr, *evm_xattr, *xattr;
> -	int ret;
> +	struct security_hook_list *P;
> +	int ret, max_new_xattrs =3D 0;
> =20
>  	if (unlikely(IS_PRIVATE(inode)))
>  		return 0;
> @@ -1038,14 +1037,52 @@ int security_inode_init_security(struct inode *=
inode, struct inode *dir,
>  	if (!initxattrs)
>  		return call_int_hook(inode_init_security, -EOPNOTSUPP, inode,
>  				     dir, qstr, NULL, fs_data);
> -	memset(new_xattrs, 0, sizeof(new_xattrs));
> +
> +	/* Determine at run-time the max number of xattr structs to allocate.=20
*/
> +	hlist_for_each_entry(P, &security_hook_heads.inode_init_security, lis=
t)
> +		max_new_xattrs++;

Don't do this here! You can count the number of modules providing inode_i=
nit_security
hooks when the modules register and save the value for use here. It's not=20
going to
change.

> +
> +	if (!max_new_xattrs)
> +		return 0;
> +
> +	/* Allocate +1 for EVM and +1 as terminator. */
> +	new_xattrs =3D kcalloc(max_new_xattrs + 2, sizeof(*new_xattrs), GFP_N=
OFS);
> +	if (!new_xattrs)
> +		return -ENOMEM;
> +
>  	lsm_xattr =3D new_xattrs;
> -	ret =3D call_int_hook(inode_init_security, -EOPNOTSUPP, inode, dir, q=
str,
> -			    lsm_xattr, fs_data);
> -	if (ret)
> +	hlist_for_each_entry(P, &security_hook_heads.inode_init_security,
> +			     list) {
> +		ret =3D P->hook.inode_init_security(inode, dir, qstr, new_xattrs,
> +						  fs_data);
> +		if (ret) {
> +			if (ret !=3D -EOPNOTSUPP)
> +				goto out;
> +
> +			continue;
> +		}
> +
> +		/* LSM implementation error. */
> +		if (lsm_xattr->name =3D=3D NULL || lsm_xattr->value =3D=3D NULL) {
> +			WARN_ONCE(
> +				"LSM %s: ret =3D 0 but xattr name/value =3D NULL\n",
> +				P->lsm);
> +			ret =3D -ENOENT;
> +			goto out;
> +		}
> +
> +		lsm_xattr++;
> +
> +		if (!--max_new_xattrs)
> +			break;
> +	}
> +
> +	if (!new_xattrs->name) {
> +		ret =3D -EOPNOTSUPP;
>  		goto out;
> +	}
> =20
> -	evm_xattr =3D lsm_xattr + 1;
> +	evm_xattr =3D lsm_xattr;
>  	ret =3D evm_inode_init_security(inode, new_xattrs, evm_xattr);

 +	ret =3D evm_inode_init_security(inode, new_xattrs, lsm_xattr);

then you don't need evm_xattr at all.

>  	if (ret)
>  		goto out;
> @@ -1053,6 +1090,7 @@ int security_inode_init_security(struct inode *in=
ode, struct inode *dir,
>  out:
>  	for (xattr =3D new_xattrs; xattr->value !=3D NULL; xattr++)
>  		kfree(xattr->value);
> +	kfree(new_xattrs);
>  	return (ret =3D=3D -EOPNOTSUPP) ? 0 : ret;
>  }
>  EXPORT_SYMBOL(security_inode_init_security);
> @@ -1071,11 +1109,44 @@ int security_old_inode_init_security(struct ino=
de *inode, struct inode *dir,
>  {
>  	struct xattr xattr =3D { .name =3D NULL, .value =3D NULL, .value_len =
=3D 0 };
>  	struct xattr *lsm_xattr =3D (name && value && len) ? &xattr : NULL;
> +	struct security_hook_list *P;
> +	int ret;
> =20
>  	if (unlikely(IS_PRIVATE(inode)))
>  		return -EOPNOTSUPP;
> -	return call_int_hook(inode_init_security, -EOPNOTSUPP, inode, dir,
> -			     qstr, lsm_xattr, NULL);
> +
> +	hlist_for_each_entry(P, &security_hook_heads.inode_init_security,
> +			     list) {
> +		ret =3D P->hook.inode_init_security(inode, dir, qstr, lsm_xattr,
> +						  NULL);
> +		if (ret) {
> +			if (ret !=3D -EOPNOTSUPP)
> +				return ret;
> +
> +			continue;
> +		}
> +
> +		if (!lsm_xattr)
> +			continue;
> +
> +		/* LSM implementation error. */
> +		if (lsm_xattr->name =3D=3D NULL || lsm_xattr->value =3D=3D NULL) {
> +			WARN_ONCE(
> +				"LSM %s: ret =3D 0 but xattr name/value =3D NULL\n",
> +				P->lsm);
> +
> +			/* Callers should do the cleanup. */
> +			return -ENOENT;
> +		}
> +
> +		*name =3D lsm_xattr->name;
> +		*value =3D lsm_xattr->value;
> +		*len =3D lsm_xattr->value_len;
> +
> +		return ret;
> +	}
> +
> +	return -EOPNOTSUPP;
>  }
>  EXPORT_SYMBOL(security_old_inode_init_security);
> =20

