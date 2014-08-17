From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: [RFC] [PATCHv3 0/9] reiser4: batch discard support (FITRIM ioctl): initial implementation.
Date: Mon, 18 Aug 2014 01:52:50 +0400
Message-ID: <1408312379-1990-1-git-send-email-intelfx100@gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id;
        bh=gAkE8PGG9WJUwM25cykGahCVTj71S1sSK5BDcRymjFA=;
        b=MVS/0lUh9Jw508p58WSklxHwTaZiNCzQ/7uHnWr7YzRF5zv3pVCclBDZTKauTIZOc0
         28CSG9+TT2yBIEUdFjHlefDIDzvHSsB2CRcXWjqq8DdWxVNEhmhb/pMfQJDDoPTWs6RD
         M144EEwtAoxQe/BDpM7o3J4zYu2Ma+OQ7JJtgTrN0U9ORnKhxtcrhCa9RCfQeZQMq2zj
         rF/mrnDGOpWhYQoTxZr0gC1VO6tUpjJARnWyEv9eK24jenltQ377Khg46CEo2kzl+hwP
         LSZrhRwWrWgYvg01RkyfFilUPa21Q1tBu5YNrEnccq0k0hsQhvj9NR2gv2+pYKUT+AEs
         VhNg==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org
Cc: edward.shishkin@gmail.com, Ivan Shapovalov <intelfx100@gmail.com>

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
- grabbing fixed amount of space (new BA_SOME_SPACE flag, grabs 25% of disk space)
- creation of empty atoms (reiser4_create_atom())
- handling of empty atoms in commit_current_atom()

v2: - fix PATCH 5/7 "reiser4: txnmgr: call reiser4_post_write_back_hook() for empty atoms."
      * fix a typo
      * release atom spinlock before calling reiser4_post_write_back_hook()

v3: - use bitwise shift instead of integer division by 4 to calculate 25%
    - honor "minlen" of ioctl parameters (minimal extent length to consider for discarding)
    - fix a stupidity in reiser4_trim_fs() (two local variables holding the same superblock pointer)

Ivan Shapovalov (9):
  reiser4: block_alloc: add BA_SOME_SPACE flag for grabbing a fixed amount of space.
  reiser4: block_alloc: add a "forward" parameter to reiser4_blocknr_hint to allocate blocks only in forward direction.
  reiser4: txnmgr: free allocated but unneeded atom in atom_begin_and_assign_to_txnh().
  reiser4: txnmgr: add reiser4_create_atom() which creates an empty atom without capturing any nodes.
  reiser4: txnmgr: call reiser4_post_write_back_hook() for empty atoms.
  reiser4: batch discard support: add a dummy FITRIM ioctl handler for directories.
  reiser4: batch discard support: actually implement the FITRIM ioctl handler.
  reiser4: block_alloc: add a "min_len" parameter to reiser4_blocknr_hint to limit allocated extent length from below.
  reiser4: batch discard support: honor minimal extent length passed from the userspace.

 fs/reiser4/block_alloc.c         |   5 ++
 fs/reiser4/block_alloc.h         |  12 +++-
 fs/reiser4/plugin/dir/dir.h      |   2 +
 fs/reiser4/plugin/file_ops.c     |  62 +++++++++++++++++++
 fs/reiser4/plugin/object.c       |   6 +-
 fs/reiser4/plugin/space/bitmap.c |  21 +++++--
 fs/reiser4/super_ops.c           | 126 +++++++++++++++++++++++++++++++++++++++
 fs/reiser4/txnmgr.c              |  57 ++++++++++++------
 fs/reiser4/txnmgr.h              |   2 +
 9 files changed, 265 insertions(+), 28 deletions(-)

-- 
2.0.4

