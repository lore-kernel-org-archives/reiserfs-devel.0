From: Casey Schaufler <casey@schaufler-ca.com>
Subject: Re: [PATCH 0/5] evm: Prepare for moving to the LSM infrastructure
Date: Thu, 15 Apr 2021 13:43:39 -0700
Message-ID: <7659b8cf-71cc-33b5-dbf1-3eb1ff159fe6@schaufler-ca.com>
References: <20210415100435.18619-1-roberto.sassu@huawei.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-security-module-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1618519423; bh=OH1Jhs0M2/ItlhbCePyj39PnGsZxt1agi51Yp9IbQOo=; h=Subject:To:Cc:References:From:Date:In-Reply-To:From:Subject:Reply-To; b=n47CZzSk0xB4D0IyEuc2jqwlGkSzhurDTvrCf+crlC35LH4CidGr27PnpEe0hI5cLkU3zNV/FJhk0zlhqwDSt0ivdmRv1nd9IpL179mZeEkgwiWQNh+UuU+iRuxbu0XUASyznNqsoTCUSA7XXPRdFMHMkmaKX7V89PPTt4DO18QNdYnNhR0U7peoA+ZE+VdvjV1e3WUO/tHFmWevjq6OrvphcPWYy4EJ0an9xsAEJT3FPd/oMvGhSBaICaxEOo7TejFGMAO2DCFT5pSX5YUA3yCYUF3MgRgWXoGL8nQKwjVPlFPDy8QcuQ6xaJSyLknJ9ig39SOb3aZyx2rVCQVkeQ==
In-Reply-To: <20210415100435.18619-1-roberto.sassu@huawei.com>
Content-Language: en-US
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Roberto Sassu <roberto.sassu@huawei.com>, zohar@linux.ibm.com, jmorris@namei.org, paul@paul-moore.com
Cc: linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, selinux@vger.kernel.org, reiserfs-devel@vger.kernel.org, Casey Schaufler <casey@schaufler-ca.com>

On 4/15/2021 3:04 AM, Roberto Sassu wrote:
> This patch set depends on:
>
> https://lore.kernel.org/linux-integrity/20210409114313.4073-1-roberto.s=
assu@huawei.com/
> https://lore.kernel.org/linux-integrity/20210407105252.30721-1-roberto.=
sassu@huawei.com/
>
> One of the challenges that must be tackled to move IMA and EVM to the L=
SM
> infrastructure is to ensure that EVM is capable to correctly handle
> multiple stacked LSMs providing an xattr at file creation. At the momen=
t,
> there are few issues that would prevent a correct integration. This pat=
ch
> set aims at solving them.
>
> From the LSM infrastructure side, the LSM stacking feature added the
> possibility of registering multiple implementations of the security hoo=
ks,
> that are called sequentially whenever someone calls the corresponding
> security hook. However, security_inode_init_security() and
> security_old_inode_init_security() are currently limited to support one=

> xattr provided by LSM and one by EVM.

That is correct. At present the only two modules that provide extended
attributes are SELinux and Smack. The LSM infrastructure requires more
change, including change to security_inode_init_security(), before those
modules can be used together.

> In addition, using the call_int_hook() macro causes some issues. Accord=
ing
> to the documentation in include/linux/lsm_hooks.h, it is a legitimate c=
ase
> that an LSM returns -EOPNOTSUPP when it does not want to provide an xat=
tr.
> However, the loop defined in the macro would stop calling subsequent LS=
Ms
> if that happens. In the case of security_old_inode_init_security(), usi=
ng
> the macro would also cause a memory leak due to replacing the *value
> pointer, if multiple LSMs provide an xattr.

As there is no case where there will be multiple providers of hooks for
inode_init_security this isn't an issue.

> From EVM side, the first operation to be done is to change the definiti=
on
> of evm_inode_init_security() to be compatible with the security hook
> definition. Unfortunately, the current definition does not provide enou=
gh
> information for EVM, as it must have visibility of all xattrs provided =
by
> LSMs to correctly calculate the HMAC. This patch set changes the securi=
ty
> hook definition by adding the full array of xattr as a parameter.

Why do you want to call evm_inode_init_security() as a regular LSM hook?
Except for the names evm_inode_init_security() and selinux_inode_init_sec=
urity()
have nothing in common. They do very different things and require differe=
nt
data, as comes out in the patches.

There are evm functions that could be implemented as LSM hooks. I don't t=
hink
this is one of them. There's no point in going overboard.

> Secondly, EVM must know how many elements are in the xattr array. It se=
ems
> that it is not necessary to add another parameter, as all filesystems t=
hat
> define an initxattr function, expect that the last element of the array=20
is
> one with the name field set to NULL. EVM reuses the same assumption.
>
> This patch set has been tested by introducing several instances of a
> TestLSM (some providing an xattr, some not, one with a wrong implementa=
tion
> to see how the LSM infrastructure handles it). The patch is not include=
d
> in this set but it is available here:
>
> https://github.com/robertosassu/linux/commit/0370ff0fbc16e5d63489836a95=
8e65d697f956db
>
> The test, added to ima-evm-utils, is available here:
>
> https://github.com/robertosassu/ima-evm-utils/blob/evm-multiple-lsms-v1=
-devel-v1/tests/evm_multiple_lsms.test
>
> The test takes a UML kernel built by Travis and launches it several tim=
es,
> each time with a different combination of LSMs. After boot, it first ch=
ecks
> that there is an xattr for each LSM providing it, and then calculates t=
he
> HMAC in user space and compares it with the HMAC calculated by EVM in
> kernel space.
>
> A test report can be obtained here:
>
> https://www.travis-ci.com/github/robertosassu/ima-evm-utils/jobs/498699=
540
>
> Lastly, running the test on reiserfs to check
> security_old_inode_init_security(), some issues have been discovered: a=

> free of xattr->name which is not correct after commit 9548906b2bb7 ('xa=
ttr:
> Constify ->name member of "struct xattr"'), and a misalignment with
> security_inode_init_security() (the old version expects the full xattr =
name
> with the security. prefix, the new version just the suffix). The last i=
ssue
> has not been fixed yet.
>
> Roberto Sassu (5):
>   xattr: Complete constify ->name member of "struct xattr"
>   security: Support multiple LSMs implementing the inode_init_security
>     hook
>   security: Pass xattrs allocated by LSMs to the inode_init_security
>     hook
>   evm: Align evm_inode_init_security() definition with LSM
>     infrastructure
>   evm: Support multiple LSMs providing an xattr
>
>  fs/reiserfs/xattr_security.c        |  2 -
>  include/linux/evm.h                 | 21 ++++---
>  include/linux/lsm_hook_defs.h       |  2 +-
>  include/linux/lsm_hooks.h           |  5 +-
>  security/integrity/evm/evm.h        |  2 +
>  security/integrity/evm/evm_crypto.c |  9 ++-
>  security/integrity/evm/evm_main.c   | 35 +++++++----
>  security/security.c                 | 95 +++++++++++++++++++++++------=

>  security/selinux/hooks.c            |  3 +-
>  security/smack/smack_lsm.c          |  4 +-
>  10 files changed, 135 insertions(+), 43 deletions(-)
>

