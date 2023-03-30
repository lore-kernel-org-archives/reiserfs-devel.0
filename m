From: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH v9 3/4] evm: Align evm_inode_init_security() definition
 with LSM infrastructure
Date: Thu, 30 Mar 2023 18:55:23 -0400
Message-ID: <CAHC9VhSDVv30ce2652kridRU7iaQQ19tiGubWpyP0mi7pf+JJw@mail.gmail.com>
References: <20230329130415.2312521-1-roberto.sassu@huaweicloud.com> <20230329130415.2312521-4-roberto.sassu@huaweicloud.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1680216934;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hrk4XWP2LlLp6tf/dpvbwPMg4LcYjpdq+wjECDnYpOY=;
        b=FwsKtbaQVIE2GbX31Lf9NND+ddvA43T1+SHp4SqJNBukcc5ImubhkF2Cv4RgnlK/sq
         cGyA5rQcHXRKaAu59Y8iCBTEFtFA7eAb+2+qKf9e0pJIuJFS+iwyaeL4TNsmlUzriAWN
         dlTXsqCHLxlVB583mtV8o40KNZ3SgRF54X5JMpIRlRWCrFQEyAka8tK4gyO8XdpGMMr6
         HQsjEnwDCbDZRpiMD2pZWQui+bkrXP2IACMPKZw7UPsVoctSu/6RWkerj6+qy2JErIvH
         9VksySt2a1hC4E4g8GORfcSHm+oEaq0pNFZDCOrgOv/EvD58JICyEsnJmKO+jzZQK7bT
         bkGA==
In-Reply-To: <20230329130415.2312521-4-roberto.sassu@huaweicloud.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Roberto Sassu <roberto.sassu@huaweicloud.com>
Cc: zohar@linux.ibm.com, dmitry.kasatkin@gmail.com, jmorris@namei.org, serge@hallyn.com, stephen.smalley.work@gmail.com, eparis@parisplace.org, casey@schaufler-ca.com, reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org, linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org, selinux@vger.kernel.org, bpf@vger.kernel.org, kpsingh@kernel.org, keescook@chromium.org, nicolas.bouchinet@clip-os.org, Roberto Sassu <roberto.sassu@huawei.com>

On Wed, Mar 29, 2023 at 9:05=E2=80=AFAM Roberto Sassu
<roberto.sassu@huaweicloud.com> wrote:
>
> From: Roberto Sassu <roberto.sassu@huawei.com>
>
> Change the evm_inode_init_security() definition to align with the LSM
> infrastructure. Keep the existing behavior of including in the HMAC
> calculation only the first xattr provided by LSMs.
>
> Changing the evm_inode_init_security() definition requires passing the
> xattr array allocated by security_inode_init_security(), and the number o=
f
> xattrs filled by previously invoked LSMs.
>
> Use the newly introduced lsm_find_xattr_slot() to position EVM correctly =
in
> the xattrs array, like a regular LSM, and to increment the number of fill=
ed
> slots. For now, the LSM infrastructure allocates enough xattrs slots to
> store the EVM xattr, without using the reservation mechanism.
>
> Finally, make evm_inode_init_security() return value compatible with the
> inode_init_security hook conventions, i.e. return -EOPNOTSUPP if it is no=
t
> setting an xattr.
>
> EVM is a bit tricky, because xattrs is both an input and an output. If it
> was just output, EVM should have returned zero if xattrs is NULL. But,
> since xattrs is also input, EVM is unable to do its calculations, so retu=
rn
> -EOPNOTSUPP and handle this error in security_inode_init_security().

I don't quite understand why EVM would return EOPNOTSUPP if it is
enabled but there are not xattrs to measure.  It seems like EVM should
return success/0 in the no-xattr case; there were no xattrs to
measure, so it succeeded in measuring nothing.  Am I missing
something?

> Signed-off-by: Roberto Sassu <roberto.sassu@huawei.com>
> ---
>  include/linux/evm.h               | 14 ++++++++------
>  security/integrity/evm/evm_main.c | 18 +++++++++++-------
>  security/security.c               |  6 +++---
>  3 files changed, 22 insertions(+), 16 deletions(-)
>
> diff --git a/include/linux/evm.h b/include/linux/evm.h
> index 7dc1ee74169..3c0e8591b69 100644
> --- a/include/linux/evm.h
> +++ b/include/linux/evm.h
> @@ -56,9 +56,10 @@ static inline void evm_inode_post_set_acl(struct dentr=
y *dentry,
>  {
>         return evm_inode_post_setxattr(dentry, acl_name, NULL, 0);
>  }
> -extern int evm_inode_init_security(struct inode *inode,
> -                                  const struct xattr *xattr_array,
> -                                  struct xattr *evm);
> +extern int evm_inode_init_security(struct inode *inode, struct inode *di=
r,
> +                                  const struct qstr *qstr,
> +                                  struct xattr *xattrs,
> +                                  int *num_filled_xattrs);
>  extern bool evm_revalidate_status(const char *xattr_name);
>  extern int evm_protected_xattr_if_enabled(const char *req_xattr_name);
>  extern int evm_read_protected_xattrs(struct dentry *dentry, u8 *buffer,
> @@ -157,9 +158,10 @@ static inline void evm_inode_post_set_acl(struct den=
try *dentry,
>         return;
>  }
>
> -static inline int evm_inode_init_security(struct inode *inode,
> -                                         const struct xattr *xattr_array=
,
> -                                         struct xattr *evm)
> +static inline int evm_inode_init_security(struct inode *inode, struct in=
ode *dir,
> +                                         const struct qstr *qstr,
> +                                         struct xattr *xattrs,
> +                                         int *num_filled_xattrs)
>  {
>         return 0;
>  }
> diff --git a/security/integrity/evm/evm_main.c b/security/integrity/evm/e=
vm_main.c
> index cf24c525558..9e75759150c 100644
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
> @@ -864,23 +865,26 @@ void evm_inode_post_setattr(struct dentry *dentry, =
int ia_valid)
>  /*
>   * evm_inode_init_security - initializes security.evm HMAC value
>   */
> -int evm_inode_init_security(struct inode *inode,
> -                                const struct xattr *lsm_xattr,
> -                                struct xattr *evm_xattr)
> +int evm_inode_init_security(struct inode *inode, struct inode *dir,
> +                           const struct qstr *qstr, struct xattr *xattrs=
,
> +                           int *num_filled_xattrs)
>  {
>         struct evm_xattr *xattr_data;
> +       struct xattr *evm_xattr;
>         int rc;
>
> -       if (!(evm_initialized & EVM_INIT_HMAC) ||
> -           !evm_protected_xattr(lsm_xattr->name))
> -               return 0;
> +       if (!(evm_initialized & EVM_INIT_HMAC) || !xattrs ||
> +           !evm_protected_xattr(xattrs->name))
> +               return -EOPNOTSUPP;
> +
> +       evm_xattr =3D lsm_find_xattr_slot(xattrs, num_filled_xattrs);
>
>         xattr_data =3D kzalloc(sizeof(*xattr_data), GFP_NOFS);
>         if (!xattr_data)
>                 return -ENOMEM;
>
>         xattr_data->data.type =3D EVM_XATTR_HMAC;
> -       rc =3D evm_init_hmac(inode, lsm_xattr, xattr_data->digest);
> +       rc =3D evm_init_hmac(inode, xattrs, xattr_data->digest);
>         if (rc < 0)
>                 goto out;
>
> diff --git a/security/security.c b/security/security.c
> index be33d643a81..22ab4fb7ebf 100644
> --- a/security/security.c
> +++ b/security/security.c
> @@ -1674,9 +1674,9 @@ int security_inode_init_security(struct inode *inod=
e, struct inode *dir,
>         if (!num_filled_xattrs)
>                 goto out;
>
> -       ret =3D evm_inode_init_security(inode, new_xattrs,
> -                                     new_xattrs + num_filled_xattrs);
> -       if (ret)
> +       ret =3D evm_inode_init_security(inode, dir, qstr, new_xattrs,
> +                                     &num_filled_xattrs);
> +       if (ret && ret !=3D -EOPNOTSUPP)
>                 goto out;
>         ret =3D initxattrs(inode, new_xattrs, fs_data);
>  out:
> --
> 2.25.1
>


--=20
paul-moore.com
