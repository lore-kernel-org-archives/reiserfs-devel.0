From: Casey Schaufler <casey@schaufler-ca.com>
Subject: Re: [PATCH 0/5] evm: Prepare for moving to the LSM infrastructure
Date: Fri, 16 Apr 2021 14:25:10 -0700
Message-ID: <db1bc545-9389-7b86-1582-7de1a8a1435e@schaufler-ca.com>
References: <20210415100435.18619-1-roberto.sassu@huawei.com>
 <7659b8cf-71cc-33b5-dbf1-3eb1ff159fe6@schaufler-ca.com>
 <2c944d6ddeed4519bdbf3733d7318a3d@huawei.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1618608318; bh=PPLdm2iavpSoX4yP6O9bp5lB/lkadgMP3fsSb8Y4PF4=; h=Subject:To:Cc:References:From:Date:In-Reply-To:From:Subject:Reply-To; b=ShOqKtE42hhm6Ory455zZqHgSaqHwaNqOmCFK8W1CvSTJcomHkbnig3jKPMgf+B8zarSwa79KHLS4I2895werj1IaPMEj1hp+yrn6GbsdwdCJnP8BDHZtPgQwHJayMTFOFM771pQfJju/K6HhlzxTW8UE39fsDwb4M1t/Ai7Aj3ytOKjB7eKtEftJgxvII9kiyqgbmrrRjcY0cBofS1YZrt/+WZqFZfYh73hxUQymgommOOprhPwX36XYrdvfTJnSJF4ljnGZi8uVV2+L1bpaieJOmYNXPVFy/zvvW4yTOXU46nekC6wS/J3JgBALVlOpl/5z2HZRP74fUGk7VyDAg==
In-Reply-To: <2c944d6ddeed4519bdbf3733d7318a3d@huawei.com>
Content-Language: en-US
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Roberto Sassu <roberto.sassu@huawei.com>, "zohar@linux.ibm.com" <zohar@linux.ibm.com>, "jmorris@namei.org" <jmorris@namei.org>, "paul@paul-moore.com" <paul@paul-moore.com>
Cc: "linux-integrity@vger.kernel.org" <linux-integrity@vger.kernel.org>, "linux-security-module@vger.kernel.org" <linux-security-module@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "selinux@vger.kernel.org" <selinux@vger.kernel.org>, "reiserfs-devel@vger.kernel.org" <reiserfs-devel@vger.kernel.org>, Casey Schaufler <casey@schaufler-ca.com>

On 4/16/2021 9:37 AM, Roberto Sassu wrote:
>> From: Casey Schaufler [mailto:casey@schaufler-ca.com]
>> Sent: Thursday, April 15, 2021 10:44 PM
>> On 4/15/2021 3:04 AM, Roberto Sassu wrote:
>>> This patch set depends on:
>>>
>>> https://lore.kernel.org/linux-integrity/20210409114313.4073-1-
>> roberto.sassu@huawei.com/
>>> https://lore.kernel.org/linux-integrity/20210407105252.30721-1-
>> roberto.sassu@huawei.com/
>>> One of the challenges that must be tackled to move IMA and EVM to the=20
LSM
>>> infrastructure is to ensure that EVM is capable to correctly handle
>>> multiple stacked LSMs providing an xattr at file creation. At the mom=
ent,
>>> there are few issues that would prevent a correct integration. This p=
atch
>>> set aims at solving them.
>>>
>>> From the LSM infrastructure side, the LSM stacking feature added the
>>> possibility of registering multiple implementations of the security h=
ooks,
>>> that are called sequentially whenever someone calls the corresponding=

>>> security hook. However, security_inode_init_security() and
>>> security_old_inode_init_security() are currently limited to support o=
ne
>>> xattr provided by LSM and one by EVM.
>> That is correct. At present the only two modules that provide extended=

>> attributes are SELinux and Smack. The LSM infrastructure requires more=

>> change, including change to security_inode_init_security(), before tho=
se
>> modules can be used together.
> One of the goals of this patch set is to solve the specific problem
> of security_inode_init_security(), when arbitrary LSMs are added
> to the LSM infrastructure. Given that some problems have
> been already identified, and will arise when a new LSM
> providing an implementation for the inode_init_security hook
> will be added to the LSM infrastructure, it seems a good idea
> fixing them. We could discuss about the solution, if there is
> a better approach.
>
>>> In addition, using the call_int_hook() macro causes some issues. Acco=
rding
>>> to the documentation in include/linux/lsm_hooks.h, it is a legitimate=20
case
>>> that an LSM returns -EOPNOTSUPP when it does not want to provide an x=
attr.
>>> However, the loop defined in the macro would stop calling subsequent =
LSMs
>>> if that happens. In the case of security_old_inode_init_security(), u=
sing
>>> the macro would also cause a memory leak due to replacing the *value
>>> pointer, if multiple LSMs provide an xattr.
>> As there is no case where there will be multiple providers of hooks fo=
r
>> inode_init_security this isn't an issue.
> I could skip the patches that are not required to support
> multiple LSMs registering to the inode_init_security hook
> and just do the EVM changes (see below for the motivation).
>
>>> From EVM side, the first operation to be done is to change the defini=
tion
>>> of evm_inode_init_security() to be compatible with the security hook
>>> definition. Unfortunately, the current definition does not provide en=
ough
>>> information for EVM, as it must have visibility of all xattrs provide=
d by
>>> LSMs to correctly calculate the HMAC. This patch set changes the secu=
rity
>>> hook definition by adding the full array of xattr as a parameter.
>> Why do you want to call evm_inode_init_security() as a regular LSM hoo=
k?
>> Except for the names evm_inode_init_security() and
>> selinux_inode_init_security()
>> have nothing in common. They do very different things and require diff=
erent
>> data, as comes out in the patches.
> I thought that it would be more clean if all hooks are registered
> to the LSM infrastructure. Otherwise, it could happen that some
> hooks are still executed even if the LSM is not active, from the
> perspective of the LSM infrastructure.
>
> evm_inode_init_security() is still a provider of xattrs, like the
> other LSMs, just it requires an extra parameter to calculate
> the HMAC.
>
>> There are evm functions that could be implemented as LSM hooks. I don'=
t think
>> this is one of them. There's no point in going overboard.
> IMA and EVM both use a cache to store the integrity verification,
> which is currently not managed by the LSM infrastructure but
> by an ad-hoc mechanism implemented with an rbtree.
>
> One of the benefits of defining both IMA and EVM as an LSM
> is that we can switch from this ad-hoc mechanism to the one
> implemented for the LSM infrastructure, with a search in
> constant time. Given that evm_inode_init_security() would
> update the integrity status (xattrs are good at inode creation
> time), I would add it as well to the LSM infrastructure.
>
> One additional motivation for defining EVM as an LSM is that
> it would solve one of the EVM limitations that affects its
> usability: partial copy of xattrs (e.g. by cp and tar) would not
> work when an HMAC key is loaded because, since EVM in
> the post set/removexattr hook does not know the status
> of the last integrity verification, it has to deny the permission
> to perform the xattr operation, to avoid that the HMAC is
> calculated on corrupted xattrs. Having the status in the
> per-inode blob would solve this issue more efficiently than
> adding a cache for each verified inode in the rbtree.
>
> Would you see this as an useful modification?

Yes, I think that would be worthwhile.

My biggest objection is to adding a parameter to the hook calls.
The security_inode_init_security() - security_old_inode_init_security()
organization looks wrong to me as written.

There are really three cases here:
	Neither EVM nor initxattrs - taken care of by the "old" variant.
	EVM, but no initxattrs - which doesn't gather the EVM data.
	EVM and initxattrs - which gathers and uses the EVM data.

The code we have now is cleanest for the least common "old" variant,
which is used in only two places, reiserfs and ocfs2. I would suggest
a slightly different approach to getting you what you're after.

Let's change the hook definition for inode_init_security to take a
struct xattr * and the fs_data rather than the name/value/length triple.
It will require a temporary struct xattr in security_old_init_inode_secur=
ity,
but that's a corner case anyway. The security module specific code would =
be
easy to adapt. In the current environment, where there can only be one
module providing a hook, SELinux or Smack will fill in the xattr and retu=
rn.
In the future the modules will have to find an empty slot for their data.=


If your evm_init_inode_security() is registered last you will get
the desired behavior.=20

The MAX_LSM_EVM_XATTR value can be easily computed at compile time:

#define MAX_LSM_EVM_XATTR ( 1 + \
	( IS_ENABLED(CONFIG_SECURITY_SELINUX) ? 1 : 0 ) + \
	( IS_ENABLED(CONFIG_SECURITY_SMACK) ? 1 : 0) )
Yes, you'll waste stack if only one of the modules is active.
On the other hand, if you only compile in one the value will be
perfect and you'll avoid allocation and associated headaches.

>
> Thanks
>
> Roberto
>
> HUAWEI TECHNOLOGIES Duesseldorf GmbH, HRB 56063
> Managing Director: Li Peng, Li Jian, Shi Yanli
>
>>> Secondly, EVM must know how many elements are in the xattr array. It
>> seems
>>> that it is not necessary to add another parameter, as all filesystems=20
that
>>> define an initxattr function, expect that the last element of the arr=
ay
>> is
>>> one with the name field set to NULL. EVM reuses the same assumption.
>>>
>>> This patch set has been tested by introducing several instances of a
>>> TestLSM (some providing an xattr, some not, one with a wrong
>> implementation
>>> to see how the LSM infrastructure handles it). The patch is not inclu=
ded
>>> in this set but it is available here:
>>>
>>>
>> https://github.com/robertosassu/linux/commit/0370ff0fbc16e5d63489836a9=
5
>> 8e65d697f956db
>>> The test, added to ima-evm-utils, is available here:
>>>
>>> https://github.com/robertosassu/ima-evm-utils/blob/evm-multiple-lsms-=
v1-
>> devel-v1/tests/evm_multiple_lsms.test
>>> The test takes a UML kernel built by Travis and launches it several t=
imes,
>>> each time with a different combination of LSMs. After boot, it first =
checks
>>> that there is an xattr for each LSM providing it, and then calculates=20
the
>>> HMAC in user space and compares it with the HMAC calculated by EVM in=

>>> kernel space.
>>>
>>> A test report can be obtained here:
>>>
>>> https://www.travis-ci.com/github/robertosassu/ima-evm-
>> utils/jobs/498699540
>>> Lastly, running the test on reiserfs to check
>>> security_old_inode_init_security(), some issues have been discovered:=20
a
>>> free of xattr->name which is not correct after commit 9548906b2bb7 ('=
xattr:
>>> Constify ->name member of "struct xattr"'), and a misalignment with
>>> security_inode_init_security() (the old version expects the full xatt=
r name
>>> with the security. prefix, the new version just the suffix). The last=20
issue
>>> has not been fixed yet.
>>>
>>> Roberto Sassu (5):
>>>   xattr: Complete constify ->name member of "struct xattr"
>>>   security: Support multiple LSMs implementing the inode_init_securit=
y
>>>     hook
>>>   security: Pass xattrs allocated by LSMs to the inode_init_security
>>>     hook
>>>   evm: Align evm_inode_init_security() definition with LSM
>>>     infrastructure
>>>   evm: Support multiple LSMs providing an xattr
>>>
>>>  fs/reiserfs/xattr_security.c        |  2 -
>>>  include/linux/evm.h                 | 21 ++++---
>>>  include/linux/lsm_hook_defs.h       |  2 +-
>>>  include/linux/lsm_hooks.h           |  5 +-
>>>  security/integrity/evm/evm.h        |  2 +
>>>  security/integrity/evm/evm_crypto.c |  9 ++-
>>>  security/integrity/evm/evm_main.c   | 35 +++++++----
>>>  security/security.c                 | 95 +++++++++++++++++++++++----=
--
>>>  security/selinux/hooks.c            |  3 +-
>>>  security/smack/smack_lsm.c          |  4 +-
>>>  10 files changed, 135 insertions(+), 43 deletions(-)
>>>

