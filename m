From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: [PATCHv5 00/10] reiser4: batch discard support (FITRIM ioctl): initial implementation.
Date: Fri, 13 Feb 2015 03:48:09 +0300
Message-ID: <1423788499-30430-1-git-send-email-intelfx100@gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id;
        bh=BVE81Mwuj07vj8G1qKAjnS4rgDEDx9CfAWBxyl/aZsM=;
        b=t6zADT7IE0AqM1awUzmfl2NrWW3ODy7xCHU4iJb1kCUuqDqCs2l3RBZXCN6nsgd0Gm
         UOw6bdpr5MzpJ/330sOISWr79a8sww9EoASBnEKJqLtcGvp77dVv7s9+a84Fol+NXyqM
         +AVZsIQJv41AZSDLeN4I3luM4n40yBarDv4lp0YNBQEfZBvcwHElUsrT71rdzuDjcgNr
         jKpCyiQQj1mbaIPc5G5sB30o+TMSsgMqZjum9onD7jbEEu7M2LpO5/uNJ/3rP83ykVOw
         mEE0mM7OBNTy0/Rp/k3xf/TdCiXXG5DESxoGZoA2MuKh93nOnsrD/ZrmFRE/RrWugnmt
         scdA==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org
Cc: Ivan Shapovalov <intelfx100@gmail.com>

This patch series implements FITRIM ioctl support in reiser4.

The FITRIM ioctl is supposed to be applied to any directory inside the target
filesystem. At least, this can be deduced from `fstrim` utility behavior on
mainstream filesystems (e. g. ext2/3/4).

The idea of implementation is per Edward's advices: FITRIM handler iteratively
grabs a portion of disk space, sequentially allocates extents within grabbed
space and commits the resulting atom. This way we avoid starving concurrent
processes of the disk space. This process is repeated until the partition has
been fully scanned and processed.

Points I'm really uncertain of:
- creation of empty atoms (reiser4_create_atom())
- handling of empty atoms in commit_current_atom()

v2: - fix PATCH 5/7 "reiser4: txnmgr: call reiser4_post_write_back_hook() for empty atoms."
      * fix a typo
      * release atom spinlock before calling reiser4_post_write_back_hook()

v3: - use bitwise shift instead of integer division by 4 to calculate 25%
    - honor "minlen" of ioctl parameters (minimal extent length to consider for discarding)
    - fix a stupidity in reiser4_trim_fs() (two local variables holding the same superblock pointer)

v4: - refactor BA_SOME_SPACE implementation, fix calculation of space-to-grab if !BA_RESERVED
    - rename reiser4_blocknr_hint's "forward" to "monotonic_forward"
    - move free space accounting by pre-commit hook to block_alloc.c
    - explain BA_DEFER flag behavior in comments
    - fix "minlen" addition to alloc_blocks_forward() (use minlen in both calls)
    - refactor (equivalent at this time ;)) reiser4_trim_fs()
    - move "capture_count == 0" shortcut in commit_current_atom() below
      current_atom_complete_writes() in order to finish the atom's flush_queues

v5: - return -ENOTTY instead of -ENOSYS in the unsupported ioctl path
      of reiser4_ioctl_dir_common()

Ivan Shapovalov (10):
  reiser4: block_alloc: add BA_SOME_SPACE flag for grabbing a fixed amount of space.
  reiser4: block_alloc: add a "monotonic_forward" parameter to reiser4_blocknr_hint to allocate blocks only in forward direction.
  reiser4: block_alloc: move block accounting by pre-commit hook into block_alloc.c and document BA_DEFER behavior.
  reiser4: txnmgr: free allocated but unneeded atom in atom_begin_and_assign_to_txnh().
  reiser4: txnmgr: add reiser4_create_atom() which creates an empty atom without capturing any nodes.
  reiser4: txnmgr: move "empty atom" shortcut slightly below.
  reiser4: batch discard support: add a dummy FITRIM ioctl handler for directories.
  reiser4: batch discard support: actually implement the FITRIM ioctl handler.
  reiser4: block_alloc: add a "min_len" parameter to reiser4_blocknr_hint to limit allocated extent length from below.
  reiser4: batch discard support: honor minimal extent length passed from the userspace.

 fs/reiser4/block_alloc.c         |  66 +++++++++++++++++--
 fs/reiser4/block_alloc.h         |  12 +++-
 fs/reiser4/plugin/dir/dir.h      |   2 +
 fs/reiser4/plugin/file_ops.c     |  62 ++++++++++++++++++
 fs/reiser4/plugin/object.c       |   6 +-
 fs/reiser4/plugin/space/bitmap.c |  53 +++++++---------
 fs/reiser4/super_ops.c           | 134 +++++++++++++++++++++++++++++++++++++++
 fs/reiser4/txnmgr.c              |  57 +++++++++++------
 fs/reiser4/txnmgr.h              |   2 +
 9 files changed, 336 insertions(+), 58 deletions(-)

-- 
2.3.0

