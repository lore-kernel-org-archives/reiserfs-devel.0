From: Zhang Yi <yi.zhang@huawei.com>
Subject: [PATCH v2 00/14] fs/buffer: remove ll_rw_block()
Date: Thu, 1 Sep 2022 21:34:51 +0800
Message-ID: <20220901133505.2510834-1-yi.zhang@huawei.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <reiserfs-devel-owner@vger.kernel.org>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-ext4@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, cluster-devel@redhat.com, ntfs3@lists.linux.dev, ocfs2-devel@oss.oracle.com, reiserfs-devel@vger.kernel.org, jack@suse.cz
Cc: tytso@mit.edu, akpm@linux-foundation.org, axboe@kernel.dk, viro@zeniv.linux.org.uk, rpeterso@redhat.com, agruenba@redhat.com, almaz.alexandrovich@paragon-software.com, mark@fasheh.com, dushistov@mail.ru, hch@infradead.org, yi.zhang@huawei.com, chengzhihao1@huawei.com, yukuai3@huawei.com

Changes since v1:
 - Remove redundant uptodate check in __bh_read(), use
   bh_uptodate_or_lock() in bh_read() and bh_read_nowait().
 - Improve the lock order in __bh_read_batch().
 - Add return value 1 to bh_read(), indicate the buffer has been
   already uptodate and no need to submit read IO, ext2 code in patch
   13 need to know this case.
 - Remove bh_read_locked() helper.
 - Exchange the parameter sequence of bhs[] array and it's number in
   bh_read[*]_batch() helpers.

v1: https://lore.kernel.org/linux-fsdevel/20220831072111.3569680-1-yi.zhang@huawei.com/T/#t

Thanks,
Yi.

ll_rw_block() will skip locked buffer before submitting IO, it assumes
that locked buffer means it is under IO. This assumption is not always
true because we cannot guarantee every buffer lock path would submit
IO. After commit 88dbcbb3a484 ("blkdev: avoid migration stalls for
blkdev pages"), buffer_migrate_folio_norefs() becomes one exceptional
case, and there may be others. So ll_rw_block() is not safe on the sync
read path, we could get false positive EIO return value when filesystem
reading metadata. It seems that it could be only used on the readahead
path.

Unfortunately, many filesystem misuse the ll_rw_block() on the sync read
path. This patch set just remove ll_rw_block() and add new friendly
helpers, which could prevent false positive EIO on the read metadata
path. Thanks for the suggestion from Jan, the original discussion is at
[1].

 patch 1: remove unused helpers in fs/buffer.c
 patch 2: add new bh_read_[*] helpers
 patch 3-11: remove all ll_rw_block() calls in filesystems
 patch 12-14: do some leftover cleanups.

[1]. https://lore.kernel.org/linux-mm/20220825080146.2021641-1-chengzhihao1@huawei.com/

Zhang Yi (14):
  fs/buffer: remove __breadahead_gfp()
  fs/buffer: add some new buffer read helpers
  fs/buffer: replace ll_rw_block()
  gfs2: replace ll_rw_block()
  isofs: replace ll_rw_block()
  jbd2: replace ll_rw_block()
  ntfs3: replace ll_rw_block()
  ocfs2: replace ll_rw_block()
  reiserfs: replace ll_rw_block()
  udf: replace ll_rw_block()
  ufs: replace ll_rw_block()
  fs/buffer: remove ll_rw_block() helper
  ext2: replace bh_submit_read() helper with bh_read_locked()
  fs/buffer: remove bh_submit_read() helper

 fs/buffer.c                 | 154 +++++++++++++++---------------------
 fs/ext2/balloc.c            |   7 +-
 fs/gfs2/meta_io.c           |   7 +-
 fs/gfs2/quota.c             |   8 +-
 fs/isofs/compress.c         |   2 +-
 fs/jbd2/journal.c           |  15 ++--
 fs/jbd2/recovery.c          |  16 ++--
 fs/ntfs3/inode.c            |   7 +-
 fs/ocfs2/aops.c             |   2 +-
 fs/ocfs2/super.c            |   4 +-
 fs/reiserfs/journal.c       |  11 +--
 fs/reiserfs/stree.c         |   4 +-
 fs/reiserfs/super.c         |   4 +-
 fs/udf/dir.c                |   2 +-
 fs/udf/directory.c          |   2 +-
 fs/udf/inode.c              |   8 +-
 fs/ufs/balloc.c             |  12 +--
 include/linux/buffer_head.h |  48 ++++++++---
 18 files changed, 146 insertions(+), 167 deletions(-)

-- 
2.31.1

