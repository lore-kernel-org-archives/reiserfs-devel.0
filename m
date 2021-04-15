From: Roberto Sassu <roberto.sassu@huawei.com>
Subject: [PATCH 0/5] evm: Prepare for moving to the LSM infrastructure
Date: Thu, 15 Apr 2021 12:04:30 +0200
Message-ID: <20210415100435.18619-1-roberto.sassu@huawei.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <reiserfs-devel-owner@vger.kernel.org>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: zohar@linux.ibm.com, jmorris@namei.org, paul@paul-moore.com, casey@schaufler-ca.com
Cc: linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, selinux@vger.kernel.org, reiserfs-devel@vger.kernel.org, Roberto Sassu <roberto.sassu@huawei.com>

This patch set depends on:

https://lore.kernel.org/linux-integrity/20210409114313.4073-1-roberto.sassu@huawei.com/
https://lore.kernel.org/linux-integrity/20210407105252.30721-1-roberto.sassu@huawei.com/

One of the challenges that must be tackled to move IMA and EVM to the LSM
infrastructure is to ensure that EVM is capable to correctly handle
multiple stacked LSMs providing an xattr at file creation. At the moment,
there are few issues that would prevent a correct integration. This patch
set aims at solving them.

From the LSM infrastructure side, the LSM stacking feature added the
possibility of registering multiple implementations of the security hooks,
that are called sequentially whenever someone calls the corresponding
security hook. However, security_inode_init_security() and
security_old_inode_init_security() are currently limited to support one
xattr provided by LSM and one by EVM.

In addition, using the call_int_hook() macro causes some issues. According
to the documentation in include/linux/lsm_hooks.h, it is a legitimate case
that an LSM returns -EOPNOTSUPP when it does not want to provide an xattr.
However, the loop defined in the macro would stop calling subsequent LSMs
if that happens. In the case of security_old_inode_init_security(), using
the macro would also cause a memory leak due to replacing the *value
pointer, if multiple LSMs provide an xattr.

From EVM side, the first operation to be done is to change the definition
of evm_inode_init_security() to be compatible with the security hook
definition. Unfortunately, the current definition does not provide enough
information for EVM, as it must have visibility of all xattrs provided by
LSMs to correctly calculate the HMAC. This patch set changes the security
hook definition by adding the full array of xattr as a parameter.

Secondly, EVM must know how many elements are in the xattr array. It seems
that it is not necessary to add another parameter, as all filesystems that
define an initxattr function, expect that the last element of the array is
one with the name field set to NULL. EVM reuses the same assumption.

This patch set has been tested by introducing several instances of a
TestLSM (some providing an xattr, some not, one with a wrong implementation
to see how the LSM infrastructure handles it). The patch is not included
in this set but it is available here:

https://github.com/robertosassu/linux/commit/0370ff0fbc16e5d63489836a958e65d697f956db

The test, added to ima-evm-utils, is available here:

https://github.com/robertosassu/ima-evm-utils/blob/evm-multiple-lsms-v1-devel-v1/tests/evm_multiple_lsms.test

The test takes a UML kernel built by Travis and launches it several times,
each time with a different combination of LSMs. After boot, it first checks
that there is an xattr for each LSM providing it, and then calculates the
HMAC in user space and compares it with the HMAC calculated by EVM in
kernel space.

A test report can be obtained here:

https://www.travis-ci.com/github/robertosassu/ima-evm-utils/jobs/498699540

Lastly, running the test on reiserfs to check
security_old_inode_init_security(), some issues have been discovered: a
free of xattr->name which is not correct after commit 9548906b2bb7 ('xattr:
Constify ->name member of "struct xattr"'), and a misalignment with
security_inode_init_security() (the old version expects the full xattr name
with the security. prefix, the new version just the suffix). The last issue
has not been fixed yet.

Roberto Sassu (5):
  xattr: Complete constify ->name member of "struct xattr"
  security: Support multiple LSMs implementing the inode_init_security
    hook
  security: Pass xattrs allocated by LSMs to the inode_init_security
    hook
  evm: Align evm_inode_init_security() definition with LSM
    infrastructure
  evm: Support multiple LSMs providing an xattr

 fs/reiserfs/xattr_security.c        |  2 -
 include/linux/evm.h                 | 21 ++++---
 include/linux/lsm_hook_defs.h       |  2 +-
 include/linux/lsm_hooks.h           |  5 +-
 security/integrity/evm/evm.h        |  2 +
 security/integrity/evm/evm_crypto.c |  9 ++-
 security/integrity/evm/evm_main.c   | 35 +++++++----
 security/security.c                 | 95 +++++++++++++++++++++++------
 security/selinux/hooks.c            |  3 +-
 security/smack/smack_lsm.c          |  4 +-
 10 files changed, 135 insertions(+), 43 deletions(-)

-- 
2.26.2

