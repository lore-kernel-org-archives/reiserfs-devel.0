From: Casey Schaufler <casey@schaufler-ca.com>
Subject: Re: [PATCH v2 3/6] security: Pass xattrs allocated by LSMs to the
 inode_init_security hook
Date: Thu, 22 Apr 2021 08:46:20 -0700
Message-ID: <37460a6a-da6c-3fdc-7460-0cec024e49db@schaufler-ca.com>
References: <20210421161925.968825-1-roberto.sassu@huawei.com>
 <20210421161925.968825-4-roberto.sassu@huawei.com>
 <0caf1e58-1e2d-c781-3f71-18aaf55cada2@schaufler-ca.com>
 <406d450699034f54b6c184f286acccfe@huawei.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1619106382; bh=UkCXK1QR81Y+wUBBsIECzyf3fHkMEHIz6oyKrszYCLw=; h=Subject:To:Cc:References:From:Date:In-Reply-To:From:Subject:Reply-To; b=XdIWTjdLinm7tygufPd9U9D47z15qW0CYsGuOkY+EIFUYNUgwoO3/ifdyZV4J0Iux/6TmV1ishJSdPOLf65ZjtPSFM0H1L5eEKCB8W5lumwfdf2pJqohaab5Yn2hPw+08+hDDdUq+dnLuD5WQEGDkC7r20jsYKvU0MY3HtuZcEZ6Lj6dpyj7PMpJ2VTfwu9DXq3tlzhP4TY92qtrhx7F3q/xmeX5euIWgUSdU2g0358byHwCV2vQBl/8dLEIgl3/s9SNzSkPAwTskRd1qTvMbapE4WwPBQYra3K7fUfX9h7uFa5/MI1YG0QSUKgM5nh6nic28gVni22IkXWhvnxomQ==
In-Reply-To: <406d450699034f54b6c184f286acccfe@huawei.com>
Content-Language: en-US
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Roberto Sassu <roberto.sassu@huawei.com>, "zohar@linux.ibm.com" <zohar@linux.ibm.com>, "jmorris@namei.org" <jmorris@namei.org>, "paul@paul-moore.com" <paul@paul-moore.com>
Cc: "linux-integrity@vger.kernel.org" <linux-integrity@vger.kernel.org>, "linux-security-module@vger.kernel.org" <linux-security-module@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "selinux@vger.kernel.org" <selinux@vger.kernel.org>, "reiserfs-devel@vger.kernel.org" <reiserfs-devel@vger.kernel.org>, Casey Schaufler <casey@schaufler-ca.com>

On 4/22/2021 6:46 AM, Roberto Sassu wrote:
>> From: Casey Schaufler [mailto:casey@schaufler-ca.com]
>> Sent: Thursday, April 22, 2021 12:44 AM
>> On 4/21/2021 9:19 AM, Roberto Sassu wrote:
>>> In preparation for moving EVM to the LSM infrastructure, this patch
>>> replaces the name, value, len triple with the xattr array pointer pro=
vided
>>> by security_inode_init_security(). LSMs are expected to call the new
>>> function lsm_find_xattr_slot() to find the first unused slot of the a=
rray
>>> where the xattr should be written.
>>>
>>> This patch modifies also SELinux and Smack to search for an unused sl=
ot, to
>>> have a consistent behavior across LSMs (the unmodified version would
>>> overwrite the xattr set by the first LSM in the chain). It is also
>>> desirable to have the modification in those LSMs, as they are likely =
used
>>> as a reference for the development of new LSMs.
>> This looks better than V1. One safety comment below.
>>
>>> Signed-off-by: Roberto Sassu <roberto.sassu@huawei.com>
>>> ---
>>>  include/linux/lsm_hook_defs.h |  4 ++--
>>>  include/linux/lsm_hooks.h     | 18 +++++++++++++++---
>>>  security/security.c           | 13 +++++++------
>>>  security/selinux/hooks.c      | 13 ++++++-------
>>>  security/smack/smack_lsm.c    | 20 +++++++++-----------
>>>  5 files changed, 39 insertions(+), 29 deletions(-)
>>>
>>> diff --git a/include/linux/lsm_hook_defs.h b/include/linux/lsm_hook_d=
efs.h
>>> index 477a597db013..afb9dd122f60 100644
>>> --- a/include/linux/lsm_hook_defs.h
>>> +++ b/include/linux/lsm_hook_defs.h
>>> @@ -111,8 +111,8 @@ LSM_HOOK(int, 0, path_notify, const struct path
>> *path, u64 mask,
>>>  LSM_HOOK(int, 0, inode_alloc_security, struct inode *inode)
>>>  LSM_HOOK(void, LSM_RET_VOID, inode_free_security, struct inode *inod=
e)
>>>  LSM_HOOK(int, 0, inode_init_security, struct inode *inode,
>>> -	 struct inode *dir, const struct qstr *qstr, const char **name,
>>> -	 void **value, size_t *len)
>>> +	 struct inode *dir, const struct qstr *qstr, struct xattr *xattrs,
>>> +	 void *fs_data)
>>>  LSM_HOOK(int, 0, inode_init_security_anon, struct inode *inode,
>>>  	 const struct qstr *name, const struct inode *context_inode)
>>>  LSM_HOOK(int, 0, inode_create, struct inode *dir, struct dentry *den=
try,
>>> diff --git a/include/linux/lsm_hooks.h b/include/linux/lsm_hooks.h
>>> index c5498f5174ce..e8c9bac29b9d 100644
>>> --- a/include/linux/lsm_hooks.h
>>> +++ b/include/linux/lsm_hooks.h
>>> @@ -27,6 +27,7 @@
>>>
>>>  #include <linux/security.h>
>>>  #include <linux/init.h>
>>> +#include <linux/xattr.h>
>>>  #include <linux/rculist.h>
>>>
>>>  /**
>>> @@ -227,9 +228,11 @@
>>>   *	@inode contains the inode structure of the newly created inode.
>>>   *	@dir contains the inode structure of the parent directory.
>>>   *	@qstr contains the last path component of the new object
>>> - *	@name will be set to the allocated name suffix (e.g. selinux).
>>> - *	@value will be set to the allocated attribute value.
>>> - *	@len will be set to the length of the value.
>>> + *	@xattrs contains the full array of xattrs allocated by LSMs where=

>>> + *	->name will be set to the allocated name suffix (e.g. selinux).
>>> + *	->value will be set to the allocated attribute value.
>>> + *	->len will be set to the length of the value.
>>> + *	@fs_data contains filesystem-specific data.
>>>   *	Returns 0 if @name and @value have been successfully set,
>>>   *	-EOPNOTSUPP if no security attribute is needed, or
>>>   *	-ENOMEM on memory allocation failure.
>>> @@ -1661,4 +1664,13 @@ static inline void security_delete_hooks(struc=
t
>> security_hook_list *hooks,
>>>  extern int lsm_inode_alloc(struct inode *inode);
>>>
>> Some "security researcher" with a fuzz tester is going to manage to du=
mp junk
>> into the slots and ruin your week. I suggest a simple change to make b=
ounds
>> checking
>> possible. It should never happen, but if that was sufficient people wo=
uld
>> love C
>> string processing better.
>>
>>> +static inline struct xattr *lsm_find_xattr_slot(struct xattr *xattrs=
)
>> +static inline struct xattr *lsm_find_xattr_slot(struct xattr *xattrs,=20
int available)
> Ok. I looked at how I should do that. Initially, I thought that I could=

> use a global variable storing the number of inode_init_security
> implementations, determined at LSM registration time. Then,
> I realized that this would not work, as the number of array elements
> when security_old_inode_init_security() is called is 1.

You can address that by expanding the call_int_hook MACRO in
security_old_inode_init_security() in place and change it to stop
after the first call. The two callers of security_old_inode_init_security=
()
are going to need to be converted to security_inode_init_security()
when the "complete" stacking (i.e. SELinux + Smack) anyway, so I don't
see that as an issue.

Is anyone concerned that ocfs2 and reiserfs aren't EVM capable?

>
> I modified the patch set to pass also the number of array elements.
>
> Roberto
>
> HUAWEI TECHNOLOGIES Duesseldorf GmbH, HRB 56063
> Managing Director: Li Peng, Li Jian, Shi Yanli
>
>>> +{
>>> +	struct xattr *slot;
>>> +
>>> +	for (slot =3D xattrs; slot && slot->name !=3D NULL; slot++)
>> +	for (slot =3D xattrs; slot && slot->name !=3D NULL; slot++)
>>  		if (WARN_ON(slot > xattrs[available]))
>> 			return NULL;
>>
>>> +		;
>>> +
>>> +	return slot;
>>> +}
>>>  #endif /* ! __LINUX_LSM_HOOKS_H */
>>> diff --git a/security/security.c b/security/security.c
>>> index 7f14e59c4f8e..2c1fe1496069 100644
>>> --- a/security/security.c
>>> +++ b/security/security.c
>>> @@ -1037,18 +1037,16 @@ int security_inode_init_security(struct inode=

>> *inode, struct inode *dir,
>>>  	if (!initxattrs)
>>>  		return call_int_hook(inode_init_security, -EOPNOTSUPP,
>> inode,
>>> -				     dir, qstr, NULL, NULL, NULL);
>>> +				     dir, qstr, NULL, fs_data);
>>>  	memset(new_xattrs, 0, sizeof(new_xattrs));
>>>  	lsm_xattr =3D new_xattrs;
>>>  	ret =3D call_int_hook(inode_init_security, -EOPNOTSUPP, inode, dir,=20
qstr,
>>> -						&lsm_xattr->name,
>>> -						&lsm_xattr->value,
>>> -						&lsm_xattr->value_len);
>>> +			    lsm_xattr, fs_data);
>>>  	if (ret)
>>>  		goto out;
>>>
>>>  	evm_xattr =3D lsm_xattr + 1;
>>> -	ret =3D evm_inode_init_security(inode, lsm_xattr, evm_xattr);
>>> +	ret =3D evm_inode_init_security(inode, new_xattrs, evm_xattr);
>>>  	if (ret)
>>>  		goto out;
>>>  	ret =3D initxattrs(inode, new_xattrs, fs_data);
>>> @@ -1071,10 +1069,13 @@ int security_old_inode_init_security(struct i=
node
>> *inode, struct inode *dir,
>>>  				     const struct qstr *qstr, const char **name,
>>>  				     void **value, size_t *len)
>>>  {
>>> +	struct xattr xattr =3D { .name =3D NULL, .value =3D NULL, .value_le=
n =3D 0 };
>>> +	struct xattr *lsm_xattr =3D (name && value && len) ? &xattr : NULL;=

>>> +
>>>  	if (unlikely(IS_PRIVATE(inode)))
>>>  		return -EOPNOTSUPP;
>>>  	return call_int_hook(inode_init_security, -EOPNOTSUPP, inode, dir,
>>> -			     qstr, name, value, len);
>>> +			     qstr, lsm_xattr, NULL);
>>>  }
>>>  EXPORT_SYMBOL(security_old_inode_init_security);
>>>
>>> diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
>>> index ddd097790d47..806827eb132a 100644
>>> --- a/security/selinux/hooks.c
>>> +++ b/security/selinux/hooks.c
>>> @@ -2916,11 +2916,11 @@ static int selinux_dentry_create_files_as(str=
uct
>> dentry *dentry, int mode,
>>>  static int selinux_inode_init_security(struct inode *inode, struct i=
node *dir,
>>>  				       const struct qstr *qstr,
>>> -				       const char **name,
>>> -				       void **value, size_t *len)
>>> +				       struct xattr *xattrs, void *fs_data)
>>>  {
>>>  	const struct task_security_struct *tsec =3D selinux_cred(current_cr=
ed());
>>>  	struct superblock_security_struct *sbsec;
>>> +	struct xattr *xattr =3D lsm_find_xattr_slot(xattrs);
>>>  	u32 newsid, clen;
>>>  	int rc;
>>>  	char *context;
>>> @@ -2947,16 +2947,15 @@ static int selinux_inode_init_security(struct=

>> inode *inode, struct inode *dir,
>>>  	    !(sbsec->flags & SBLABEL_MNT))
>>>  		return -EOPNOTSUPP;
>>>
>>> -	if (name)
>>> -		*name =3D XATTR_SELINUX_SUFFIX;
>>> +	if (xattr) {
>>> +		xattr->name =3D XATTR_SELINUX_SUFFIX;
>>>
>>> -	if (value && len) {
>>>  		rc =3D security_sid_to_context_force(&selinux_state, newsid,
>>>  						   &context, &clen);
>>>  		if (rc)
>>>  			return rc;
>>> -		*value =3D context;
>>> -		*len =3D clen;
>>> +		xattr->value =3D context;
>>> +		xattr->value_len =3D clen;
>>>  	}
>>>
>>>  	return 0;
>>> diff --git a/security/smack/smack_lsm.c b/security/smack/smack_lsm.c
>>> index 12a45e61c1a5..af7eee0fee52 100644
>>> --- a/security/smack/smack_lsm.c
>>> +++ b/security/smack/smack_lsm.c
>>> @@ -962,26 +962,24 @@ static int smack_inode_alloc_security(struct in=
ode
>> *inode)
>>>   * @inode: the newly created inode
>>>   * @dir: containing directory object
>>>   * @qstr: unused
>>> - * @name: where to put the attribute name
>>> - * @value: where to put the attribute value
>>> - * @len: where to put the length of the attribute
>>> + * @xattrs: where to put the attribute
>>>   *
>>>   * Returns 0 if it all works out, -ENOMEM if there's no memory
>>>   */
>>>  static int smack_inode_init_security(struct inode *inode, struct ino=
de
>> *dir,
>>> -				     const struct qstr *qstr, const char **name,
>>> -				     void **value, size_t *len)
>>> +				     const struct qstr *qstr,
>>> +				     struct xattr *xattrs, void *fs_data)
>>>  {
>>>  	struct inode_smack *issp =3D smack_inode(inode);
>>>  	struct smack_known *skp =3D smk_of_current();
>>>  	struct smack_known *isp =3D smk_of_inode(inode);
>>>  	struct smack_known *dsp =3D smk_of_inode(dir);
>>> +	struct xattr *xattr =3D lsm_find_xattr_slot(xattrs);
>>>  	int may;
>>>
>>> -	if (name)
>>> -		*name =3D XATTR_SMACK_SUFFIX;
>>> +	if (xattr) {
>>> +		xattr->name =3D XATTR_SMACK_SUFFIX;
>>>
>>> -	if (value && len) {
>>>  		rcu_read_lock();
>>>  		may =3D smk_access_entry(skp->smk_known, dsp->smk_known,
>>>  				       &skp->smk_rules);
>>> @@ -999,11 +997,11 @@ static int smack_inode_init_security(struct ino=
de
>> *inode, struct inode *dir,
>>>  			issp->smk_flags |=3D SMK_INODE_CHANGED;
>>>  		}
>>>
>>> -		*value =3D kstrdup(isp->smk_known, GFP_NOFS);
>>> -		if (*value =3D=3D NULL)
>>> +		xattr->value =3D kstrdup(isp->smk_known, GFP_NOFS);
>>> +		if (xattr->value =3D=3D NULL)
>>>  			return -ENOMEM;
>>>
>>> -		*len =3D strlen(isp->smk_known);
>>> +		xattr->value_len =3D strlen(isp->smk_known);
>>>  	}
>>>
>>>  	return 0;

