From: Roberto Sassu <roberto.sassu@huaweicloud.com>
Subject: [PATCH v7 0/6] evm: Do HMAC of multiple per LSM xattrs for new inodes
Date: Thu,  1 Dec 2022 11:41:19 +0100
Message-ID: <20221201104125.919483-1-roberto.sassu@huaweicloud.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-security-module-owner@vger.kernel.org>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: mark@fasheh.com, jlbec@evilplan.org, joseph.qi@linux.alibaba.com, zohar@linux.ibm.com, dmitry.kasatkin@gmail.com, paul@paul-moore.com, jmorris@namei.org, serge@hallyn.com, stephen.smalley.work@gmail.com, eparis@parisplace.org, casey@schaufler-ca.com
Cc: ocfs2-devel@oss.oracle.com, reiserfs-devel@vger.kernel.org, linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org, selinux@vger.kernel.org, linux-kernel@vger.kernel.org, keescook@chromium.org, nicolas.bouchinet@clip-os.org, Roberto Sassu <roberto.sassu@huawei.com>

From: Roberto Sassu <roberto.sassu@huawei.com>

One of the major goals of LSM stacking is to run multiple LSMs side by side
without interfering with each other. The ultimate decision will depend on
individual LSM decision.

Several changes need to be made to the LSM infrastructure to be able to
support that. This patch set tackles one of them: gives to each LSM the
ability to specify one or multiple xattrs to be set at inode creation
time and, at the same time, gives to EVM the ability to access all those
xattrs and calculate the HMAC on them.

The first problem that this patch set addresses is to make the
inode_init_security hook definition suitable to use with EVM which, unlike
other LSMs, needs to have visibility of all xattrs and not only the one
that the LSM infrastructure passes to the LSM to be set.

The solution is to replace in the inode_init_security definition the
name/value/len parameters with the beginning of the array containing all
xattrs set by LSMs. Due to security_old_inode_init_security() API
limitation of setting only one xattr, it has been dropped and the remaining
users, ocfs2 and reiserfs, switch to security_inode_init_security().
However, due to the complexity of the changes required to fully exploit the
ability of security_inode_init_security() to set multiple xattrs, those
users can still set only one xattr (the first set in the xattr array) where
previously they called security_old_inode_init_security().

Furthermore, while EVM is invoked unlike before, its xattr will not be set
as it would not be the first set in the xattr array, or if it is the first,
there would not be protected xattrs to calculate the HMAC on.

The second problem this patch set addresses is the limitation of the
call_int_hook() of stopping the loop when the return value from a hook
implementation is not zero. Unfortunately, for the inode_init_security hook
it is a legitimate case to return -EOPNOTSUPP, but this would not
necessarily mean that there is an error to report to the LSM infrastructure
but just that an LSM does not will to set an xattr. Other LSMs should be
still consulted as well.

The solution for this specific case is to replace the call_int_hook() with
the loop itself, so that -EOPNOTSUPP can be ignored.

Next, this patch set removes the limitation of creating only two xattrs,
one by an active LSM and another by EVM. This patch set extends the
reservation mechanism of the LSM infrastructure, to allow each LSM to
request one or multiple xattrs. While this could potentially lead to
reaching the filesystem limits of number/size of the xattrs, it seems not
an issue that need to be solved by the LSM infrastructure but by the
filesystems themselves. Currently, if the limit is reached, the only
workaround would be to use fewer LSMs.

The reservation mechanism concept makes it very easy for LSMs to position
themselves correctly in the xattr array, as the LSM infrastructure at
initialization time changes the number of xattrs requested by each LSM with
an offset. LSMs can just take that offset as the starting index in the
xattr array and fill the next slots depending on how many xattrs they
requested.

However, while this concept is intuitive, it needs extra care. While for
security blobs (the main reason of the reservation mechanism) it is not
relevant for an LSM if other LSMs filled their portion, it matters for
xattrs, as both EVM and initxattrs() callbacks scan the entire array until
a terminator (xattr with NULL name). If an LSM did not provide an xattr,
which could happen if it is loaded but not initialized, consumers of the
xattr array would stop prematurely.

This patch set avoids this problem by compacting the xattr array each time
after an LSM executed its implementation of the inode_init_security hook.
It needs to be done after each LSM, and not after all, since there might be
LSMs scanning that xattr array too. Compacting the array after all LSMs
would be too late.

Finally, this patch set modifies the evm_inode_init_security() definition
to be compatible with the inode_init_security hook definition and adds
support for scanning the whole xattr array and for calculating the HMAC
on all xattrs provided by LSMs.

This patch set has been tested by introducing several instances of a
TestLSM (some providing an xattr, some not, one with a wrong implementation
to see how the LSM infrastructure handles it, one providing multiple xattrs
and another providing an xattr but in a disabled state). The patch is not
included in this set but it is available here:

https://github.com/robertosassu/linux/commit/e13a03236df0c399dccb73df5fe4cfceb4bb1d89

The test, added to ima-evm-utils, is available here:

https://github.com/robertosassu/ima-evm-utils/blob/evm-multiple-lsms-v5-devel-v3/tests/evm_multiple_lsms.test

The test takes a UML kernel built by Github Actions and launches it several
times, each time with a different combination of LSMs and filesystems (ext4,
reiserfs, ocfs2). After boot, it first checks that there is an xattr for each
LSM providing it (for reiserfs and ocfs2 just the first LSM), and then (for
ext4) calculates the HMAC in user space and compares it with the HMAC
calculated by EVM in kernel space.

A test report can be obtained here:

https://github.com/robertosassu/ima-evm-utils/actions/runs/3525619568/jobs/5912560168

The patch set has been tested with both the SElinux and Smack test suites.
Below, there is the summary of the test results:

SELinux Test Suite result (without patches):
Files=73, Tests=1346, 225 wallclock secs ( 0.43 usr  0.23 sys +  6.11 cusr 58.70 csys = 65.47 CPU)
Result: FAIL
Failed 4/73 test programs. 13/1346 subtests failed.

SELinux Test Suite result (with patches):
Files=73, Tests=1346, 225 wallclock secs ( 0.44 usr  0.22 sys +  6.15 cusr 59.94 csys = 66.75 CPU)
Result: FAIL
Failed 4/73 test programs. 13/1346 subtests failed.

Smack Test Suite result (without patches):
95 Passed, 0 Failed, 100% Success rate

Smack Test Suite result (with patches):
95 Passed, 0 Failed, 100% Success rate

Changelog

v6:
- Add a comment in Smack to introduce its xattrs (suggested by Casey)
- Document the overloaded meaning of -EOPNOTSUPP in
  security_inode_init_security() (suggested by Mimi)

v5:
- Modify the cover letter to explain that the goal of this patch set is
  supporting multiple per LSM xattrs in EVM, and not moving IMA and EVM to
  the LSM infrastructure (suggested by Mimi)
- Remove references in the patches description about moving IMA and EVM
  to the LSM infrastructure (suggested by Mimi)
- Explain that the additional EVM invocation due to the switch to
  security_inode_init_security() will not cause the EVM xattr to be added
  (suggested by Mimi)

v4:
- Remove patch to call reiserfs_security_free(), already queued
- Switch ocfs2 and reiserfs to security_inode_init_security() (suggested by
  Mimi)
- Remove security_old_inode_init_security() (suggested by Paul)
- Rename security_check_compact_xattrs() to
  security_check_compact_filled_xattrs() and add function description
  (suggested by Mimi)
- Rename checked_xattrs parameter of security_check_compact_filled_xattrs()
  to num_filled_xattrs (suggested by Mimi)
- Rename cur_xattrs variable in security_inode_init_security() to
  num_filled_xattrs (suggested by Mimi)

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

Roberto Sassu (6):
  reiserfs: Switch to security_inode_init_security()
  ocfs2: Switch to security_inode_init_security()
  security: Remove security_old_inode_init_security()
  security: Allow all LSMs to provide xattrs for inode_init_security
    hook
  evm: Align evm_inode_init_security() definition with LSM
    infrastructure
  evm: Support multiple LSMs providing an xattr

 fs/ocfs2/namei.c                    |  18 ++---
 fs/ocfs2/xattr.c                    |  30 ++++++-
 fs/reiserfs/xattr_security.c        |  23 ++++--
 include/linux/evm.h                 |  12 +--
 include/linux/lsm_hook_defs.h       |   3 +-
 include/linux/lsm_hooks.h           |  17 ++--
 include/linux/security.h            |  12 ---
 security/integrity/evm/evm.h        |   2 +
 security/integrity/evm/evm_crypto.c |   9 ++-
 security/integrity/evm/evm_main.c   |  28 +++++--
 security/security.c                 | 121 +++++++++++++++++++++-------
 security/selinux/hooks.c            |  19 +++--
 security/smack/smack_lsm.c          |  33 +++++---
 13 files changed, 226 insertions(+), 101 deletions(-)

-- 
2.25.1

