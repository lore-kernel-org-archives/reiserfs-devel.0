From: Roberto Sassu <roberto.sassu@huaweicloud.com>
Subject: [PATCH v4 0/5] evm: Prepare for moving to the LSM infrastructure
Date: Thu, 10 Nov 2022 10:46:34 +0100
Message-ID: <20221110094639.3086409-1-roberto.sassu@huaweicloud.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-security-module-owner@vger.kernel.org>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: zohar@linux.ibm.com, dmitry.kasatkin@gmail.com, paul@paul-moore.com, jmorris@namei.org, serge@hallyn.com, stephen.smalley.work@gmail.com, eparis@parisplace.org, casey@schaufler-ca.com
Cc: linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org, selinux@vger.kernel.org, reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org, keescook@chromium.org, nicolas.bouchinet@clip-os.org, Roberto Sassu <roberto.sassu@huawei.com>

From: Roberto Sassu <roberto.sassu@huawei.com>

One of the challenges that must be tackled to move IMA and EVM to the LSM
infrastructure is to ensure that EVM is capable to correctly handle
multiple stacked LSMs providing an xattr at file creation. At the moment,
there are few issues that would prevent a correct integration. This patch
set aims at solving them.

From the LSM infrastructure side, the LSM stacking feature added the
possibility of registering multiple implementations of the security hooks,
that are called sequentially whenever someone calls the corresponding
security hook. However, security_inode_init_security() is currently limited
to support one xattr provided by LSM and one by EVM.
security_old_inode_init_security() can only support one xattr due to its
API.

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
hook definition by replacing the name, value and len triple with the xattr
array allocated by security_inode_init_security().

Secondly, given that the place where EVM can fill an xattr is not provided
anymore with the changed definition, EVM must know how many elements are in
the xattr array. EVM can rely on the fact that the xattr array must be
terminated with an element with name field set to NULL. If EVM is moved to
the LSM infrastructure, the infrastructure will provide additional
information.

Casey suggested to use the reservation mechanism currently implemented for
other security blobs, for xattrs. In this way,
security_inode_init_security() can know after LSM initialization how many
slots for xattrs should be allocated, and LSMs know the offset in the
array from where they can start writing xattrs.

One of the problem was that LSMs can decide at run-time, although they
reserved a slot, to not use it (for example because they were not
initialized). Given that the initxattrs() method implemented by filesystems
expect that the array elements are contiguous, they would miss the slots
after the one not being initialized. security_check_compact_xattrs() has
been introduced to overcome this problem and also to check the correctness
of the xattrs provided by the LSMs.

This patch set has been tested by introducing several instances of a
TestLSM (some providing an xattr, some not, one with a wrong implementation
to see how the LSM infrastructure handles it, one providing multiple xattrs
and another providing an xattr but in a disabled state). The patch is not
included in this set but it is available here:

https://github.com/robertosassu/linux/commit/e0eed5b271e44ded36b23713f9a5998810954843

The test, added to ima-evm-utils, is available here:

https://github.com/robertosassu/ima-evm-utils/blob/evm-multiple-lsms-v4-devel-v10/tests/evm_multiple_lsms.test

The test takes a UML kernel built by Github Actions and launches it several
times, each time with a different combination of LSMs. After boot, it first
checks that there is an xattr for each LSM providing it, and then calculates
the HMAC in user space and compares it with the HMAC calculated by EVM in
kernel space.

A test report can be obtained here:

https://github.com/robertosassu/ima-evm-utils/actions/runs/3435348442/jobs/5727609718

The patch set has been tested with both the SElinux and Smack test suites.
Below, there is the summary of the test results:

SELinux Test Suite result (without patches):
Files=73, Tests=1346, 225 wallclock secs ( 0.43 usr  0.23 sys +  6.11 cusr 58.70 csys = 65.47 CPU)

SELinux Test Suite result (with patches):
Files=73, Tests=1346, 225 wallclock secs ( 0.44 usr  0.22 sys +  6.15 cusr 59.94 csys = 66.75 CPU)

Smack Test Suite result (without patches):
95 Passed, 0 Failed, 100% Success rate

Smack Test Suite result (with patches):
95 Passed, 0 Failed, 100% Success rate

The patch set has also been successfully tested with a WIP branch where
IMA/EVM have been moved to the LSM infrastructure. It is available here:

https://github.com/robertosassu/linux/commits/ima-evm-lsms-v1-devel-v8

This is the patch that moves EVM to the LSM infrastructure:

https://github.com/robertosassu/linux/commit/08ceb14a2ddfd334cb9d8703a4e1a86ee721b580

The only trivial changes, after this patch set, would be to allocate one
element less in the xattr array (because EVM will reserve its own xattr),
and to simply remove the call to evm_inode_init_security().

The test report when IMA and EVM are moved to the LSM infrastructure is
available here:

https://github.com/robertosassu/ima-evm-utils/actions/runs/3435500712/jobs/5727933607

Changelog

v3:
- Don't free the xattr name in reiserfs_security_free()
- Don't include fs_data parameter in inode_init_security hook
- Don't change evm_inode_init_security(), as it will be removed if EVM is
  stacked
- Fix inode_init_security hook documentation
- Drop lsm_find_xattr_slot(), use simple xattr reservation mechanism and
  introduce security_check_compact_xattrs() to compact the xattr array
- Don't allocate xattr array if LSMs didn't reserve any xattr
- Return zero if initxattrs() is not provided to
  security_inode_init_security(), -EOPNOTSUPP if value is not provided to
  security_old_inode_init_security()
- Request LSMs to fill xattrs if only value (not the triple) is provided to
  security_old_inode_init_security(), to avoid unnecessary memory
  allocation

v2:
- rewrite selinux_old_inode_init_security() to use
  security_inode_init_security()
- add lbs_xattr field to lsm_blob_sizes structure, to give the ability to
  LSMs to reserve slots in the xattr array (suggested by Casey)
- add new parameter base_slot to inode_init_security hook definition

v1:
- add calls to reiserfs_security_free() and initialize sec->value to NULL
  (suggested by Tetsuo and Mimi)
- change definition of inode_init_security hook, replace the name, value
  and len triple with the xattr array (suggested by Casey)
- introduce lsm_find_xattr_slot() helper for LSMs to find an unused slot in
  the passed xattr array

Roberto Sassu (5):
  reiserfs: Add missing calls to reiserfs_security_free()
  security: Rewrite security_old_inode_init_security()
  security: Allow all LSMs to provide xattrs for inode_init_security
    hook
  evm: Align evm_inode_init_security() definition with LSM
    infrastructure
  evm: Support multiple LSMs providing an xattr

 fs/reiserfs/namei.c                 |   4 +
 fs/reiserfs/xattr_security.c        |   2 +-
 include/linux/evm.h                 |  12 +--
 include/linux/lsm_hook_defs.h       |   3 +-
 include/linux/lsm_hooks.h           |  17 ++--
 security/integrity/evm/evm.h        |   2 +
 security/integrity/evm/evm_crypto.c |   9 +-
 security/integrity/evm/evm_main.c   |  28 ++++--
 security/security.c                 | 132 ++++++++++++++++++++++------
 security/selinux/hooks.c            |  19 ++--
 security/smack/smack_lsm.c          |  26 +++---
 11 files changed, 187 insertions(+), 67 deletions(-)

-- 
2.25.1

