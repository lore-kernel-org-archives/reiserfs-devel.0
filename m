From: Casey Schaufler <casey@schaufler-ca.com>
Subject: Re: [PATCH v9 2/4] security: Allow all LSMs to provide xattrs for
 inode_init_security hook
Date: Thu, 30 Mar 2023 16:05:47 -0700
Message-ID: <7100a49a-49db-6e78-2b37-26193c82354b@schaufler-ca.com>
References: <20230329130415.2312521-1-roberto.sassu@huaweicloud.com>
 <20230329130415.2312521-3-roberto.sassu@huaweicloud.com>
 <CAHC9VhTTcejig61X1Qf_rXWzjyz8HNLNg=KqExRqDH7+McChkw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-security-module-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1680217555; bh=JMS446UlVeOxPRi+0JzdYg22Z71t5DNNBvdM9U11yIQ=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=aEY3OJwzNdcibfvrrSznjmfhQIR9TJ7h+ifteIJlzSOQCRZSItIT+hu4TsDqQRXC2sv3EttJOwGLWyx99Rb7F8+NbmDlxZh/a4EXLQXLBAk48F0OtUeImKEhasWkU5BVJpk+jMlSUARZfwjF4YI/rrupJJ+tktNJp9pfUgdm54SEdvHWPU8prIqKyfecHPdfhC4qurJ8+CAoaeBTLXBA5piUW9dQQZap6zvutzb3RnjyoZdtU91tftCDJu2VMTJYRlgPedRwtHX9byQn6zbeXds0LMhuXr039Zl6hpD191mNHMTGfZARY/0dyQCi2LZTNnlrPuuSKZto/gR2MVzDjA==
Content-Language: en-US
In-Reply-To: <CAHC9VhTTcejig61X1Qf_rXWzjyz8HNLNg=KqExRqDH7+McChkw@mail.gmail.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Paul Moore <paul@paul-moore.com>, Roberto Sassu <roberto.sassu@huaweicloud.com>
Cc: zohar@linux.ibm.com, dmitry.kasatkin@gmail.com, jmorris@namei.org, serge@hallyn.com, stephen.smalley.work@gmail.com, eparis@parisplace.org, reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org, linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org, selinux@vger.kernel.org, bpf@vger.kernel.org, kpsingh@kernel.org, keescook@chromium.org, nicolas.bouchinet@clip-os.org, Roberto Sassu <roberto.sassu@huawei.com>, Casey Schaufler <casey@schaufler-ca.com>

On 3/30/2023 3:50 PM, Paul Moore wrote:
> On Wed, Mar 29, 2023 at 9:05=E2=80=AFAM Roberto Sassu
> <roberto.sassu@huaweicloud.com> wrote:
>> From: Roberto Sassu <roberto.sassu@huawei.com>
>>
>> Currently, security_inode_init_security() supports only one LSM providing
>> an xattr and EVM calculating the HMAC on that xattr, plus other inode
>> metadata.
>>
>> Allow all LSMs to provide one or multiple xattrs, by extending the secur=
ity
>> blob reservation mechanism. Introduce the new lbs_xattr_count field of t=
he
>> lsm_blob_sizes structure, so that each LSM can specify how many xattrs it
>> needs, and the LSM infrastructure knows how many xattr slots it should
>> allocate.
>>
>> Dynamically allocate the new_xattrs array to be populated by LSMs with t=
he
>> inode_init_security hook, and pass it to the latter instead of the
>> name/value/len triple.
>>
>> Also, pass to the hook the number of xattrs filled by each LSM, so that
>> there are no gaps when the next LSM fills the array. Gaps might occur
>> because an LSM can legitimately request xattrs to the LSM infrastructure,
>> but not fill the reserved slots, if it was not initialized.
>>
>> Update the documentation of security_inode_init_security() to reflect the
>> changes, and fix the description of the xattr name, as it is not allocat=
ed
>> anymore.
>>
>> On the security_inode_init_security() side, ensure that if LSMs returned
>> zero from the hook, they correctly filled a new_xattrs slot. Consequentl=
y,
>> change the default return value of the hook to -EOPNOTSUPP, so that BPF =
LSM
>> returns that, and does not cause security_inode_init_security() to fail.
>>
>> Finally, adapt both SELinux and Smack to use the new definition of the
>> inode_init_security hook, and to fill the reserved slots in the xattr
>> array. Introduce the lsm_find_xattr_slot() helper to retrieve an availab=
le
>> slot to fill, and to increment the number of filled slots.
>>
>> Move the xattr->name assignment after the xattr->value one, so that it is
>> done only in case of successful memory allocation. For Smack, also reser=
ve
>> space for the other defined xattrs although they are not set yet in
>> smack_inode_init_security().
>>
>> Reported-by: Nicolas Bouchinet <nicolas.bouchinet@clip-os.org> (EVM cras=
h)
>> Link: https://lore.kernel.org/linux-integrity/Y1FTSIo+1x+4X0LS@archlinux/
>> Signed-off-by: Roberto Sassu <roberto.sassu@huawei.com>
>> ---
>>  include/linux/lsm_hook_defs.h |  6 +--
>>  include/linux/lsm_hooks.h     | 14 ++++++
>>  security/security.c           | 92 +++++++++++++++++++++++++++--------
>>  security/selinux/hooks.c      | 18 ++++---
>>  security/smack/smack_lsm.c    | 33 ++++++++-----
>>  5 files changed, 120 insertions(+), 43 deletions(-)
>>
>> diff --git a/include/linux/lsm_hook_defs.h b/include/linux/lsm_hook_defs=
.h
>> index 6bb55e61e8e..1fd95db0087 100644
>> --- a/include/linux/lsm_hook_defs.h
>> +++ b/include/linux/lsm_hook_defs.h
>> @@ -111,9 +111,9 @@ LSM_HOOK(int, 0, path_notify, const struct path *pat=
h, u64 mask,
>>          unsigned int obj_type)
>>  LSM_HOOK(int, 0, inode_alloc_security, struct inode *inode)
>>  LSM_HOOK(void, LSM_RET_VOID, inode_free_security, struct inode *inode)
>> -LSM_HOOK(int, 0, inode_init_security, struct inode *inode,
>> -        struct inode *dir, const struct qstr *qstr, const char **name,
>> -        void **value, size_t *len)
>> +LSM_HOOK(int, -EOPNOTSUPP, inode_init_security, struct inode *inode,
>> +        struct inode *dir, const struct qstr *qstr, struct xattr *xattr=
s,
>> +        int *num_filled_xattrs)
>>  LSM_HOOK(int, 0, inode_init_security_anon, struct inode *inode,
>>          const struct qstr *name, const struct inode *context_inode)
>>  LSM_HOOK(int, 0, inode_create, struct inode *dir, struct dentry *dentry,
>> diff --git a/include/linux/lsm_hooks.h b/include/linux/lsm_hooks.h
>> index c2be66c669a..b60de5f2f34 100644
>> --- a/include/linux/lsm_hooks.h
>> +++ b/include/linux/lsm_hooks.h
>> @@ -28,6 +28,7 @@
>>  #include <linux/security.h>
>>  #include <linux/init.h>
>>  #include <linux/rculist.h>
>> +#include <linux/xattr.h>
>>
>>  union security_list_options {
>>         #define LSM_HOOK(RET, DEFAULT, NAME, ...) RET (*NAME)(__VA_ARGS_=
_);
>> @@ -63,8 +64,21 @@ struct lsm_blob_sizes {
>>         int     lbs_ipc;
>>         int     lbs_msg_msg;
>>         int     lbs_task;
>> +       int     lbs_xattr_count; /* number of xattr slots in new_xattrs =
array */
>>  };
>>
>> +/*
>> + * Retrieve the first available slot to fill with an xattr, and increme=
nt
>> + * the number of filled slots.
>> + */
>> +static inline struct xattr *lsm_find_xattr_slot(struct xattr *xattrs,
>> +                                               int *num_filled_xattrs)
>> +{
>> +       if (unlikely(!xattrs))
>> +               return NULL;
>> +       return xattrs + (*num_filled_xattrs)++;
>> +}
> Since this function increments the @num_filled_xattrs parameter in
> addition to returning the next available xattr array slot, let's
> replace the "find" with "get" so there is some hint that the state is
> changing, i.e. the count is being bumped (similar to the "get" and
> "put" concept).
>
> It would also be nice if you could use the kdoc style for the function
> comment block; if nothing else it is a known format and consistent
> documentation is good, even if it never makes it out of the source
> file.
>
>>  /*
>>   * LSM_RET_VOID is used as the default value in LSM_HOOK definitions fo=
r void
>>   * LSM hooks (in include/linux/lsm_hook_defs.h).
>> diff --git a/security/security.c b/security/security.c
>> index f4170efcddd..be33d643a81 100644
>> --- a/security/security.c
>> +++ b/security/security.c
>> @@ -31,8 +31,6 @@
>>  #include <linux/msg.h>
>>  #include <net/flow.h>
>>
>> -#define MAX_LSM_EVM_XATTR      2
>> -
>>  /* How many LSMs were built into the kernel? */
>>  #define LSM_COUNT (__end_lsm_info - __start_lsm_info)
>>
>> @@ -212,6 +210,8 @@ static void __init lsm_set_blob_sizes(struct lsm_blo=
b_sizes *needed)
>>         lsm_set_blob_size(&needed->lbs_msg_msg, &blob_sizes.lbs_msg_msg);
>>         lsm_set_blob_size(&needed->lbs_superblock, &blob_sizes.lbs_super=
block);
>>         lsm_set_blob_size(&needed->lbs_task, &blob_sizes.lbs_task);
>> +       lsm_set_blob_size(&needed->lbs_xattr_count,
>> +                         &blob_sizes.lbs_xattr_count);
>>  }
>>
>>  /* Prepare LSM for initialization. */
>> @@ -378,6 +378,7 @@ static void __init ordered_lsm_init(void)
>>         init_debug("msg_msg blob size    =3D %d\n", blob_sizes.lbs_msg_m=
sg);
>>         init_debug("superblock blob size =3D %d\n", blob_sizes.lbs_super=
block);
>>         init_debug("task blob size       =3D %d\n", blob_sizes.lbs_task);
>> +       init_debug("xattr slots          =3D %d\n", blob_sizes.lbs_xattr=
_count);
>>
>>         /*
>>          * Create any kmem_caches needed for blobs
>> @@ -1591,11 +1592,15 @@ EXPORT_SYMBOL(security_dentry_create_files_as);
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
>> - * or does not wish to put a security attribute on this particular inod=
e, then
>> - * it should return -EOPNOTSUPP to skip this processing.
>> + * hooks called by the VFS.  The hook function is expected to populate =
the
>> + * @xattrs array, by calling lsm_find_xattr_slot() to retrieve the slots
>> + * reserved by the security module with the lbs_xattr_count field of the
>> + * lsm_blob_sizes structure.  For each slot, the hook function should s=
et ->name
>> + * to the attribute name suffix (e.g. selinux), to allocate ->value (wi=
ll be
>> + * freed by the caller) and set it to the attribute value, to set ->val=
ue_len to
>> + * the length of the value.  If the security module does not use securi=
ty
>> + * attributes or does not wish to put a security attribute on this part=
icular
>> + * inode, then it should return -EOPNOTSUPP to skip this processing.
>>   *
>>   * Return: Returns 0 on success, -EOPNOTSUPP if no security attribute is
>>   * needed, or -ENOMEM on memory allocation failure.
>> @@ -1604,33 +1609,80 @@ int security_inode_init_security(struct inode *i=
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
>> +       int num_filled_xattrs =3D 0, old_num_filled_xattrs;
> I think you can get rid of @old_num_filled_xattrs (see below), but how
> about changing @num_filled_xattrs to @xattr_count, it's shorter and
> just as accurate.
>
>> +       int ret =3D -EOPNOTSUPP, i;
>>
>>         if (unlikely(IS_PRIVATE(inode)))
>>                 return 0;
>>
>> +       if (!blob_sizes.lbs_xattr_count)
>> +               return 0;
>> +
>>         if (!initxattrs)
>>                 return call_int_hook(inode_init_security, -EOPNOTSUPP, i=
node,
>> -                                    dir, qstr, NULL, NULL, NULL);
> I would have expected the !initxattrs case to still be handled in the
> hook loop below, is there a reason why we don't want to do that?  If
> including it in the loop below is too much of a hassle (conditional
> array allocation, etc.), should we at least put it in it's own loop?
> It seems wrong that we wouldn't run through all of the LSM hooks in
> this case ...
>
>> -       memset(new_xattrs, 0, sizeof(new_xattrs));
>> -       lsm_xattr =3D new_xattrs;
>> -       ret =3D call_int_hook(inode_init_security, -EOPNOTSUPP, inode, d=
ir, qstr,
>> -                           &lsm_xattr->name,
>> -                           &lsm_xattr->value,
>> -                           &lsm_xattr->value_len);
>> -       if (ret)
>> +                                   dir, qstr, NULL, NULL);
>> +       /* Allocate +1 for EVM and +1 as terminator. */
>> +       new_xattrs =3D kcalloc(blob_sizes.lbs_xattr_count + 2,
>> +                            sizeof(*new_xattrs), GFP_NOFS);
>> +       if (!new_xattrs)
>> +               return -ENOMEM;
>> +
>> +       hlist_for_each_entry(P, &security_hook_heads.inode_init_security,
>> +                            list) {
>> +               old_num_filled_xattrs =3D num_filled_xattrs;
>> +
>> +               ret =3D P->hook.inode_init_security(inode, dir, qstr, ne=
w_xattrs,
>> +                                                 &num_filled_xattrs);
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
>> +
>> +               /* LSM should fill new_xattrs if it returns zero. */
>> +               if (old_num_filled_xattrs =3D=3D num_filled_xattrs) {
>> +                       WARN_ONCE(1, "LSM %s: returned zero but didn't f=
ill any slot\n",
>> +                                 P->lsm);
>> +                       ret =3D -EINVAL;
>> +                       goto out;
>> +               }
> Do we really need this check?  We don't currently check that LSMs
> setup their xattrs properly and we are doing okay.
>
>> +               /*
>> +                * For filled xattr slots, name and value must be non-NU=
LL.
>> +                *
>> +                * NULL value is interpreted by filesystems as a remove =
op, see
>> +                * ext4_xattr_set_handle() for more details.
>> +                */
>> +               for (i =3D old_num_filled_xattrs; i < num_filled_xattrs;=
 i++) {
>> +                       if (!new_xattrs[i].name || !new_xattrs[i].value)=
 {
>> +                               WARN_ONCE(1, "LSM %s: NULL xattr name an=
d/or value\n",
>> +                                         P->lsm);
>> +                               ret =3D -EINVAL;
>> +                               goto out;
>> +                       }
>> +               }
> Same here.  I worry this is extra processing with little benefit.  The
> LSM updates the xattr count and we should trust it is correct.
>
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
> We can probably drop the need for the @xattr variable by using @xattr_cou=
nt.
>
>   for (; xattr_count > 0; xattr_count--)
>     kfree(new_xattrs[xattr_count - 1]->value);
>
>> +       kfree(new_xattrs);
>>         return (ret =3D=3D -EOPNOTSUPP) ? 0 : ret;
>>  }
>>  EXPORT_SYMBOL(security_inode_init_security);
>> diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
>> index 9a5bdfc2131..dc349cf34e8 100644
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
>> @@ -2868,11 +2870,12 @@ static int selinux_dentry_create_files_as(struct=
 dentry *dentry, int mode,
>>
>>  static int selinux_inode_init_security(struct inode *inode, struct inod=
e *dir,
>>                                        const struct qstr *qstr,
>> -                                      const char **name,
>> -                                      void **value, size_t *len)
>> +                                      struct xattr *xattrs,
>> +                                      int *num_filled_xattrs)
> Use 'xattr_count'.
>
>>  {
>>         const struct task_security_struct *tsec =3D selinux_cred(current=
_cred());
>>         struct superblock_security_struct *sbsec;
>> +       struct xattr *xattr =3D lsm_find_xattr_slot(xattrs, num_filled_x=
attrs);
>>         u32 newsid, clen;
>>         int rc;
>>         char *context;
>> @@ -2899,16 +2902,14 @@ static int selinux_inode_init_security(struct in=
ode *inode, struct inode *dir,
>>             !(sbsec->flags & SBLABEL_MNT))
>>                 return -EOPNOTSUPP;
>>
>> -       if (name)
>> -               *name =3D XATTR_SELINUX_SUFFIX;
>> -
>> -       if (value && len) {
>> +       if (xattr) {
>>                 rc =3D security_sid_to_context_force(&selinux_state, new=
sid,
>>                                                    &context, &clen);
>>                 if (rc)
>>                         return rc;
>> -               *value =3D context;
>> -               *len =3D clen;
>> +               xattr->value =3D context;
>> +               xattr->value_len =3D clen;
>> +               xattr->name =3D XATTR_SELINUX_SUFFIX;
>>         }
>>
>>         return 0;
>> @@ -6918,6 +6919,7 @@ struct lsm_blob_sizes selinux_blob_sizes __lsm_ro_=
after_init =3D {
>>         .lbs_ipc =3D sizeof(struct ipc_security_struct),
>>         .lbs_msg_msg =3D sizeof(struct msg_security_struct),
>>         .lbs_superblock =3D sizeof(struct superblock_security_struct),
>> +       .lbs_xattr_count =3D SELINUX_INODE_INIT_XATTRS,
>>  };
>>
>>  #ifdef CONFIG_PERF_EVENTS
>> diff --git a/security/smack/smack_lsm.c b/security/smack/smack_lsm.c
>> index cfcbb748da2..ba10f4e8632 100644
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
>> @@ -939,26 +948,24 @@ static int smack_inode_alloc_security(struct inode=
 *inode)
>>   * @inode: the newly created inode
>>   * @dir: containing directory object
>>   * @qstr: unused
>> - * @name: where to put the attribute name
>> - * @value: where to put the attribute value
>> - * @len: where to put the length of the attribute
>> + * @xattrs: where to put the attributes
>> + * @num_filled_xattrs: current number of filled xattrs (updated)
>>   *
>>   * Returns 0 if it all works out, -ENOMEM if there's no memory
>>   */
>>  static int smack_inode_init_security(struct inode *inode, struct inode =
*dir,
>> -                                    const struct qstr *qstr, const char=
 **name,
>> -                                    void **value, size_t *len)
>> +                                    const struct qstr *qstr,
>> +                                    struct xattr *xattrs,
>> +                                    int *num_filled_xattrs)
> I'll leave this up to Casey, but 'xattr_count' would be my vote :)

I don't care whether you make the xattr_count change or not. I agree that if
you do change it elsewhere you should change it here, too.

>>  {
>>         struct inode_smack *issp =3D smack_inode(inode);
>>         struct smack_known *skp =3D smk_of_current();
>>         struct smack_known *isp =3D smk_of_inode(inode);
>>         struct smack_known *dsp =3D smk_of_inode(dir);
>> +       struct xattr *xattr =3D lsm_find_xattr_slot(xattrs, num_filled_x=
attrs);
>>         int may;
>>
>> -       if (name)
>> -               *name =3D XATTR_SMACK_SUFFIX;
>> -
>> -       if (value && len) {
>> +       if (xattr) {
>>                 rcu_read_lock();
>>                 may =3D smk_access_entry(skp->smk_known, dsp->smk_known,
>>                                        &skp->smk_rules);
>> @@ -976,11 +983,12 @@ static int smack_inode_init_security(struct inode =
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
>> +               xattr->name =3D XATTR_SMACK_SUFFIX;
>>         }
>>
>>         return 0;
>> @@ -4854,6 +4862,7 @@ struct lsm_blob_sizes smack_blob_sizes __lsm_ro_af=
ter_init =3D {
>>         .lbs_ipc =3D sizeof(struct smack_known *),
>>         .lbs_msg_msg =3D sizeof(struct smack_known *),
>>         .lbs_superblock =3D sizeof(struct superblock_smack),
>> +       .lbs_xattr_count =3D SMACK_INODE_INIT_XATTRS,
>>  };
>>
>>  static struct security_hook_list smack_hooks[] __lsm_ro_after_init =3D {
>> --
>> 2.25.1
