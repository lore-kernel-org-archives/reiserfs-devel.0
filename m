From: Mimi Zohar <zohar@linux.ibm.com>
Subject: Re: [PATCH v9 3/4] evm: Align evm_inode_init_security() definition
 with LSM infrastructure
Date: Mon, 03 Apr 2023 06:37:48 -0400
Message-ID: <ef1ff552e16eadf5bc8d6219d463b35511103c38.camel@linux.ibm.com>
References: <20230329130415.2312521-1-roberto.sassu@huaweicloud.com>
         <20230329130415.2312521-4-roberto.sassu@huaweicloud.com>
         <CAHC9VhSDVv30ce2652kridRU7iaQQ19tiGubWpyP0mi7pf+JJw@mail.gmail.com>
         <bfe74fff24a5a7a8059acc00c29ac957bf0b7880.camel@huaweicloud.com>
         <ca6d4080b0f234b5321d965fb1350bfcd291646e.camel@huaweicloud.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <bpf-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=CFuKEPFFQM7kQzgTrYjPL4AY7Pi37UZRMecFHRosweE=;
 b=U+Osj3dttd61Gqkleo8NodD0T4dqNYPSeEQx1MUa1nPU+/OtvwYkQz6LRHalAtrN0vBb
 ESZKWdyxWgGyUifAqZIGH74kJid1NxqYHjbNoxJJiJGybzaPyLqUjxxVd6o1vnvz+TR4
 QGJ44mq3lvCpI/qxWhpzmw69mKIw1HcGeVSaXU0Z1LYpnOo/d+RAMgzueyf0QWpzORN7
 hdtusqCqf/tmafHx4x3qsmDpsG1eM13aHhzMYfINO856vZLFQ9G5EM/IIIQnuANtdLO+
 pSS7+Jo6rzdTRnOQe0csEiLkPJXZMSbp+LmOkj0OxxhUDQp6SNfnDG/Gnns8eRYry2Cq fg== 
In-Reply-To: <ca6d4080b0f234b5321d965fb1350bfcd291646e.camel@huaweicloud.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Roberto Sassu <roberto.sassu@huaweicloud.com>, Paul Moore <paul@paul-moore.com>
Cc: dmitry.kasatkin@gmail.com, jmorris@namei.org, serge@hallyn.com, stephen.smalley.work@gmail.com, eparis@parisplace.org, casey@schaufler-ca.com, reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org, linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org, selinux@vger.kernel.org, bpf@vger.kernel.org, kpsingh@kernel.org, keescook@chromium.org, nicolas.bouchinet@clip-os.org, Roberto Sassu <roberto.sassu@huawei.com>

On Fri, 2023-03-31 at 14:18 +0200, Roberto Sassu wrote:
> On Fri, 2023-03-31 at 09:32 +0200, Roberto Sassu wrote:
> > On Thu, 2023-03-30 at 18:55 -0400, Paul Moore wrote:
> > > On Wed, Mar 29, 2023 at 9:05=E2=80=AFAM Roberto Sassu
> > > <roberto.sassu@huaweicloud.com> wrote:
> > > > From: Roberto Sassu <roberto.sassu@huawei.com>
> > > >=20
> > > > Change the evm_inode_init_security() definition to align with the L=
SM
> > > > infrastructure. Keep the existing behavior of including in the HMAC
> > > > calculation only the first xattr provided by LSMs.
> > > >=20
> > > > Changing the evm_inode_init_security() definition requires passing =
the
> > > > xattr array allocated by security_inode_init_security(), and the nu=
mber of
> > > > xattrs filled by previously invoked LSMs.
> > > >=20
> > > > Use the newly introduced lsm_find_xattr_slot() to position EVM corr=
ectly in
> > > > the xattrs array, like a regular LSM, and to increment the number o=
f filled
> > > > slots. For now, the LSM infrastructure allocates enough xattrs slot=
s to
> > > > store the EVM xattr, without using the reservation mechanism.
> > > >=20
> > > > Finally, make evm_inode_init_security() return value compatible wit=
h the
> > > > inode_init_security hook conventions, i.e. return -EOPNOTSUPP if it=
 is not
> > > > setting an xattr.
> > > >=20
> > > > EVM is a bit tricky, because xattrs is both an input and an output.=
 If it
> > > > was just output, EVM should have returned zero if xattrs is NULL. B=
ut,
> > > > since xattrs is also input, EVM is unable to do its calculations, s=
o return
> > > > -EOPNOTSUPP and handle this error in security_inode_init_security().
> > >=20
> > > I don't quite understand why EVM would return EOPNOTSUPP if it is
> > > enabled but there are not xattrs to measure.  It seems like EVM should
> > > return success/0 in the no-xattr case; there were no xattrs to
> > > measure, so it succeeded in measuring nothing.  Am I missing
> > > something?
> >=20
> > From a very quick look at what other LSMs do, it seems that they return
> > zero even if they are not initialized.
> >=20
> > So, it makes sense to return zero also here.
>=20
> Oh, actually there was a reason to do that. If an LSM does not wish to
> provide an xattr, it should return -EOPNOTSUPP.

In general, the original purpose of -EOPNOTSUPP was to indicate that
the filesystem itself did not support security xattrs.  This can be
seen in evm_verify_hmac(), which returns different values (e.g.
INTEGRITY_NOLABEL, INTEGRITY_NOXATTRS, INTEGRITY_UNKNOWN) based on
whether security.evm or any protected security xattrs exist.

>=20
> As we are not checking this convention anymore, it is probably fine to
> return zero. I already made the change, will send the new version
> shortly.

For security xattr initialization, agreed.

Mimi

>=20
> >=20
> > > > Signed-off-by: Roberto Sassu <roberto.sassu@huawei.com>
> > > > ---
> > > >  include/linux/evm.h               | 14 ++++++++------
> > > >  security/integrity/evm/evm_main.c | 18 +++++++++++-------
> > > >  security/security.c               |  6 +++---
> > > >  3 files changed, 22 insertions(+), 16 deletions(-)
> > > >=20
> > > > diff --git a/include/linux/evm.h b/include/linux/evm.h
> > > > index 7dc1ee74169..3c0e8591b69 100644
> > > > --- a/include/linux/evm.h
> > > > +++ b/include/linux/evm.h
> > > > @@ -56,9 +56,10 @@ static inline void evm_inode_post_set_acl(struct=
 dentry *dentry,
> > > >  {
> > > >         return evm_inode_post_setxattr(dentry, acl_name, NULL, 0);
> > > >  }
> > > > -extern int evm_inode_init_security(struct inode *inode,
> > > > -                                  const struct xattr *xattr_array,
> > > > -                                  struct xattr *evm);
> > > > +extern int evm_inode_init_security(struct inode *inode, struct ino=
de *dir,
> > > > +                                  const struct qstr *qstr,
> > > > +                                  struct xattr *xattrs,
> > > > +                                  int *num_filled_xattrs);
> > > >  extern bool evm_revalidate_status(const char *xattr_name);
> > > >  extern int evm_protected_xattr_if_enabled(const char *req_xattr_na=
me);
> > > >  extern int evm_read_protected_xattrs(struct dentry *dentry, u8 *bu=
ffer,
> > > > @@ -157,9 +158,10 @@ static inline void evm_inode_post_set_acl(stru=
ct dentry *dentry,
> > > >         return;
> > > >  }
> > > >=20
> > > > -static inline int evm_inode_init_security(struct inode *inode,
> > > > -                                         const struct xattr *xattr=
_array,
> > > > -                                         struct xattr *evm)
> > > > +static inline int evm_inode_init_security(struct inode *inode, str=
uct inode *dir,
> > > > +                                         const struct qstr *qstr,
> > > > +                                         struct xattr *xattrs,
> > > > +                                         int *num_filled_xattrs)
> > > >  {
> > > >         return 0;
> > > >  }
> > > > diff --git a/security/integrity/evm/evm_main.c b/security/integrity=
/evm/evm_main.c
> > > > index cf24c525558..9e75759150c 100644
> > > > --- a/security/integrity/evm/evm_main.c
> > > > +++ b/security/integrity/evm/evm_main.c
> > > > @@ -21,6 +21,7 @@
> > > >  #include <linux/evm.h>
> > > >  #include <linux/magic.h>
> > > >  #include <linux/posix_acl_xattr.h>
> > > > +#include <linux/lsm_hooks.h>
> > > >=20
> > > >  #include <crypto/hash.h>
> > > >  #include <crypto/hash_info.h>
> > > > @@ -864,23 +865,26 @@ void evm_inode_post_setattr(struct dentry *de=
ntry, int ia_valid)
> > > >  /*
> > > >   * evm_inode_init_security - initializes security.evm HMAC value
> > > >   */
> > > > -int evm_inode_init_security(struct inode *inode,
> > > > -                                const struct xattr *lsm_xattr,
> > > > -                                struct xattr *evm_xattr)
> > > > +int evm_inode_init_security(struct inode *inode, struct inode *dir,
> > > > +                           const struct qstr *qstr, struct xattr *=
xattrs,
> > > > +                           int *num_filled_xattrs)
> > > >  {
> > > >         struct evm_xattr *xattr_data;
> > > > +       struct xattr *evm_xattr;
> > > >         int rc;
> > > >=20
> > > > -       if (!(evm_initialized & EVM_INIT_HMAC) ||
> > > > -           !evm_protected_xattr(lsm_xattr->name))
> > > > -               return 0;
> > > > +       if (!(evm_initialized & EVM_INIT_HMAC) || !xattrs ||
> > > > +           !evm_protected_xattr(xattrs->name))
> > > > +               return -EOPNOTSUPP;
> > > > +
> > > > +       evm_xattr =3D lsm_find_xattr_slot(xattrs, num_filled_xattrs=
);
> > > >=20
> > > >         xattr_data =3D kzalloc(sizeof(*xattr_data), GFP_NOFS);
> > > >         if (!xattr_data)
> > > >                 return -ENOMEM;
> > > >=20
> > > >         xattr_data->data.type =3D EVM_XATTR_HMAC;
> > > > -       rc =3D evm_init_hmac(inode, lsm_xattr, xattr_data->digest);
> > > > +       rc =3D evm_init_hmac(inode, xattrs, xattr_data->digest);
> > > >         if (rc < 0)
> > > >                 goto out;
> > > >=20
> > > > diff --git a/security/security.c b/security/security.c
> > > > index be33d643a81..22ab4fb7ebf 100644
> > > > --- a/security/security.c
> > > > +++ b/security/security.c
> > > > @@ -1674,9 +1674,9 @@ int security_inode_init_security(struct inode=
 *inode, struct inode *dir,
> > > >         if (!num_filled_xattrs)
> > > >                 goto out;
> > > >=20
> > > > -       ret =3D evm_inode_init_security(inode, new_xattrs,
> > > > -                                     new_xattrs + num_filled_xattr=
s);
> > > > -       if (ret)
> > > > +       ret =3D evm_inode_init_security(inode, dir, qstr, new_xattr=
s,
> > > > +                                     &num_filled_xattrs);
> > > > +       if (ret && ret !=3D -EOPNOTSUPP)
> > > >                 goto out;
> > > >         ret =3D initxattrs(inode, new_xattrs, fs_data);
> > > >  out:
> > > > --
> > > > 2.25.1
> > > >=20
>=20


