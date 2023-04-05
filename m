From: Roberto Sassu <roberto.sassu@huaweicloud.com>
Subject: Re: [PATCH v10 2/4] security: Allow all LSMs to provide xattrs for
 inode_init_security hook
Date: Wed, 5 Apr 2023 11:43:53 +0200
Message-ID: <7549b624-421e-30b9-ca99-de42929354c7@huaweicloud.com>
References: <20230331123221.3273328-1-roberto.sassu@huaweicloud.com>
 <20230331123221.3273328-3-roberto.sassu@huaweicloud.com>
 <CAHC9VhSbGdij6xz9D49my37kD9qYrBmh2x7=cNFFDL2dZ=EZTw@mail.gmail.com>
 <5dbb9430-1e26-ec12-26a2-3718c84e33c2@schaufler-ca.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <bpf-owner@vger.kernel.org>
Content-Language: en-US
In-Reply-To: <5dbb9430-1e26-ec12-26a2-3718c84e33c2@schaufler-ca.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: Casey Schaufler <casey@schaufler-ca.com>, Paul Moore <paul@paul-moore.com>
Cc: zohar@linux.ibm.com, dmitry.kasatkin@gmail.com, jmorris@namei.org, serge@hallyn.com, stephen.smalley.work@gmail.com, eparis@parisplace.org, reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org, linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org, selinux@vger.kernel.org, bpf@vger.kernel.org, kpsingh@kernel.org, keescook@chromium.org, nicolas.bouchinet@clip-os.org, Roberto Sassu <roberto.sassu@huawei.com>

On 4/5/2023 4:08 AM, Casey Schaufler wrote:
> On 4/4/2023 11:54 AM, Paul Moore wrote:
>> On Fri, Mar 31, 2023 at 8:33=E2=80=AFAM Roberto Sassu
>> <roberto.sassu@huaweicloud.com> wrote:
>>> From: Roberto Sassu <roberto.sassu@huawei.com>
>>>
>>> Currently, security_inode_init_security() supports only one LSM providi=
ng
>>> an xattr and EVM calculating the HMAC on that xattr, plus other inode
>>> metadata.
>>>
>>> Allow all LSMs to provide one or multiple xattrs, by extending the secu=
rity
>>> blob reservation mechanism. Introduce the new lbs_xattr_count field of =
the
>>> lsm_blob_sizes structure, so that each LSM can specify how many xattrs =
it
>>> needs, and the LSM infrastructure knows how many xattr slots it should
>>> allocate.
>>>
>>> Dynamically allocate the new_xattrs array to be populated by LSMs with =
the
>>> inode_init_security hook, and pass it to the latter instead of the
>>> name/value/len triple. Unify the !initxattrs and initxattrs case, simply
>>> don't allocate the new_xattrs array in the former.
>>>
>>> Also, pass to the hook the number of xattrs filled by each LSM, so that
>>> there are no gaps when the next LSM fills the array. Gaps might occur
>>> because an LSM can legitimately request xattrs to the LSM infrastructur=
e,
>>> but not fill the reserved slots, if it was not initialized.
>>>
>>> Update the documentation of security_inode_init_security() to reflect t=
he
>>> changes, and fix the description of the xattr name, as it is not alloca=
ted
>>> anymore.
>>>
>>> Finally, adapt both SELinux and Smack to use the new definition of the
>>> inode_init_security hook, and to fill the reserved slots in the xattr
>>> array. Introduce the lsm_get_xattr_slot() helper to retrieve an availab=
le
>>> slot to fill, and to increment the number of filled slots.
>>>
>>> Move the xattr->name assignment after the xattr->value one, so that it =
is
>>> done only in case of successful memory allocation. For Smack, also rese=
rve
>>> space for the other defined xattrs although they are not set yet in
>>> smack_inode_init_security().
>>>
>>> Reported-by: Nicolas Bouchinet <nicolas.bouchinet@clip-os.org> (EVM cra=
sh)
>>> Link: https://lore.kernel.org/linux-integrity/Y1FTSIo+1x+4X0LS@archlinu=
x/
>>> Signed-off-by: Roberto Sassu <roberto.sassu@huawei.com>
>>> ---
>>>   include/linux/lsm_hook_defs.h |  6 +--
>>>   include/linux/lsm_hooks.h     | 20 ++++++++++
>>>   security/security.c           | 71 +++++++++++++++++++++++------------
>>>   security/selinux/hooks.c      | 17 +++++----
>>>   security/smack/smack_lsm.c    | 32 ++++++++++------
>>>   5 files changed, 99 insertions(+), 47 deletions(-)
>> This looks good aside from a few small things (below).  From what I
>> can see, there are only two outstanding issues to answer: the number
>> of Smack xattrs, sign-off from Casey for the Smack bits.
>>
>>> diff --git a/include/linux/lsm_hook_defs.h b/include/linux/lsm_hook_def=
s.h
>>> index 6bb55e61e8e..a1896f90089 100644
>>> --- a/include/linux/lsm_hook_defs.h
>>> +++ b/include/linux/lsm_hook_defs.h
>>> @@ -111,9 +111,9 @@ LSM_HOOK(int, 0, path_notify, const struct path *pa=
th, u64 mask,
>>>           unsigned int obj_type)
>>>   LSM_HOOK(int, 0, inode_alloc_security, struct inode *inode)
>>>   LSM_HOOK(void, LSM_RET_VOID, inode_free_security, struct inode *inode)
>>> -LSM_HOOK(int, 0, inode_init_security, struct inode *inode,
>>> -        struct inode *dir, const struct qstr *qstr, const char **name,
>>> -        void **value, size_t *len)
>>> +LSM_HOOK(int, -EOPNOTSUPP, inode_init_security, struct inode *inode,
>>> +        struct inode *dir, const struct qstr *qstr, struct xattr *xatt=
rs,
>>> +        int *xattr_count)
>>>   LSM_HOOK(int, 0, inode_init_security_anon, struct inode *inode,
>>>           const struct qstr *name, const struct inode *context_inode)
>>>   LSM_HOOK(int, 0, inode_create, struct inode *dir, struct dentry *dent=
ry,
>>> diff --git a/include/linux/lsm_hooks.h b/include/linux/lsm_hooks.h
>>> index c2be66c669a..9eb9b686493 100644
>>> --- a/include/linux/lsm_hooks.h
>>> +++ b/include/linux/lsm_hooks.h
>>> @@ -28,6 +28,7 @@
>>>   #include <linux/security.h>
>>>   #include <linux/init.h>
>>>   #include <linux/rculist.h>
>>> +#include <linux/xattr.h>
>>>
>>>   union security_list_options {
>>>          #define LSM_HOOK(RET, DEFAULT, NAME, ...) RET (*NAME)(__VA_ARG=
S__);
>>> @@ -63,8 +64,27 @@ struct lsm_blob_sizes {
>>>          int     lbs_ipc;
>>>          int     lbs_msg_msg;
>>>          int     lbs_task;
>>> +       int     lbs_xattr_count; /* number of xattr slots in new_xattrs=
 array */
>>>   };
>>>
>>> +/**
>>> + * lsm_get_xattr_slot - Return the next available slot and increment t=
he index
>>> + * @xattrs: array storing LSM-provided xattrs
>>> + * @xattr_count: number of already stored xattrs (updated)
>>> + *
>>> + * Retrieve the first available slot in the @xattrs array to fill with=
 an xattr,
>>> + * and increment @xattr_count.
>>> + *
>>> + * Return: The slot to fill in @xattrs if non-NULL, NULL otherwise.
>>> + */
>>> +static inline struct xattr *lsm_get_xattr_slot(struct xattr *xattrs,
>>> +                                              int *xattr_count)
>>> +{
>>> +       if (unlikely(!xattrs))
>>> +               return NULL;
>>> +       return xattrs + (*xattr_count)++;
>>> +}
>>> +
>>>   /*
>>>    * LSM_RET_VOID is used as the default value in LSM_HOOK definitions =
for void
>>>    * LSM hooks (in include/linux/lsm_hook_defs.h).
>>> diff --git a/security/security.c b/security/security.c
>>> index f4170efcddd..1aeaa8ce449 100644
>>> --- a/security/security.c
>>> +++ b/security/security.c
>>> @@ -31,8 +31,6 @@
>>>   #include <linux/msg.h>
>>>   #include <net/flow.h>
>>>
>>> -#define MAX_LSM_EVM_XATTR      2
>>> -
>>>   /* How many LSMs were built into the kernel? */
>>>   #define LSM_COUNT (__end_lsm_info - __start_lsm_info)
>>>
>>> @@ -212,6 +210,8 @@ static void __init lsm_set_blob_sizes(struct lsm_bl=
ob_sizes *needed)
>>>          lsm_set_blob_size(&needed->lbs_msg_msg, &blob_sizes.lbs_msg_ms=
g);
>>>          lsm_set_blob_size(&needed->lbs_superblock, &blob_sizes.lbs_sup=
erblock);
>>>          lsm_set_blob_size(&needed->lbs_task, &blob_sizes.lbs_task);
>>> +       lsm_set_blob_size(&needed->lbs_xattr_count,
>>> +                         &blob_sizes.lbs_xattr_count);
>>>   }
>>>
>>>   /* Prepare LSM for initialization. */
>>> @@ -378,6 +378,7 @@ static void __init ordered_lsm_init(void)
>>>          init_debug("msg_msg blob size    =3D %d\n", blob_sizes.lbs_msg=
_msg);
>>>          init_debug("superblock blob size =3D %d\n", blob_sizes.lbs_sup=
erblock);
>>>          init_debug("task blob size       =3D %d\n", blob_sizes.lbs_tas=
k);
>>> +       init_debug("xattr slots          =3D %d\n", blob_sizes.lbs_xatt=
r_count);
>>>
>>>          /*
>>>           * Create any kmem_caches needed for blobs
>>> @@ -1591,11 +1592,15 @@ EXPORT_SYMBOL(security_dentry_create_files_as);
>>>    * created inode and set up the incore security field for the new ino=
de.  This
>>>    * hook is called by the fs code as part of the inode creation transa=
ction and
>>>    * provides for atomic labeling of the inode, unlike the post_create/=
mkdir/...
>>> - * hooks called by the VFS.  The hook function is expected to allocate=
 the name
>>> - * and value via kmalloc, with the caller being responsible for callin=
g kfree
>>> - * after using them.  If the security module does not use security att=
ributes
>>> - * or does not wish to put a security attribute on this particular ino=
de, then
>>> - * it should return -EOPNOTSUPP to skip this processing.
>>> + * hooks called by the VFS.  The hook function is expected to populate=
 the
>>> + * @xattrs array, by calling lsm_get_xattr_slot() to retrieve the slots
>>> + * reserved by the security module with the lbs_xattr_count field of t=
he
>>> + * lsm_blob_sizes structure.  For each slot, the hook function should =
set ->name
>>> + * to the attribute name suffix (e.g. selinux), to allocate ->value (w=
ill be
>>> + * freed by the caller) and set it to the attribute value, to set ->va=
lue_len to
>>> + * the length of the value.  If the security module does not use secur=
ity
>>> + * attributes or does not wish to put a security attribute on this par=
ticular
>>> + * inode, then it should return -EOPNOTSUPP to skip this processing.
>>>    *
>>>    * Return: Returns 0 on success, -EOPNOTSUPP if no security attribute=
 is
>>>    * needed, or -ENOMEM on memory allocation failure.
>>> @@ -1604,33 +1609,51 @@ int security_inode_init_security(struct inode *=
inode, struct inode *dir,
>>>                                   const struct qstr *qstr,
>>>                                   const initxattrs initxattrs, void *fs=
_data)
>>>   {
>>> -       struct xattr new_xattrs[MAX_LSM_EVM_XATTR + 1];
>>> -       struct xattr *lsm_xattr, *evm_xattr, *xattr;
>>> -       int ret;
>>> +       struct security_hook_list *P;
>>> +       struct xattr *new_xattrs =3D NULL;
>>> +       int ret =3D -EOPNOTSUPP, xattr_count =3D 0;
>>>
>>>          if (unlikely(IS_PRIVATE(inode)))
>>>                  return 0;
>>>
>>> -       if (!initxattrs)
>>> -               return call_int_hook(inode_init_security, -EOPNOTSUPP, =
inode,
>>> -                                    dir, qstr, NULL, NULL, NULL);
>>> -       memset(new_xattrs, 0, sizeof(new_xattrs));
>>> -       lsm_xattr =3D new_xattrs;
>>> -       ret =3D call_int_hook(inode_init_security, -EOPNOTSUPP, inode, =
dir, qstr,
>>> -                           &lsm_xattr->name,
>>> -                           &lsm_xattr->value,
>>> -                           &lsm_xattr->value_len);
>>> -       if (ret)
>>> +       if (!blob_sizes.lbs_xattr_count)
>>> +               return 0;
>>> +
>>> +       if (initxattrs) {
>>> +               /* Allocate +1 for EVM and +1 as terminator. */
>>> +               new_xattrs =3D kcalloc(blob_sizes.lbs_xattr_count + 2,
>>> +                                    sizeof(*new_xattrs), GFP_NOFS);
>>> +               if (!new_xattrs)
>>> +                       return -ENOMEM;
>>> +       }
>>> +
>>> +       hlist_for_each_entry(P, &security_hook_heads.inode_init_securit=
y,
>>> +                            list) {
>>> +               ret =3D P->hook.inode_init_security(inode, dir, qstr, n=
ew_xattrs,
>>> +                                                 &xattr_count);
>>> +               if (ret && ret !=3D -EOPNOTSUPP)
>>> +                       goto out;
>>> +               /*
>>> +                * As documented in lsm_hooks.h, -EOPNOTSUPP in this co=
ntext
>>> +                * means that the LSM is not willing to provide an xatt=
r, not
>>> +                * that it wants to signal an error. Thus, continue to =
invoke
>>> +                * the remaining LSMs.
>>> +                */
>>> +       }
>>> +
>>> +       /* If initxattrs() is NULL, xattr_count is zero, skip the call.=
 */
>>> +       if (!xattr_count)
>>>                  goto out;
>>>
>>> -       evm_xattr =3D lsm_xattr + 1;
>>> -       ret =3D evm_inode_init_security(inode, lsm_xattr, evm_xattr);
>>> +       ret =3D evm_inode_init_security(inode, new_xattrs,
>>> +                                     new_xattrs + xattr_count);
>> I think it's cleaner to write '&new_xattrs[xattr_count]' for the third
>> parameter above (no concerns around pointer math), and stylistically
>> it matches better with the for-kfree loop below.
>>
>>>          if (ret)
>>>                  goto out;
>>>          ret =3D initxattrs(inode, new_xattrs, fs_data);
>>>   out:
>>> -       for (xattr =3D new_xattrs; xattr->value !=3D NULL; xattr++)
>>> -               kfree(xattr->value);
>>> +       for (; xattr_count > 0; xattr_count--)
>>> +               kfree(new_xattrs[xattr_count - 1].value);
>>> +       kfree(new_xattrs);
>>>          return (ret =3D=3D -EOPNOTSUPP) ? 0 : ret;
>>>   }
>>>   EXPORT_SYMBOL(security_inode_init_security);
>> ..
>>
>>> diff --git a/security/smack/smack_lsm.c b/security/smack/smack_lsm.c
>>> index cfcbb748da2..8392983334b 100644
>>> --- a/security/smack/smack_lsm.c
>>> +++ b/security/smack/smack_lsm.c
>>> @@ -52,6 +52,15 @@
>>>   #define SMK_RECEIVING  1
>>>   #define SMK_SENDING    2
>>>
>>> +/*
>>> + * Smack uses multiple xattrs.
>>> + * SMACK64 - for access control, SMACK64EXEC - label for the program,
>> I think it would be good to move SMACK64EXEC to its own line; it took
>> me a minute to figure out why SMACK_INODE_INIT_XATTRS was set to '4'
>> when I only say three comment lines ... ;)
>>
>>> + * SMACK64MMAP - controls library loading,
>>> + * SMACK64TRANSMUTE - label initialization,
>>> + * Not saved on files - SMACK64IPIN and SMACK64IPOUT
>>> + */
>>> +#define SMACK_INODE_INIT_XATTRS 4
>> If smack_inode_init_security() only ever populates a single xattr, and
>> that is the only current user of SMACK_INODE_INIT_XATTRS, can we make
>> this '1' and shrink the xattr allocation a bit?
>=20
> If the parent directory is marked with SMACK64_TRANSMUTE, the access
> rule allowing the access has the "t" mode, and the object being initializ=
ed
> is a directory, the new inode should get the SMACK64_TRANSMUTE attribute.
> The callers of security_inode_init_security() don't seem to care.
> I can't say if the evm code is getting SMACK64_TRANSMUTE or, for that
> matter, SMACK64_EXEC and SMACK64_MMAP, some other way. The older system
> allowed for multiple Smack xattrs, but I'm not clear on exactly how.

If you like to set an additional xattr, that would be possible now.=20
Since we reserve multiple xattrs, we can call lsm_get_xattr_slot()=20
another time and set SMACK64_TRANSMUTE.

I think, if the kernel config has CONFIG_EVM_EXTRA_SMACK_XATTRS set,
EVM would protect SMACK64_TRANSMUTE too.

Roberto

>>>   #ifdef SMACK_IPV6_PORT_LABELING
>>>   static DEFINE_MUTEX(smack_ipv6_lock);
>>>   static LIST_HEAD(smk_ipv6_port_list);
>>> @@ -939,26 +948,23 @@ static int smack_inode_alloc_security(struct inod=
e *inode)
>>>    * @inode: the newly created inode
>>>    * @dir: containing directory object
>>>    * @qstr: unused
>>> - * @name: where to put the attribute name
>>> - * @value: where to put the attribute value
>>> - * @len: where to put the length of the attribute
>>> + * @xattrs: where to put the attributes
>>> + * @xattr_count: current number of LSM-provided xattrs (updated)
>>>    *
>>>    * Returns 0 if it all works out, -ENOMEM if there's no memory
>>>    */
>>>   static int smack_inode_init_security(struct inode *inode, struct inod=
e *dir,
>>> -                                    const struct qstr *qstr, const cha=
r **name,
>>> -                                    void **value, size_t *len)
>>> +                                    const struct qstr *qstr,
>>> +                                    struct xattr *xattrs, int *xattr_c=
ount)
>>>   {
>>>          struct inode_smack *issp =3D smack_inode(inode);
>>>          struct smack_known *skp =3D smk_of_current();
>>>          struct smack_known *isp =3D smk_of_inode(inode);
>>>          struct smack_known *dsp =3D smk_of_inode(dir);
>>> +       struct xattr *xattr =3D lsm_get_xattr_slot(xattrs, xattr_count);
>>>          int may;
>>>
>>> -       if (name)
>>> -               *name =3D XATTR_SMACK_SUFFIX;
>>> -
>>> -       if (value && len) {
>>> +       if (xattr) {
>>>                  rcu_read_lock();
>>>                  may =3D smk_access_entry(skp->smk_known, dsp->smk_know=
n,
>>>                                         &skp->smk_rules);
>>> @@ -976,11 +982,12 @@ static int smack_inode_init_security(struct inode=
 *inode, struct inode *dir,
>>>                          issp->smk_flags |=3D SMK_INODE_CHANGED;
>>>                  }
>>>
>>> -               *value =3D kstrdup(isp->smk_known, GFP_NOFS);
>>> -               if (*value =3D=3D NULL)
>>> +               xattr->value =3D kstrdup(isp->smk_known, GFP_NOFS);
>>> +               if (xattr->value =3D=3D NULL)
>>>                          return -ENOMEM;
>>>
>>> -               *len =3D strlen(isp->smk_known);
>>> +               xattr->value_len =3D strlen(isp->smk_known);
>>> +               xattr->name =3D XATTR_SMACK_SUFFIX;
>>>          }
>>>
>>>          return 0;
>>> @@ -4854,6 +4861,7 @@ struct lsm_blob_sizes smack_blob_sizes __lsm_ro_a=
fter_init =3D {
>>>          .lbs_ipc =3D sizeof(struct smack_known *),
>>>          .lbs_msg_msg =3D sizeof(struct smack_known *),
>>>          .lbs_superblock =3D sizeof(struct superblock_smack),
>>> +       .lbs_xattr_count =3D SMACK_INODE_INIT_XATTRS,
>>>   };
>>>
>>>   static struct security_hook_list smack_hooks[] __lsm_ro_after_init =
=3D {
>>> --
>>> 2.25.1

