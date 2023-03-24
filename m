From: Roberto Sassu <roberto.sassu@huaweicloud.com>
Subject: Re: [PATCH v8 4/6] security: Allow all LSMs to provide xattrs for
 inode_init_security hook
Date: Fri, 24 Mar 2023 11:18:17 +0100
Message-ID: <939e6c88662ad90b963993c4cc1b702083e74a7a.camel@huaweicloud.com>
References: <20230314081720.4158676-1-roberto.sassu@huaweicloud.com>
         <20230314081720.4158676-5-roberto.sassu@huaweicloud.com>
         <CAHC9VhTD3EyDiJs9+NQrgp84JcUs_sx8WONtRk2YYH4m1C8nVw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <CAHC9VhTD3EyDiJs9+NQrgp84JcUs_sx8WONtRk2YYH4m1C8nVw@mail.gmail.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Paul Moore <paul@paul-moore.com>
Cc: mark@fasheh.com, jlbec@evilplan.org, joseph.qi@linux.alibaba.com, zohar@linux.ibm.com, dmitry.kasatkin@gmail.com, jmorris@namei.org, serge@hallyn.com, stephen.smalley.work@gmail.com, eparis@parisplace.org, casey@schaufler-ca.com, ocfs2-devel@oss.oracle.com, reiserfs-devel@vger.kernel.org, linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org, selinux@vger.kernel.org, linux-kernel@vger.kernel.org, keescook@chromium.org, nicolas.bouchinet@clip-os.org, Roberto Sassu <roberto.sassu@huawei.com>

On Thu, 2023-03-23 at 20:09 -0400, Paul Moore wrote:
> On Tue, Mar 14, 2023 at 4:19=E2=80=AFAM Roberto Sassu
> <roberto.sassu@huaweicloud.com> wrote:
> > From: Roberto Sassu <roberto.sassu@huawei.com>
> >=20
> > Currently, security_inode_init_security() supports only one LSM providi=
ng
> > an xattr and EVM calculating the HMAC on that xattr, plus other inode
> > metadata.
> >=20
> > Allow all LSMs to provide one or multiple xattrs, by extending the secu=
rity
> > blob reservation mechanism. Introduce the new lbs_xattr field of the
> > lsm_blob_sizes structure, so that each LSM can specify how many xattrs =
it
> > needs, and the LSM infrastructure knows how many xattr slots it should
> > allocate.
> >=20
> > Dynamically allocate the xattrs array to be populated by LSMs with the
> > inode_init_security hook, and pass it to the latter instead of the
> > name/value/len triple. Update the documentation accordingly, and fix the
> > description of the xattr name, as it is not allocated anymore.
> >=20
> > Since the LSM infrastructure, at initialization time, updates the numbe=
r of
> > the requested xattrs provided by each LSM with a corresponding offset in
> > the security blob (in this case the xattr array), it makes straightforw=
ard
> > for an LSM to access the right position in the xattr array.
> >=20
> > There is still the issue that an LSM might not fill the xattr, even if =
it
> > requests it (legitimate case, for example it might have been loaded but=
 not
> > initialized with a policy). Since users of the xattr array (e.g. the
> > initxattrs() callbacks) detect the end of the xattr array by checking if
> > the xattr name is NULL, not filling an xattr would cause those users to
> > stop scanning xattrs prematurely.
> >=20
> > Solve that issue by introducing security_check_compact_filled_xattrs(),
> > which does a basic check of the xattr array (if the xattr name is fille=
d,
> > the xattr value should be too, and viceversa), and compacts the xattr a=
rray
> > by removing the holes.
> >=20
> > An alternative solution would be to let users of the xattr array know t=
he
> > number of elements of that array, so that they don't have to check the
> > termination. However, this seems more invasive, compared to a simple mo=
ve
> > of few array elements.
> >=20
> > security_check_compact_filled_xattrs() also determines how many xattrs =
in
> > the xattr array have been filled. If there is none, skip
> > evm_inode_init_security() and initxattrs(). Skipping the former also av=
oids
> > EVM to crash the kernel, as it is expecting a filled xattr.
> >=20
> > Finally, adapt both SELinux and Smack to use the new definition of the
> > inode_init_security hook, and to correctly fill the designated slots in=
 the
> > xattr array. For Smack, reserve space for the other defined xattrs alth=
ough
> > they are not set yet in smack_inode_init_security().
> >=20
> > Reported-by: Nicolas Bouchinet <nicolas.bouchinet@clip-os.org> (EVM cra=
sh)
> > Link: https://lore.kernel.org/linux-integrity/Y1FTSIo+1x+4X0LS@archlinu=
x/
> > Signed-off-by: Roberto Sassu <roberto.sassu@huawei.com>
> > Reviewed-by: Casey Schaufler <casey@schaufler-ca.com>
> > Reviewed-by: Mimi Zohar <zohar@linux.ibm.com>
> > ---
> >  include/linux/lsm_hook_defs.h |   3 +-
> >  include/linux/lsm_hooks.h     |   1 +
> >  security/security.c           | 119 +++++++++++++++++++++++++++++-----
> >  security/selinux/hooks.c      |  19 ++++--
> >  security/smack/smack_lsm.c    |  33 ++++++----
> >  5 files changed, 137 insertions(+), 38 deletions(-)
> >=20
> > diff --git a/include/linux/lsm_hook_defs.h b/include/linux/lsm_hook_def=
s.h
> > index 6bb55e61e8e..b814955ae70 100644
> > --- a/include/linux/lsm_hook_defs.h
> > +++ b/include/linux/lsm_hook_defs.h
> > @@ -112,8 +112,7 @@ LSM_HOOK(int, 0, path_notify, const struct path *pa=
th, u64 mask,
> >  LSM_HOOK(int, 0, inode_alloc_security, struct inode *inode)
> >  LSM_HOOK(void, LSM_RET_VOID, inode_free_security, struct inode *inode)
> >  LSM_HOOK(int, 0, inode_init_security, struct inode *inode,
> > -        struct inode *dir, const struct qstr *qstr, const char **name,
> > -        void **value, size_t *len)
> > +        struct inode *dir, const struct qstr *qstr, struct xattr *xatt=
rs)
> >  LSM_HOOK(int, 0, inode_init_security_anon, struct inode *inode,
> >          const struct qstr *name, const struct inode *context_inode)
> >  LSM_HOOK(int, 0, inode_create, struct inode *dir, struct dentry *dentr=
y,
> > diff --git a/include/linux/lsm_hooks.h b/include/linux/lsm_hooks.h
> > index c2be66c669a..75a2f85b49d 100644
> > --- a/include/linux/lsm_hooks.h
> > +++ b/include/linux/lsm_hooks.h
> > @@ -63,6 +63,7 @@ struct lsm_blob_sizes {
> >         int     lbs_ipc;
> >         int     lbs_msg_msg;
> >         int     lbs_task;
> > +       int     lbs_xattr; /* number of xattr slots in new_xattrs array=
 */
>=20
> No need for the comment, we don't do it for the other fields.
>=20
> >  };
> >=20
> >  /*
> > diff --git a/security/security.c b/security/security.c
> > index f4170efcddd..f1f5f62f7fa 100644
> > --- a/security/security.c
> > +++ b/security/security.c
> > @@ -1579,6 +1579,52 @@ int security_dentry_create_files_as(struct dentr=
y *dentry, int mode,
> >  }
> >  EXPORT_SYMBOL(security_dentry_create_files_as);
> >=20
> > +/**
> > + * security_check_compact_filled_xattrs - check xattrs and make array =
contiguous
> > + * @xattrs: xattr array filled by LSMs
> > + * @num_xattrs: length of xattr array
> > + * @num_filled_xattrs: number of already processed xattrs
> > + *
> > + * Ensure that each xattr slot is correctly filled and close the gaps =
in the
> > + * xattr array if an LSM didn't provide an xattr for which it asked sp=
ace
> > + * (legitimate case, it might have been loaded but not initialized). A=
n LSM
> > + * might request space in the xattr array for one or multiple xattrs. =
The LSM
> > + * infrastructure ensures that all requests by LSMs are satisfied.
> > + *
> > + * Track the number of filled xattrs in @num_filled_xattrs, so that it=
 is easy
> > + * to determine whether the currently processed xattr is fine in its p=
osition
> > + * (if all previous xattrs were filled) or it should be moved after th=
e last
> > + * filled xattr.
> > + *
> > + * Return: zero if all xattrs are valid, -EINVAL otherwise.
> > + */
> > +static int security_check_compact_filled_xattrs(struct xattr *xattrs,
> > +                                               int num_xattrs,
> > +                                               int *num_filled_xattrs)
>=20
> That is one long name :)
>=20
> Since you're making some other changes to this patch, can you rename
> this to security_xattr_compact() or something like that?

Yes, definitely!

> > +{
> > +       int i;
> > +
> > +       for (i =3D *num_filled_xattrs; i < num_xattrs; i++) {
> > +               if ((!xattrs[i].name && xattrs[i].value) ||
> > +                   (xattrs[i].name && !xattrs[i].value))
> > +                       return -EINVAL;
> > +
> > +               if (!xattrs[i].name)
> > +                       continue;
> > +
> > +               if (i =3D=3D *num_filled_xattrs) {
> > +                       (*num_filled_xattrs)++;
> > +                       continue;
> > +               }
> > +
> > +               memcpy(xattrs + (*num_filled_xattrs)++, xattrs + i,
> > +                      sizeof(*xattrs));
> > +               memset(xattrs + i, 0, sizeof(*xattrs));
> > +       }
> > +
> > +       return 0;
> > +}
> > +
> >  /**
> >   * security_inode_init_security() - Initialize an inode's LSM context
> >   * @inode: the inode
> > @@ -1591,9 +1637,13 @@ EXPORT_SYMBOL(security_dentry_create_files_as);
> >   * created inode and set up the incore security field for the new inod=
e.  This
> >   * hook is called by the fs code as part of the inode creation transac=
tion and
> >   * provides for atomic labeling of the inode, unlike the post_create/m=
kdir/...
> > - * hooks called by the VFS.  The hook function is expected to allocate=
 the name
> > - * and value via kmalloc, with the caller being responsible for callin=
g kfree
> > - * after using them.  If the security module does not use security att=
ributes
> > + * hooks called by the VFS.  The hook function is expected to populate=
 the
> > + * @xattrs array, depending on how many xattrs have been specified by =
the
> > + * security module in the lbs_xattr field of the lsm_blob_sizes struct=
ure.  For
> > + * each array element, the hook function is expected to set ->name to =
the
> > + * attribute name suffix (e.g. selinux), to allocate ->value (will be =
freed by
> > + * the caller) and set it to the attribute value, to set ->value_len t=
o the
> > + * length of the value.  If the security module does not use security =
attributes
> >   * or does not wish to put a security attribute on this particular ino=
de, then
> >   * it should return -EOPNOTSUPP to skip this processing.
> >   *
> > @@ -1604,33 +1654,66 @@ int security_inode_init_security(struct inode *=
inode, struct inode *dir,
> >                                  const struct qstr *qstr,
> >                                  const initxattrs initxattrs, void *fs_=
data)
> >  {
> > -       struct xattr new_xattrs[MAX_LSM_EVM_XATTR + 1];
> > -       struct xattr *lsm_xattr, *evm_xattr, *xattr;
> > -       int ret;
> > +       struct security_hook_list *P;
> > +       struct xattr *new_xattrs;
> > +       struct xattr *xattr;
> > +       int ret =3D -EOPNOTSUPP, num_filled_xattrs =3D 0;
> >=20
> >         if (unlikely(IS_PRIVATE(inode)))
> >                 return 0;
> >=20
> > +       if (!blob_sizes.lbs_xattr)
> > +               return 0;
> > +
> >         if (!initxattrs)
> >                 return call_int_hook(inode_init_security, -EOPNOTSUPP, =
inode,
> > -                                    dir, qstr, NULL, NULL, NULL);
> > -       memset(new_xattrs, 0, sizeof(new_xattrs));
> > -       lsm_xattr =3D new_xattrs;
> > -       ret =3D call_int_hook(inode_init_security, -EOPNOTSUPP, inode, =
dir, qstr,
> > -                           &lsm_xattr->name,
> > -                           &lsm_xattr->value,
> > -                           &lsm_xattr->value_len);
> > -       if (ret)
> > +                                   dir, qstr, NULL);
> > +       /* Allocate +1 for EVM and +1 as terminator. */
> > +       new_xattrs =3D kcalloc(blob_sizes.lbs_xattr + 2, sizeof(*new_xa=
ttrs),
> > +                            GFP_NOFS);
> > +       if (!new_xattrs)
> > +               return -ENOMEM;
> > +
> > +       hlist_for_each_entry(P, &security_hook_heads.inode_init_securit=
y,
> > +                            list) {
> > +               ret =3D P->hook.inode_init_security(inode, dir, qstr, n=
ew_xattrs);
> > +               if (ret && ret !=3D -EOPNOTSUPP)
> > +                       goto out;
> > +               /*
> > +                * As documented in lsm_hooks.h, -EOPNOTSUPP in this co=
ntext
> > +                * means that the LSM is not willing to provide an xatt=
r, not
> > +                * that it wants to signal an error. Thus, continue to =
invoke
> > +                * the remaining LSMs.
> > +                */
> > +               if (ret =3D=3D -EOPNOTSUPP)
> > +                       continue;
> > +               /*
> > +                * As the number of xattrs reserved by LSMs is not dire=
ctly
> > +                * available, directly use the total number blob_sizes.=
lbs_xattr
> > +                * to keep the code simple, while being not the most ef=
ficient
> > +                * way.
> > +                */
>=20
> Is there a good reason why the LSM can't return the number of xattrs
> it is adding to the xattr array?  It seems like it should be fairly
> trivial for the individual LSMs to determine and it could save a lot
> of work.  However, given we're at v8 on this patchset I'm sure I'm
> missing something obvious, can you help me understand why the idea
> above is crazy stupid? ;)

Ok, I looked back at what I did for v3.

Moving from v3 to v4, I decided to put less burden on LSMs, and to make
all the processing from the LSM infrastructure side.

v3 had some safeguards to prevent some programming mistakes by LSMs,
which maybe made the code less understandable.

However, if we say we keep things as simple as possible and assume that
LSMs implement this correctly, we can just pass num_filled_xattrs to
them and they simply increment it.

The EVM bug should not arise (accessing xattr->name =3D NULL), even if
BPF LSM alone returns zero, due to the check of num_filled_xattrs
before calling evm_inode_init_security().

Patch 6 (at the end) will prevent the bug from arising when EVM is
moved to the LSM infrastructure (no num_filled_xattrs check anymore).
There is a loop that stops if xattr->name is NULL, so
evm_protected_xattr() will not be called.

Or, like you suggested, we just return a positive value from LSMs and
we keep num_filled_xattrs in security_inode_init_security().

Ok, I'll go for your proposal.

> > +               ret =3D security_check_compact_filled_xattrs(new_xattrs,
> > +                                                          blob_sizes.l=
bs_xattr,
> > +                                                          &num_filled_=
xattrs);
> > +               if (ret < 0) {
> > +                       ret =3D -ENOMEM;
> > +                       goto out;
> > +               }
> > +       }
> > +
> > +       if (!num_filled_xattrs)
> >                 goto out;
> >=20
> > -       evm_xattr =3D lsm_xattr + 1;
> > -       ret =3D evm_inode_init_security(inode, lsm_xattr, evm_xattr);
> > +       ret =3D evm_inode_init_security(inode, new_xattrs,
> > +                                     new_xattrs + num_filled_xattrs);
> >         if (ret)
> >                 goto out;
> >         ret =3D initxattrs(inode, new_xattrs, fs_data);
> >  out:
> >         for (xattr =3D new_xattrs; xattr->value !=3D NULL; xattr++)
> >                 kfree(xattr->value);
> > +       kfree(new_xattrs);
> >         return (ret =3D=3D -EOPNOTSUPP) ? 0 : ret;
> >  }
> >  EXPORT_SYMBOL(security_inode_init_security);
> > diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
> > index 9a5bdfc2131..3e4308dd336 100644
> > --- a/security/selinux/hooks.c
> > +++ b/security/selinux/hooks.c
> > @@ -104,6 +104,8 @@
> >  #include "audit.h"
> >  #include "avc_ss.h"
> >=20
> > +#define SELINUX_INODE_INIT_XATTRS 1
> > +
> >  struct selinux_state selinux_state;
> >=20
> >  /* SECMARK reference count */
> > @@ -2868,11 +2870,11 @@ static int selinux_dentry_create_files_as(struc=
t dentry *dentry, int mode,
> >=20
> >  static int selinux_inode_init_security(struct inode *inode, struct ino=
de *dir,
> >                                        const struct qstr *qstr,
> > -                                      const char **name,
> > -                                      void **value, size_t *len)
> > +                                      struct xattr *xattrs)
> >  {
> >         const struct task_security_struct *tsec =3D selinux_cred(curren=
t_cred());
> >         struct superblock_security_struct *sbsec;
> > +       struct xattr *xattr =3D NULL;
> >         u32 newsid, clen;
> >         int rc;
> >         char *context;
> > @@ -2899,16 +2901,18 @@ static int selinux_inode_init_security(struct i=
node *inode, struct inode *dir,
> >             !(sbsec->flags & SBLABEL_MNT))
> >                 return -EOPNOTSUPP;
> >=20
> > -       if (name)
> > -               *name =3D XATTR_SELINUX_SUFFIX;
> > +       if (xattrs)
> > +               xattr =3D xattrs + selinux_blob_sizes.lbs_xattr;
>=20
> Please abstract that away to an inline function similar to
> selinux_cred(), selinux_file(), selinux_inode(), etc.

Ok.

> > +       if (xattr) {
> > +               xattr->name =3D XATTR_SELINUX_SUFFIX;
>=20
> I'm guessing the xattr->name assignment is always done, regardless of
> if security_sid_to_context_force() is successful, due to the -EINVAL
> check in security_check_compact_filled_xattrs()?  If yes, it would be
> good to make note of that here in the code.  If not, it would be nice
> to move this down the function to go with the other xattr->XXX
> assignments, unless there is another reason for its placement that I'm
> missing.

Uhm, if an LSM returns an error, security_inode_init_security() stops
and does the cleanup. It should not matter if xattr->name was set.

Thanks

Roberto

> > -       if (value && len) {
> >                 rc =3D security_sid_to_context_force(&selinux_state, ne=
wsid,
> >                                                    &context, &clen);
> >                 if (rc)
> >                         return rc;
> > -               *value =3D context;
> > -               *len =3D clen;
> > +               xattr->value =3D context;
> > +               xattr->value_len =3D clen;
> >         }
> >=20
> >         return 0;
> > @@ -6918,6 +6922,7 @@ struct lsm_blob_sizes selinux_blob_sizes __lsm_ro=
_after_init =3D {
> >         .lbs_ipc =3D sizeof(struct ipc_security_struct),
> >         .lbs_msg_msg =3D sizeof(struct msg_security_struct),
> >         .lbs_superblock =3D sizeof(struct superblock_security_struct),
> > +       .lbs_xattr =3D SELINUX_INODE_INIT_XATTRS,
> >  };
> >=20
> >  #ifdef CONFIG_PERF_EVENTS
> > diff --git a/security/smack/smack_lsm.c b/security/smack/smack_lsm.c
> > index cfcbb748da2..c8cf8df268b 100644
> > --- a/security/smack/smack_lsm.c
> > +++ b/security/smack/smack_lsm.c
> > @@ -52,6 +52,15 @@
> >  #define SMK_RECEIVING  1
> >  #define SMK_SENDING    2
> >=20
> > +/*
> > + * Smack uses multiple xattrs.
> > + * SMACK64 - for access control, SMACK64EXEC - label for the program,
> > + * SMACK64MMAP - controls library loading,
> > + * SMACK64TRANSMUTE - label initialization,
> > + * Not saved on files - SMACK64IPIN and SMACK64IPOUT
> > + */
> > +#define SMACK_INODE_INIT_XATTRS 4
> > +
> >  #ifdef SMACK_IPV6_PORT_LABELING
> >  static DEFINE_MUTEX(smack_ipv6_lock);
> >  static LIST_HEAD(smk_ipv6_port_list);
> > @@ -939,26 +948,27 @@ static int smack_inode_alloc_security(struct inod=
e *inode)
> >   * @inode: the newly created inode
> >   * @dir: containing directory object
> >   * @qstr: unused
> > - * @name: where to put the attribute name
> > - * @value: where to put the attribute value
> > - * @len: where to put the length of the attribute
> > + * @xattrs: where to put the attributes
> >   *
> >   * Returns 0 if it all works out, -ENOMEM if there's no memory
> >   */
> >  static int smack_inode_init_security(struct inode *inode, struct inode=
 *dir,
> > -                                    const struct qstr *qstr, const cha=
r **name,
> > -                                    void **value, size_t *len)
> > +                                    const struct qstr *qstr,
> > +                                    struct xattr *xattrs)
> >  {
> >         struct inode_smack *issp =3D smack_inode(inode);
> >         struct smack_known *skp =3D smk_of_current();
> >         struct smack_known *isp =3D smk_of_inode(inode);
> >         struct smack_known *dsp =3D smk_of_inode(dir);
> > +       struct xattr *xattr =3D NULL;
> >         int may;
> >=20
> > -       if (name)
> > -               *name =3D XATTR_SMACK_SUFFIX;
> > +       if (xattrs)
> > +               xattr =3D xattrs + smack_blob_sizes.lbs_xattr;
> > +
> > +       if (xattr) {
> > +               xattr->name =3D XATTR_SMACK_SUFFIX;
> >=20
> > -       if (value && len) {
> >                 rcu_read_lock();
> >                 may =3D smk_access_entry(skp->smk_known, dsp->smk_known,
> >                                        &skp->smk_rules);
> > @@ -976,11 +986,11 @@ static int smack_inode_init_security(struct inode=
 *inode, struct inode *dir,
> >                         issp->smk_flags |=3D SMK_INODE_CHANGED;
> >                 }
> >=20
> > -               *value =3D kstrdup(isp->smk_known, GFP_NOFS);
> > -               if (*value =3D=3D NULL)
> > +               xattr->value =3D kstrdup(isp->smk_known, GFP_NOFS);
> > +               if (xattr->value =3D=3D NULL)
> >                         return -ENOMEM;
> >=20
> > -               *len =3D strlen(isp->smk_known);
> > +               xattr->value_len =3D strlen(isp->smk_known);
> >         }
> >=20
> >         return 0;
> > @@ -4854,6 +4864,7 @@ struct lsm_blob_sizes smack_blob_sizes __lsm_ro_a=
fter_init =3D {
> >         .lbs_ipc =3D sizeof(struct smack_known *),
> >         .lbs_msg_msg =3D sizeof(struct smack_known *),
> >         .lbs_superblock =3D sizeof(struct superblock_smack),
> > +       .lbs_xattr =3D SMACK_INODE_INIT_XATTRS,
> >  };
> >=20
> >  static struct security_hook_list smack_hooks[] __lsm_ro_after_init =3D=
 {
> > --
> > 2.25.1

