From: Casey Schaufler <casey@schaufler-ca.com>
Subject: Re: [PATCH v8 4/6] security: Allow all LSMs to provide xattrs for
 inode_init_security hook
Date: Thu, 23 Mar 2023 18:01:03 -0700
Message-ID: <5d8d802a-7664-fdf0-52ef-5817634d870d@schaufler-ca.com>
References: <20230314081720.4158676-1-roberto.sassu@huaweicloud.com>
 <20230314081720.4158676-5-roberto.sassu@huaweicloud.com>
 <CAHC9VhTD3EyDiJs9+NQrgp84JcUs_sx8WONtRk2YYH4m1C8nVw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-security-module-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1679619669; bh=ZYu2w5MeI8D8j7wUcBidvLDkUZbSMqy1HX7/MwP2K+k=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=ArF04r9UO0sWBSHFuBCTSHLiTUpr6baKkhClO64dRh7XgUOK/VJsdVOO5rBBLJdJIpw5K46NrCdmbZxDrylPxlvRHoWa9EWpfBR57TXuYvkE4MAtXGRewlCHBi3JUtZNOOl7L3+BR1wrOzJncenuiZ5wYXGIswNGBypK6deWPwE8V7wFZIM1w+A9+Oba6tf+EMRQFsGbt6D3E7OqE3HtKTIl8eep4SMW4gICAf5LeJzCq4Fzb+aYxK/FsuUwu6ZI/cRB5BiOLqJz21uJe1NsqbSJzDAmD6DOzNHVSDP8IkkPS5oMKwVRIsSrI1S76VGKRCizP7Cb/LykMhars6fbuQ==
Content-Language: en-US
In-Reply-To: <CAHC9VhTD3EyDiJs9+NQrgp84JcUs_sx8WONtRk2YYH4m1C8nVw@mail.gmail.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Paul Moore <paul@paul-moore.com>, Roberto Sassu <roberto.sassu@huaweicloud.com>
Cc: mark@fasheh.com, jlbec@evilplan.org, joseph.qi@linux.alibaba.com, zohar@linux.ibm.com, dmitry.kasatkin@gmail.com, jmorris@namei.org, serge@hallyn.com, stephen.smalley.work@gmail.com, eparis@parisplace.org, ocfs2-devel@oss.oracle.com, reiserfs-devel@vger.kernel.org, linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org, selinux@vger.kernel.org, linux-kernel@vger.kernel.org, keescook@chromium.org, nicolas.bouchinet@clip-os.org, Roberto Sassu <roberto.sassu@huawei.com>, Casey Schaufler <casey@schaufler-ca.com>

On 3/23/2023 5:09 PM, Paul Moore wrote:
> On Tue, Mar 14, 2023 at 4:19=E2=80=AFAM Roberto Sassu
> <roberto.sassu@huaweicloud.com> wrote:
>> From: Roberto Sassu <roberto.sassu@huawei.com>
>>
>> Currently, security_inode_init_security() supports only one LSM providing
>> an xattr and EVM calculating the HMAC on that xattr, plus other inode
>> metadata.
>>
>> Allow all LSMs to provide one or multiple xattrs, by extending the secur=
ity
>> blob reservation mechanism. Introduce the new lbs_xattr field of the
>> lsm_blob_sizes structure, so that each LSM can specify how many xattrs it
>> needs, and the LSM infrastructure knows how many xattr slots it should
>> allocate.
>>
>> Dynamically allocate the xattrs array to be populated by LSMs with the
>> inode_init_security hook, and pass it to the latter instead of the
>> name/value/len triple. Update the documentation accordingly, and fix the
>> description of the xattr name, as it is not allocated anymore.
>>
>> Since the LSM infrastructure, at initialization time, updates the number=
 of
>> the requested xattrs provided by each LSM with a corresponding offset in
>> the security blob (in this case the xattr array), it makes straightforwa=
rd
>> for an LSM to access the right position in the xattr array.
>>
>> There is still the issue that an LSM might not fill the xattr, even if it
>> requests it (legitimate case, for example it might have been loaded but =
not
>> initialized with a policy). Since users of the xattr array (e.g. the
>> initxattrs() callbacks) detect the end of the xattr array by checking if
>> the xattr name is NULL, not filling an xattr would cause those users to
>> stop scanning xattrs prematurely.
>>
>> Solve that issue by introducing security_check_compact_filled_xattrs(),
>> which does a basic check of the xattr array (if the xattr name is filled,
>> the xattr value should be too, and viceversa), and compacts the xattr ar=
ray
>> by removing the holes.
>>
>> An alternative solution would be to let users of the xattr array know the
>> number of elements of that array, so that they don't have to check the
>> termination. However, this seems more invasive, compared to a simple move
>> of few array elements.
>>
>> security_check_compact_filled_xattrs() also determines how many xattrs in
>> the xattr array have been filled. If there is none, skip
>> evm_inode_init_security() and initxattrs(). Skipping the former also avo=
ids
>> EVM to crash the kernel, as it is expecting a filled xattr.
>>
>> Finally, adapt both SELinux and Smack to use the new definition of the
>> inode_init_security hook, and to correctly fill the designated slots in =
the
>> xattr array. For Smack, reserve space for the other defined xattrs altho=
ugh
>> they are not set yet in smack_inode_init_security().
>>
>> Reported-by: Nicolas Bouchinet <nicolas.bouchinet@clip-os.org> (EVM cras=
h)
>> Link: https://lore.kernel.org/linux-integrity/Y1FTSIo+1x+4X0LS@archlinux/
>> Signed-off-by: Roberto Sassu <roberto.sassu@huawei.com>
>> Reviewed-by: Casey Schaufler <casey@schaufler-ca.com>
>> Reviewed-by: Mimi Zohar <zohar@linux.ibm.com>
>> ---
>>  include/linux/lsm_hook_defs.h |   3 +-
>>  include/linux/lsm_hooks.h     |   1 +
>>  security/security.c           | 119 +++++++++++++++++++++++++++++-----
>>  security/selinux/hooks.c      |  19 ++++--
>>  security/smack/smack_lsm.c    |  33 ++++++----
>>  5 files changed, 137 insertions(+), 38 deletions(-)
>>
>> diff --git a/include/linux/lsm_hook_defs.h b/include/linux/lsm_hook_defs=
.h
>> index 6bb55e61e8e..b814955ae70 100644
>> --- a/include/linux/lsm_hook_defs.h
>> +++ b/include/linux/lsm_hook_defs.h
>> @@ -112,8 +112,7 @@ LSM_HOOK(int, 0, path_notify, const struct path *pat=
h, u64 mask,
>>  LSM_HOOK(int, 0, inode_alloc_security, struct inode *inode)
>>  LSM_HOOK(void, LSM_RET_VOID, inode_free_security, struct inode *inode)
>>  LSM_HOOK(int, 0, inode_init_security, struct inode *inode,
>> -        struct inode *dir, const struct qstr *qstr, const char **name,
>> -        void **value, size_t *len)
>> +        struct inode *dir, const struct qstr *qstr, struct xattr *xattr=
s)
>>  LSM_HOOK(int, 0, inode_init_security_anon, struct inode *inode,
>>          const struct qstr *name, const struct inode *context_inode)
>>  LSM_HOOK(int, 0, inode_create, struct inode *dir, struct dentry *dentry,
>> diff --git a/include/linux/lsm_hooks.h b/include/linux/lsm_hooks.h
>> index c2be66c669a..75a2f85b49d 100644
>> --- a/include/linux/lsm_hooks.h
>> +++ b/include/linux/lsm_hooks.h
>> @@ -63,6 +63,7 @@ struct lsm_blob_sizes {
>>         int     lbs_ipc;
>>         int     lbs_msg_msg;
>>         int     lbs_task;
>> +       int     lbs_xattr; /* number of xattr slots in new_xattrs array =
*/
> No need for the comment, we don't do it for the other fields.

I asked for the comment. lbs_xattr is the number of entries, which is
different from the other fields. The other fields contain blob sizes in
bytes. Inconsistent behavior should be noted.

>
>>  };
>>
>>  /*
>> diff --git a/security/security.c b/security/security.c
>> index f4170efcddd..f1f5f62f7fa 100644
>> --- a/security/security.c
>> +++ b/security/security.c
>> @@ -1579,6 +1579,52 @@ int security_dentry_create_files_as(struct dentry=
 *dentry, int mode,
>>  }
>>  EXPORT_SYMBOL(security_dentry_create_files_as);
>>
>> +/**
>> + * security_check_compact_filled_xattrs - check xattrs and make array c=
ontiguous
>> + * @xattrs: xattr array filled by LSMs
>> + * @num_xattrs: length of xattr array
>> + * @num_filled_xattrs: number of already processed xattrs
>> + *
>> + * Ensure that each xattr slot is correctly filled and close the gaps i=
n the
>> + * xattr array if an LSM didn't provide an xattr for which it asked spa=
ce
>> + * (legitimate case, it might have been loaded but not initialized). An=
 LSM
>> + * might request space in the xattr array for one or multiple xattrs. T=
he LSM
>> + * infrastructure ensures that all requests by LSMs are satisfied.
>> + *
>> + * Track the number of filled xattrs in @num_filled_xattrs, so that it =
is easy
>> + * to determine whether the currently processed xattr is fine in its po=
sition
>> + * (if all previous xattrs were filled) or it should be moved after the=
 last
>> + * filled xattr.
>> + *
>> + * Return: zero if all xattrs are valid, -EINVAL otherwise.
>> + */
>> +static int security_check_compact_filled_xattrs(struct xattr *xattrs,
>> +                                               int num_xattrs,
>> +                                               int *num_filled_xattrs)
> That is one long name :)
>
> Since you're making some other changes to this patch, can you rename
> this to security_xattr_compact() or something like that?
>
>> +{
>> +       int i;
>> +
>> +       for (i =3D *num_filled_xattrs; i < num_xattrs; i++) {
>> +               if ((!xattrs[i].name && xattrs[i].value) ||
>> +                   (xattrs[i].name && !xattrs[i].value))
>> +                       return -EINVAL;
>> +
>> +               if (!xattrs[i].name)
>> +                       continue;
>> +
>> +               if (i =3D=3D *num_filled_xattrs) {
>> +                       (*num_filled_xattrs)++;
>> +                       continue;
>> +               }
>> +
>> +               memcpy(xattrs + (*num_filled_xattrs)++, xattrs + i,
>> +                      sizeof(*xattrs));
>> +               memset(xattrs + i, 0, sizeof(*xattrs));
>> +       }
>> +
>> +       return 0;
>> +}
>> +
>>  /**
>>   * security_inode_init_security() - Initialize an inode's LSM context
>>   * @inode: the inode
>> @@ -1591,9 +1637,13 @@ EXPORT_SYMBOL(security_dentry_create_files_as);
>>   * created inode and set up the incore security field for the new inode=
.  This
>>   * hook is called by the fs code as part of the inode creation transact=
ion and
>>   * provides for atomic labeling of the inode, unlike the post_create/mk=
dir/...
>> - * hooks called by the VFS.  The hook function is expected to allocate =
the name
>> - * and value via kmalloc, with the caller being responsible for calling=
 kfree
>> - * after using them.  If the security module does not use security attr=
ibutes
>> + * hooks called by the VFS.  The hook function is expected to populate =
the
>> + * @xattrs array, depending on how many xattrs have been specified by t=
he
>> + * security module in the lbs_xattr field of the lsm_blob_sizes structu=
re.  For
>> + * each array element, the hook function is expected to set ->name to t=
he
>> + * attribute name suffix (e.g. selinux), to allocate ->value (will be f=
reed by
>> + * the caller) and set it to the attribute value, to set ->value_len to=
 the
>> + * length of the value.  If the security module does not use security a=
ttributes
>>   * or does not wish to put a security attribute on this particular inod=
e, then
>>   * it should return -EOPNOTSUPP to skip this processing.
>>   *
>> @@ -1604,33 +1654,66 @@ int security_inode_init_security(struct inode *i=
node, struct inode *dir,
>>                                  const struct qstr *qstr,
>>                                  const initxattrs initxattrs, void *fs_d=
ata)
>>  {
>> -       struct xattr new_xattrs[MAX_LSM_EVM_XATTR + 1];
>> -       struct xattr *lsm_xattr, *evm_xattr, *xattr;
>> -       int ret;
>> +       struct security_hook_list *P;
>> +       struct xattr *new_xattrs;
>> +       struct xattr *xattr;
>> +       int ret =3D -EOPNOTSUPP, num_filled_xattrs =3D 0;
>>
>>         if (unlikely(IS_PRIVATE(inode)))
>>                 return 0;
>>
>> +       if (!blob_sizes.lbs_xattr)
>> +               return 0;
>> +
>>         if (!initxattrs)
>>                 return call_int_hook(inode_init_security, -EOPNOTSUPP, i=
node,
>> -                                    dir, qstr, NULL, NULL, NULL);
>> -       memset(new_xattrs, 0, sizeof(new_xattrs));
>> -       lsm_xattr =3D new_xattrs;
>> -       ret =3D call_int_hook(inode_init_security, -EOPNOTSUPP, inode, d=
ir, qstr,
>> -                           &lsm_xattr->name,
>> -                           &lsm_xattr->value,
>> -                           &lsm_xattr->value_len);
>> -       if (ret)
>> +                                   dir, qstr, NULL);
>> +       /* Allocate +1 for EVM and +1 as terminator. */
>> +       new_xattrs =3D kcalloc(blob_sizes.lbs_xattr + 2, sizeof(*new_xat=
trs),
>> +                            GFP_NOFS);
>> +       if (!new_xattrs)
>> +               return -ENOMEM;
>> +
>> +       hlist_for_each_entry(P, &security_hook_heads.inode_init_security,
>> +                            list) {
>> +               ret =3D P->hook.inode_init_security(inode, dir, qstr, ne=
w_xattrs);
>> +               if (ret && ret !=3D -EOPNOTSUPP)
>> +                       goto out;
>> +               /*
>> +                * As documented in lsm_hooks.h, -EOPNOTSUPP in this con=
text
>> +                * means that the LSM is not willing to provide an xattr=
, not
>> +                * that it wants to signal an error. Thus, continue to i=
nvoke
>> +                * the remaining LSMs.
>> +                */
>> +               if (ret =3D=3D -EOPNOTSUPP)
>> +                       continue;
>> +               /*
>> +                * As the number of xattrs reserved by LSMs is not direc=
tly
>> +                * available, directly use the total number blob_sizes.l=
bs_xattr
>> +                * to keep the code simple, while being not the most eff=
icient
>> +                * way.
>> +                */
> Is there a good reason why the LSM can't return the number of xattrs
> it is adding to the xattr array?  It seems like it should be fairly
> trivial for the individual LSMs to determine and it could save a lot
> of work.  However, given we're at v8 on this patchset I'm sure I'm
> missing something obvious, can you help me understand why the idea
> above is crazy stupid? ;)
>
>> +               ret =3D security_check_compact_filled_xattrs(new_xattrs,
>> +                                                          blob_sizes.lb=
s_xattr,
>> +                                                          &num_filled_x=
attrs);
>> +               if (ret < 0) {
>> +                       ret =3D -ENOMEM;
>> +                       goto out;
>> +               }
>> +       }
>> +
>> +       if (!num_filled_xattrs)
>>                 goto out;
>>
>> -       evm_xattr =3D lsm_xattr + 1;
>> -       ret =3D evm_inode_init_security(inode, lsm_xattr, evm_xattr);
>> +       ret =3D evm_inode_init_security(inode, new_xattrs,
>> +                                     new_xattrs + num_filled_xattrs);
>>         if (ret)
>>                 goto out;
>>         ret =3D initxattrs(inode, new_xattrs, fs_data);
>>  out:
>>         for (xattr =3D new_xattrs; xattr->value !=3D NULL; xattr++)
>>                 kfree(xattr->value);
>> +       kfree(new_xattrs);
>>         return (ret =3D=3D -EOPNOTSUPP) ? 0 : ret;
>>  }
>>  EXPORT_SYMBOL(security_inode_init_security);
>> diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
>> index 9a5bdfc2131..3e4308dd336 100644
>> --- a/security/selinux/hooks.c
>> +++ b/security/selinux/hooks.c
>> @@ -104,6 +104,8 @@
>>  #include "audit.h"
>>  #include "avc_ss.h"
>>
>> +#define SELINUX_INODE_INIT_XATTRS 1
>> +
>>  struct selinux_state selinux_state;
>>
>>  /* SECMARK reference count */
>> @@ -2868,11 +2870,11 @@ static int selinux_dentry_create_files_as(struct=
 dentry *dentry, int mode,
>>
>>  static int selinux_inode_init_security(struct inode *inode, struct inod=
e *dir,
>>                                        const struct qstr *qstr,
>> -                                      const char **name,
>> -                                      void **value, size_t *len)
>> +                                      struct xattr *xattrs)
>>  {
>>         const struct task_security_struct *tsec =3D selinux_cred(current=
_cred());
>>         struct superblock_security_struct *sbsec;
>> +       struct xattr *xattr =3D NULL;
>>         u32 newsid, clen;
>>         int rc;
>>         char *context;
>> @@ -2899,16 +2901,18 @@ static int selinux_inode_init_security(struct in=
ode *inode, struct inode *dir,
>>             !(sbsec->flags & SBLABEL_MNT))
>>                 return -EOPNOTSUPP;
>>
>> -       if (name)
>> -               *name =3D XATTR_SELINUX_SUFFIX;
>> +       if (xattrs)
>> +               xattr =3D xattrs + selinux_blob_sizes.lbs_xattr;
> Please abstract that away to an inline function similar to
> selinux_cred(), selinux_file(), selinux_inode(), etc.
>
>> +       if (xattr) {
>> +               xattr->name =3D XATTR_SELINUX_SUFFIX;
> I'm guessing the xattr->name assignment is always done, regardless of
> if security_sid_to_context_force() is successful, due to the -EINVAL
> check in security_check_compact_filled_xattrs()?  If yes, it would be
> good to make note of that here in the code.  If not, it would be nice
> to move this down the function to go with the other xattr->XXX
> assignments, unless there is another reason for its placement that I'm
> missing.
>
>> -       if (value && len) {
>>                 rc =3D security_sid_to_context_force(&selinux_state, new=
sid,
>>                                                    &context, &clen);
>>                 if (rc)
>>                         return rc;
>> -               *value =3D context;
>> -               *len =3D clen;
>> +               xattr->value =3D context;
>> +               xattr->value_len =3D clen;
>>         }
>>
>>         return 0;
>> @@ -6918,6 +6922,7 @@ struct lsm_blob_sizes selinux_blob_sizes __lsm_ro_=
after_init =3D {
>>         .lbs_ipc =3D sizeof(struct ipc_security_struct),
>>         .lbs_msg_msg =3D sizeof(struct msg_security_struct),
>>         .lbs_superblock =3D sizeof(struct superblock_security_struct),
>> +       .lbs_xattr =3D SELINUX_INODE_INIT_XATTRS,
>>  };
>>
>>  #ifdef CONFIG_PERF_EVENTS
>> diff --git a/security/smack/smack_lsm.c b/security/smack/smack_lsm.c
>> index cfcbb748da2..c8cf8df268b 100644
>> --- a/security/smack/smack_lsm.c
>> +++ b/security/smack/smack_lsm.c
>> @@ -52,6 +52,15 @@
>>  #define SMK_RECEIVING  1
>>  #define SMK_SENDING    2
>>
>> +/*
>> + * Smack uses multiple xattrs.
>> + * SMACK64 - for access control, SMACK64EXEC - label for the program,
>> + * SMACK64MMAP - controls library loading,
>> + * SMACK64TRANSMUTE - label initialization,
>> + * Not saved on files - SMACK64IPIN and SMACK64IPOUT
>> + */
>> +#define SMACK_INODE_INIT_XATTRS 4
>> +
>>  #ifdef SMACK_IPV6_PORT_LABELING
>>  static DEFINE_MUTEX(smack_ipv6_lock);
>>  static LIST_HEAD(smk_ipv6_port_list);
>> @@ -939,26 +948,27 @@ static int smack_inode_alloc_security(struct inode=
 *inode)
>>   * @inode: the newly created inode
>>   * @dir: containing directory object
>>   * @qstr: unused
>> - * @name: where to put the attribute name
>> - * @value: where to put the attribute value
>> - * @len: where to put the length of the attribute
>> + * @xattrs: where to put the attributes
>>   *
>>   * Returns 0 if it all works out, -ENOMEM if there's no memory
>>   */
>>  static int smack_inode_init_security(struct inode *inode, struct inode =
*dir,
>> -                                    const struct qstr *qstr, const char=
 **name,
>> -                                    void **value, size_t *len)
>> +                                    const struct qstr *qstr,
>> +                                    struct xattr *xattrs)
>>  {
>>         struct inode_smack *issp =3D smack_inode(inode);
>>         struct smack_known *skp =3D smk_of_current();
>>         struct smack_known *isp =3D smk_of_inode(inode);
>>         struct smack_known *dsp =3D smk_of_inode(dir);
>> +       struct xattr *xattr =3D NULL;
>>         int may;
>>
>> -       if (name)
>> -               *name =3D XATTR_SMACK_SUFFIX;
>> +       if (xattrs)
>> +               xattr =3D xattrs + smack_blob_sizes.lbs_xattr;
>> +
>> +       if (xattr) {
>> +               xattr->name =3D XATTR_SMACK_SUFFIX;
>>
>> -       if (value && len) {
>>                 rcu_read_lock();
>>                 may =3D smk_access_entry(skp->smk_known, dsp->smk_known,
>>                                        &skp->smk_rules);
>> @@ -976,11 +986,11 @@ static int smack_inode_init_security(struct inode =
*inode, struct inode *dir,
>>                         issp->smk_flags |=3D SMK_INODE_CHANGED;
>>                 }
>>
>> -               *value =3D kstrdup(isp->smk_known, GFP_NOFS);
>> -               if (*value =3D=3D NULL)
>> +               xattr->value =3D kstrdup(isp->smk_known, GFP_NOFS);
>> +               if (xattr->value =3D=3D NULL)
>>                         return -ENOMEM;
>>
>> -               *len =3D strlen(isp->smk_known);
>> +               xattr->value_len =3D strlen(isp->smk_known);
>>         }
>>
>>         return 0;
>> @@ -4854,6 +4864,7 @@ struct lsm_blob_sizes smack_blob_sizes __lsm_ro_af=
ter_init =3D {
>>         .lbs_ipc =3D sizeof(struct smack_known *),
>>         .lbs_msg_msg =3D sizeof(struct smack_known *),
>>         .lbs_superblock =3D sizeof(struct superblock_smack),
>> +       .lbs_xattr =3D SMACK_INODE_INIT_XATTRS,
>>  };
>>
>>  static struct security_hook_list smack_hooks[] __lsm_ro_after_init =3D {
>> --
>> 2.25.1
