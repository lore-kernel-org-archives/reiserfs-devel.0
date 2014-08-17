From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: [RFC] [PATCHv2 0/7] reiser4: batch discard support (FITRIM ioctl): initial implementation.
Date: Sun, 17 Aug 2014 20:26:28 +0400
Message-ID: <1408292795-1841-1-git-send-email-intelfx100@gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id;
        bh=tBX/XGU6mO228sHhTt6Vw7aHhWsYc4fltjtYDzq9KL0=;
        b=AcUDZTfolVcyw3Ow/zJr4YSkTDvfgLTO9+zOycm7MXGZPAm7UUKkS4s+FjxCU8Skb2
         9THvrEywc1rfwLt//ZExdTztDTa/67x6wBXzOokd+SjaHFFuD/LI60JzFU7uRq4TYLIg
         mWHs0sgr/UwSC/LPx+ZoUj03dr5hDiS5OHh232L+hQUT3HpHPRmTBjAv/gTY10ArHIrB
         DTLNDEEg+vn0cV42YH3odJYRGQRrzrW2gL9XG3PDbfFYrWA1roqwa8OwPYc2GpAJaDzC
         VhTq6dhmdyKYnWkGP08aPNPwaj554nwyfT6kOha4y2OHI5qxiwY1SdstdBOTa7e2f2YD
         8K5Q==
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

Ivan Shapovalov (7):
  reiser4: block_alloc: add BA_SOME_SPACE flag for grabbing a fixed amount of space.
  reiser4: block_alloc: add a "forward" parameter to reiser4_blocknr_hint to allocate blocks only in forward direction.
  reiser4: txnmgr: free allocated but unneeded atom in atom_begin_and_assign_to_txnh().
  reiser4: txnmgr: add reiser4_create_atom() which creates an empty atom without capturing any nodes.
  reiser4: txnmgr: call reiser4_post_write_back_hook() for empty atoms.
  reiser4: batch discard support: add a dummy FITRIM ioctl handler for directories.
  reiser4: batch discard support: actually implement the FITRIM ioctl handler.

 fs/reiser4/block_alloc.c         |   6 ++
 fs/reiser4/block_alloc.h         |  10 ++-
 fs/reiser4/plugin/dir/dir.h      |   2 +
 fs/reiser4/plugin/file_ops.c     |  62 ++++++++++++++++++
 fs/reiser4/plugin/object.c       |   6 +-
 fs/reiser4/plugin/space/bitmap.c |   3 +-
 fs/reiser4/super_ops.c           | 131 +++++++++++++++++++++++++++++++++++++++
 fs/reiser4/txnmgr.c              |  57 +++++++++++------
 fs/reiser4/txnmgr.h              |   2 +
 9 files changed, 255 insertions(+), 24 deletions(-)

-- 
2.0.4

