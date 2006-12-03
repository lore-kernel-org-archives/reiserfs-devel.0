From: Laurent Riffard <laurent.riffard@free.fr>
Subject: [PATCH 1/10] Reiser4 for 2.6.18 version 3
Date: Sun, 03 Dec 2006 14:49:55 +0100
Message-ID: <4572D603.7010400@free.fr>
References: <4571D852.3080401@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-30284-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4571D852.3080401@free.fr>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "reiserfs-list@namesys.com" <reiserfs-list@namesys.com>


This is the last reiser4 patch for vanilla kernel from namesys.com 
(http://ftp.namesys.com/pub/reiser4-for-2.6/2.6.18/reiser4-for-2.6.18-3.patch.gz).

---
Documentation/Changes                         |   12 +
Documentation/filesystems/reiser4.txt         |   75 +
arch/i386/lib/usercopy.c                      |    2 +
fs/Kconfig                                    |    2 +
fs/Makefile                                   |    1 +
fs/fs-writeback.c                             |   26 +-
fs/reiser4/Kconfig                            |   31 +
fs/reiser4/Makefile                           |  100 +
fs/reiser4/README                             |  125 +
fs/reiser4/as_ops.c                           |  391 +++
fs/reiser4/block_alloc.c                      | 1139 ++++++++
fs/reiser4/block_alloc.h                      |  175 ++
fs/reiser4/blocknrset.c                       |  368 +++
fs/reiser4/carry.c                            | 1381 +++++++++
fs/reiser4/carry.h                            |  442 +++
fs/reiser4/carry_ops.c                        | 2103 ++++++++++++++
fs/reiser4/carry_ops.h                        |   42 +
fs/reiser4/context.c                          |  278 ++
fs/reiser4/context.h                          |  228 ++
fs/reiser4/coord.c                            |  937 ++++++
fs/reiser4/coord.h                            |  389 +++
fs/reiser4/debug.c                            |  300 ++
fs/reiser4/debug.h                            |  350 +++
fs/reiser4/dformat.h                          |   71 +
fs/reiser4/dscale.c                           |  174 ++
fs/reiser4/dscale.h                           |   27 +
fs/reiser4/entd.c                             |  354 +++
fs/reiser4/entd.h                             |   90 +
fs/reiser4/eottl.c                            |  510 ++++
fs/reiser4/estimate.c                         |  111 +
fs/reiser4/export_ops.c                       |  296 ++
fs/reiser4/flush.c                            | 3626 +++++++++++++++++++++++
fs/reiser4/flush.h                            |  274 ++
fs/reiser4/flush_queue.c                      |  681 +++++
fs/reiser4/forward.h                          |  258 ++
fs/reiser4/fsdata.c                           |  803 ++++++
fs/reiser4/fsdata.h                           |  218 ++
fs/reiser4/init_super.c                       |  739 +++++
fs/reiser4/inode.c                            |  727 +++++
fs/reiser4/inode.h                            |  430 +++
fs/reiser4/ioctl.h                            |   41 +
fs/reiser4/jnode.c                            | 1922 +++++++++++++
fs/reiser4/jnode.h                            |  707 +++++
fs/reiser4/kassign.c                          |  659 +++++
fs/reiser4/kassign.h                          |  110 +
fs/reiser4/key.c                              |  137 +
fs/reiser4/key.h                              |  384 +++
fs/reiser4/ktxnmgrd.c                         |  214 ++
fs/reiser4/ktxnmgrd.h                         |   52 +
fs/reiser4/lock.c                             | 1261 ++++++++
fs/reiser4/lock.h                             |  272 ++
fs/reiser4/oid.c                              |  141 +
fs/reiser4/page_cache.c                       |  712 +++++
fs/reiser4/page_cache.h                       |   62 +
fs/reiser4/plugin/Makefile                    |   26 +
fs/reiser4/plugin/cluster.c                   |   66 +
fs/reiser4/plugin/cluster.h                   |  315 ++
fs/reiser4/plugin/compress/Makefile           |    6 +
fs/reiser4/plugin/compress/compress.c         |  370 +++
fs/reiser4/plugin/compress/compress.h         |   38 +
fs/reiser4/plugin/compress/compress_mode.c    |  163 ++
fs/reiser4/plugin/compress/lzoconf.h          |  420 +++
fs/reiser4/plugin/compress/minilzo.c          | 2155 ++++++++++++++
fs/reiser4/plugin/compress/minilzo.h          |   94 +
fs/reiser4/plugin/crypto/cipher.c             |  116 +
fs/reiser4/plugin/crypto/cipher.h             |   67 +
fs/reiser4/plugin/crypto/digest.c             |   58 +
fs/reiser4/plugin/dir/Makefile                |    5 +
fs/reiser4/plugin/dir/dir.h                   |   36 +
fs/reiser4/plugin/dir/hashed_dir.c            |   81 +
fs/reiser4/plugin/dir/seekable_dir.c          |   46 +
fs/reiser4/plugin/dir_plugin_common.c         |  864 ++++++
fs/reiser4/plugin/disk_format/Makefile        |    5 +
fs/reiser4/plugin/disk_format/disk_format.c   |   37 +
fs/reiser4/plugin/disk_format/disk_format.h   |   27 +
fs/reiser4/plugin/disk_format/disk_format40.c |  556 ++++
fs/reiser4/plugin/disk_format/disk_format40.h |   99 +
fs/reiser4/plugin/fibration.c                 |  174 ++
fs/reiser4/plugin/fibration.h                 |   37 +
fs/reiser4/plugin/file/Makefile               |    7 +
fs/reiser4/plugin/file/cryptcompress.c        | 3819 +++++++++++++++++++++++++
fs/reiser4/plugin/file/cryptcompress.h        |  549 ++++
fs/reiser4/plugin/file/file.c                 | 2713 ++++++++++++++++++
fs/reiser4/plugin/file/file.h                 |  257 ++
fs/reiser4/plugin/file/invert.c               |  493 ++++
fs/reiser4/plugin/file/symfile.c              |   87 +
fs/reiser4/plugin/file/symlink.c              |   92 +
fs/reiser4/plugin/file/tail_conversion.c      |  728 +++++
fs/reiser4/plugin/file_ops.c                  |  167 ++
fs/reiser4/plugin/file_ops_readdir.c          |  655 +++++
fs/reiser4/plugin/file_plugin_common.c        |  929 ++++++
fs/reiser4/plugin/hash.c                      |  350 +++
fs/reiser4/plugin/inode_ops.c                 |  886 ++++++
fs/reiser4/plugin/inode_ops_rename.c          |  904 ++++++
fs/reiser4/plugin/item/Makefile               |   18 +
fs/reiser4/plugin/item/acl.h                  |   66 +
fs/reiser4/plugin/item/blackbox.c             |  142 +
fs/reiser4/plugin/item/blackbox.h             |   33 +
fs/reiser4/plugin/item/cde.c                  | 1007 +++++++
fs/reiser4/plugin/item/cde.h                  |   87 +
fs/reiser4/plugin/item/ctail.c                | 1588 ++++++++++
fs/reiser4/plugin/item/ctail.h                |   89 +
fs/reiser4/plugin/item/extent.c               |  197 ++
fs/reiser4/plugin/item/extent.h               |  228 ++
fs/reiser4/plugin/item/extent_file_ops.c      | 1710 +++++++++++
fs/reiser4/plugin/item/extent_flush_ops.c     | 1018 +++++++
fs/reiser4/plugin/item/extent_item_ops.c      |  882 ++++++
fs/reiser4/plugin/item/internal.c             |  392 +++
fs/reiser4/plugin/item/internal.h             |   57 +
fs/reiser4/plugin/item/item.c                 |  727 +++++
fs/reiser4/plugin/item/item.h                 |  399 +++
fs/reiser4/plugin/item/sde.c                  |  190 ++
fs/reiser4/plugin/item/sde.h                  |   66 +
fs/reiser4/plugin/item/static_stat.c          | 1040 +++++++
fs/reiser4/plugin/item/static_stat.h          |  219 ++
fs/reiser4/plugin/item/tail.c                 |  805 ++++++
fs/reiser4/plugin/item/tail.h                 |   58 +
fs/reiser4/plugin/node/Makefile               |    5 +
fs/reiser4/plugin/node/node.c                 |  131 +
fs/reiser4/plugin/node/node.h                 |  272 ++
fs/reiser4/plugin/node/node40.c               | 2924 +++++++++++++++++++
fs/reiser4/plugin/node/node40.h               |  125 +
fs/reiser4/plugin/object.c                    |  501 ++++
fs/reiser4/plugin/object.h                    |  121 +
fs/reiser4/plugin/plugin.c                    |  535 ++++
fs/reiser4/plugin/plugin.h                    |  935 ++++++
fs/reiser4/plugin/plugin_header.h             |  136 +
fs/reiser4/plugin/plugin_set.c                |  378 +++
fs/reiser4/plugin/plugin_set.h                |   82 +
fs/reiser4/plugin/regular.c                   |   44 +
fs/reiser4/plugin/security/Makefile           |    4 +
fs/reiser4/plugin/security/perm.c             |   44 +
fs/reiser4/plugin/security/perm.h             |   82 +
fs/reiser4/plugin/space/Makefile              |    4 +
fs/reiser4/plugin/space/bitmap.c              | 1592 +++++++++++
fs/reiser4/plugin/space/bitmap.h              |   47 +
fs/reiser4/plugin/space/space_allocator.h     |   80 +
fs/reiser4/plugin/tail_policy.c               |  113 +
fs/reiser4/pool.c                             |  236 ++
fs/reiser4/pool.h                             |   54 +
fs/reiser4/readahead.c                        |  138 +
fs/reiser4/readahead.h                        |   48 +
fs/reiser4/reiser4.h                          |  276 ++
fs/reiser4/safe_link.c                        |  351 +++
fs/reiser4/safe_link.h                        |   29 +
fs/reiser4/seal.c                             |  217 ++
fs/reiser4/seal.h                             |   49 +
fs/reiser4/search.c                           | 1611 +++++++++++
fs/reiser4/status_flags.c                     |  176 ++
fs/reiser4/status_flags.h                     |   43 +
fs/reiser4/super.c                            |  313 ++
fs/reiser4/super.h                            |  467 +++
fs/reiser4/super_ops.c                        |  724 +++++
fs/reiser4/tap.c                              |  377 +++
fs/reiser4/tap.h                              |   69 +
fs/reiser4/tree.c                             | 1875 ++++++++++++
fs/reiser4/tree.h                             |  579 ++++
fs/reiser4/tree_mod.c                         |  383 +++
fs/reiser4/tree_mod.h                         |   29 +
fs/reiser4/tree_walk.c                        |  926 ++++++
fs/reiser4/tree_walk.h                        |  125 +
fs/reiser4/txnmgr.c                           | 3158 ++++++++++++++++++++
fs/reiser4/txnmgr.h                           |  703 +++++
fs/reiser4/type_safe_hash.h                   |  320 +++
fs/reiser4/vfs_ops.c                          |  267 ++
fs/reiser4/vfs_ops.h                          |   58 +
fs/reiser4/wander.c                           | 1799 ++++++++++++
fs/reiser4/wander.h                           |  135 +
fs/reiser4/writeout.h                         |   21 +
fs/reiser4/znode.c                            | 1028 +++++++
fs/reiser4/znode.h                            |  434 +++
include/linux/fs.h                            |    3 +
lib/radix-tree.c                              |    1 +
mm/filemap.c                                  |    5 +
mm/readahead.c                                |    1 +
175 files changed, 79648 insertions(+), 10 deletions(-)


Since this patch is really big, it is available from 
http://laurent.riffard.free.fr/reiser4/reiser4-for-2.6.18-3-for-2.6.19.patch.gz
[597 kiB].

-- 1.4.4.1.gaed4 

