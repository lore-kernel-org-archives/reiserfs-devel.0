From: "Hemiplegic Menehune" <Hemiplegic.Menehune@gmail.com>
Subject: reiser4 build warnings due to new -Wundef flags in -rc3-mm2
Date: Wed, 27 Jul 2005 18:59:54 +0100
Message-ID: <dc8i2s$fvh$1@sea.gmane.org>
Reply-To: "Hemiplegic Menehune" <Hemiplegic.Menehune@gmail.com>
Return-path: <reiserfs-list-return-25255-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Sender: news <news@sea.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Hi,

In reiser4 there are a number of warnings caused by the new -Wundef flag in 
the latest -mm kernel:

In file included from fs/reiser4/plugin/plugin.h:26,
                 from fs/reiser4/jnode.h:19,
                 from fs/reiser4/lock.h:16,
                 from fs/reiser4/context.h:15,
                 from fs/reiser4/debug.c:32:
fs/reiser4/plugin/node/node40.h:83:5: warning: "GUESS_EXISTS" is not defined
  CC      fs/reiser4/jnode.o
In file included from fs/reiser4/plugin/plugin.h:26,
                 from fs/reiser4/jnode.c:107:
fs/reiser4/plugin/node/node40.h:83:5: warning: "GUESS_EXISTS" is not defined
  CC      fs/reiser4/znode.o
In file included from fs/reiser4/plugin/plugin.h:26,
                 from fs/reiser4/znode.c:148:
fs/reiser4/plugin/node/node40.h:83:5: warning: "GUESS_EXISTS" is not defined
  CC      fs/reiser4/key.o
In file included from fs/reiser4/plugin/plugin.h:26,
                 from fs/reiser4/tree.h:15,
                 from fs/reiser4/super.h:11,
                 from fs/reiser4/key.c:7:
fs/reiser4/plugin/node/node40.h:83:5: warning: "GUESS_EXISTS" is not defined
  CC      fs/reiser4/pool.o
In file included from fs/reiser4/plugin/plugin.h:26,
                 from fs/reiser4/tree.h:15,
                 from fs/reiser4/super.h:11,
                 from fs/reiser4/pool.c:49:
fs/reiser4/plugin/node/node40.h:83:5: warning: "GUESS_EXISTS" is not defined
  CC      fs/reiser4/tree_mod.o
In file included from fs/reiser4/plugin/plugin.h:26,
                 from fs/reiser4/tree_mod.c:22:
fs/reiser4/plugin/node/node40.h:83:5: warning: "GUESS_EXISTS" is not defined
  CC      fs/reiser4/estimate.o
In file included from fs/reiser4/plugin/plugin.h:26,
                 from fs/reiser4/tree.h:15,
                 from fs/reiser4/estimate.c:5:
fs/reiser4/plugin/node/node40.h:83:5: warning: "GUESS_EXISTS" is not defined
  CC      fs/reiser4/carry.o
In file included from fs/reiser4/plugin/plugin.h:26,
                 from fs/reiser4/jnode.h:19,
                 from fs/reiser4/carry.c:138:
fs/reiser4/plugin/node/node40.h:83:5: warning: "GUESS_EXISTS" is not defined
  CC      fs/reiser4/carry_ops.o
In file included from fs/reiser4/plugin/plugin.h:26,
                 from fs/reiser4/jnode.h:19,
                 from fs/reiser4/carry_ops.c:11:
fs/reiser4/plugin/node/node40.h:83:5: warning: "GUESS_EXISTS" is not defined
  CC      fs/reiser4/lock.o
In file included from fs/reiser4/plugin/plugin.h:26,
                 from fs/reiser4/jnode.h:19,
                 from fs/reiser4/znode.h:17,
                 from fs/reiser4/lock.c:212:
fs/reiser4/plugin/node/node40.h:83:5: warning: "GUESS_EXISTS" is not defined
  CC      fs/reiser4/tree.o
In file included from fs/reiser4/plugin/plugin.h:26,
                 from fs/reiser4/tree.c:179:
fs/reiser4/plugin/node/node40.h:83:5: warning: "GUESS_EXISTS" is not defined
  CC      fs/reiser4/context.o
In file included from fs/reiser4/plugin/plugin.h:26,
                 from fs/reiser4/tree.h:15,
                 from fs/reiser4/super.h:11,
                 from fs/reiser4/context.c:37:
fs/reiser4/plugin/node/node40.h:83:5: warning: "GUESS_EXISTS" is not defined
  CC      fs/reiser4/tap.o
In file included from fs/reiser4/plugin/plugin.h:26,
                 from fs/reiser4/tree.h:15,
                 from fs/reiser4/tap.c:19:
fs/reiser4/plugin/node/node40.h:83:5: warning: "GUESS_EXISTS" is not defined
  CC      fs/reiser4/coord.o
In file included from fs/reiser4/plugin/plugin.h:26,
                 from fs/reiser4/tree.h:15,
                 from fs/reiser4/coord.c:6:
fs/reiser4/plugin/node/node40.h:83:5: warning: "GUESS_EXISTS" is not defined
  CC      fs/reiser4/block_alloc.o
In file included from fs/reiser4/plugin/plugin.h:26,
                 from fs/reiser4/block_alloc.c:5:
fs/reiser4/plugin/node/node40.h:83:5: warning: "GUESS_EXISTS" is not defined
  CC      fs/reiser4/txnmgr.o
In file included from fs/reiser4/plugin/plugin.h:26,
                 from fs/reiser4/jnode.h:19,
                 from fs/reiser4/txnmgr.c:224:
fs/reiser4/plugin/node/node40.h:83:5: warning: "GUESS_EXISTS" is not defined
  CC      fs/reiser4/kassign.o
In file included from fs/reiser4/plugin/plugin.h:26,
                 from fs/reiser4/tree.h:15,
                 from fs/reiser4/super.h:11,
                 from fs/reiser4/vfs_ops.h:15,
                 from fs/reiser4/kassign.c:200:
fs/reiser4/plugin/node/node40.h:83:5: warning: "GUESS_EXISTS" is not defined
  CC      fs/reiser4/flush.o
In file included from fs/reiser4/plugin/plugin.h:26,
                 from fs/reiser4/flush.c:12:
fs/reiser4/plugin/node/node40.h:83:5: warning: "GUESS_EXISTS" is not defined
  CC      fs/reiser4/wander.o
In file included from fs/reiser4/plugin/plugin.h:26,
                 from fs/reiser4/jnode.h:19,
                 from fs/reiser4/wander.c:167:
fs/reiser4/plugin/node/node40.h:83:5: warning: "GUESS_EXISTS" is not defined
  CC      fs/reiser4/eottl.o
In file included from fs/reiser4/plugin/plugin.h:26,
                 from fs/reiser4/jnode.h:19,
                 from fs/reiser4/znode.h:17,
                 from fs/reiser4/eottl.c:9:
fs/reiser4/plugin/node/node40.h:83:5: warning: "GUESS_EXISTS" is not defined
  CC      fs/reiser4/search.o
In file included from fs/reiser4/plugin/plugin.h:26,
                 from fs/reiser4/search.c:12:
fs/reiser4/plugin/node/node40.h:83:5: warning: "GUESS_EXISTS" is not defined
  CC      fs/reiser4/page_cache.o
In file included from fs/reiser4/plugin/plugin.h:26,
                 from fs/reiser4/jnode.h:19,
                 from fs/reiser4/page_cache.c:175:
fs/reiser4/plugin/node/node40.h:83:5: warning: "GUESS_EXISTS" is not defined
  CC      fs/reiser4/kcond.o
  CC      fs/reiser4/seal.o
In file included from fs/reiser4/plugin/plugin.h:26,
                 from fs/reiser4/jnode.h:19,
                 from fs/reiser4/seal.c:42:
fs/reiser4/plugin/node/node40.h:83:5: warning: "GUESS_EXISTS" is not defined
fs/reiser4/seal.c:212:5: warning: "REISER4_DEBUG_OUTPUT" is not defined
  CC      fs/reiser4/dscale.o
  CC      fs/reiser4/flush_queue.o
In file included from fs/reiser4/plugin/plugin.h:26,
                 from fs/reiser4/tree.h:15,
                 from fs/reiser4/super.h:11,
                 from fs/reiser4/flush_queue.c:5:
fs/reiser4/plugin/node/node40.h:83:5: warning: "GUESS_EXISTS" is not defined
  CC      fs/reiser4/ktxnmgrd.o
In file included from fs/reiser4/plugin/plugin.h:26,
                 from fs/reiser4/tree.h:15,
                 from fs/reiser4/ktxnmgrd.c:28:
fs/reiser4/plugin/node/node40.h:83:5: warning: "GUESS_EXISTS" is not defined
  CC      fs/reiser4/blocknrset.o
  CC      fs/reiser4/super.o
In file included from fs/reiser4/plugin/plugin.h:26,
                 from fs/reiser4/super.c:11:
fs/reiser4/plugin/node/node40.h:83:5: warning: "GUESS_EXISTS" is not defined
fs/reiser4/super.c:381:5: warning: "REISER4_DEBUG_OUTPUT" is not defined
  CC      fs/reiser4/oid.o
In file included from fs/reiser4/plugin/plugin.h:26,
                 from fs/reiser4/tree.h:15,
                 from fs/reiser4/super.h:11,
                 from fs/reiser4/oid.c:4:
fs/reiser4/plugin/node/node40.h:83:5: warning: "GUESS_EXISTS" is not defined
  CC      fs/reiser4/tree_walk.o
In file included from fs/reiser4/plugin/plugin.h:26,
                 from fs/reiser4/jnode.h:19,
                 from fs/reiser4/tree_walk.c:27:
fs/reiser4/plugin/node/node40.h:83:5: warning: "GUESS_EXISTS" is not defined
  CC      fs/reiser4/inode.o
In file included from fs/reiser4/plugin/plugin.h:26,
                 from fs/reiser4/inode.c:14:
fs/reiser4/plugin/node/node40.h:83:5: warning: "GUESS_EXISTS" is not defined
  CC      fs/reiser4/vfs_ops.o
In file included from fs/reiser4/plugin/plugin.h:26,
                 from fs/reiser4/vfs_ops.c:16:
fs/reiser4/plugin/node/node40.h:83:5: warning: "GUESS_EXISTS" is not defined
  CC      fs/reiser4/inode_ops.o
In file included from fs/reiser4/plugin/plugin.h:26,
                 from fs/reiser4/inode_ops.c:14:
fs/reiser4/plugin/node/node40.h:83:5: warning: "GUESS_EXISTS" is not defined
  CC      fs/reiser4/file_ops.o
In file included from fs/reiser4/plugin/plugin.h:26,
                 from fs/reiser4/file_ops.c:21:
fs/reiser4/plugin/node/node40.h:83:5: warning: "GUESS_EXISTS" is not defined
  CC      fs/reiser4/as_ops.o
In file included from fs/reiser4/plugin/plugin.h:26,
                 from fs/reiser4/as_ops.c:13:
fs/reiser4/plugin/node/node40.h:83:5: warning: "GUESS_EXISTS" is not defined
  CC      fs/reiser4/emergency_flush.o
In file included from fs/reiser4/plugin/plugin.h:26,
                 from fs/reiser4/tree.h:15,
                 from fs/reiser4/emergency_flush.c:234:
fs/reiser4/plugin/node/node40.h:83:5: warning: "GUESS_EXISTS" is not defined
  CC      fs/reiser4/entd.o
In file included from fs/reiser4/plugin/plugin.h:26,
                 from fs/reiser4/tree.h:15,
                 from fs/reiser4/entd.c:9:
fs/reiser4/plugin/node/node40.h:83:5: warning: "GUESS_EXISTS" is not defined
  CC      fs/reiser4/readahead.o
In file included from fs/reiser4/plugin/plugin.h:26,
                 from fs/reiser4/tree.h:15,
                 from fs/reiser4/readahead.c:5:
fs/reiser4/plugin/node/node40.h:83:5: warning: "GUESS_EXISTS" is not defined
  CC      fs/reiser4/cluster.o
In file included from fs/reiser4/plugin/plugin.h:26,
                 from fs/reiser4/cluster.c:7:
fs/reiser4/plugin/node/node40.h:83:5: warning: "GUESS_EXISTS" is not defined
  CC      fs/reiser4/crypt.o
In file included from fs/reiser4/plugin/plugin.h:26,
                 from fs/reiser4/crypt.c:5:
fs/reiser4/plugin/node/node40.h:83:5: warning: "GUESS_EXISTS" is not defined
  CC      fs/reiser4/status_flags.o
In file included from fs/reiser4/plugin/plugin.h:26,
                 from fs/reiser4/tree.h:15,
                 from fs/reiser4/super.h:11,
                 from fs/reiser4/status_flags.c:13:
fs/reiser4/plugin/node/node40.h:83:5: warning: "GUESS_EXISTS" is not defined
  CC      fs/reiser4/init_super.o
In file included from fs/reiser4/plugin/plugin.h:26,
                 from fs/reiser4/jnode.h:19,
                 from fs/reiser4/init_super.c:7:
fs/reiser4/plugin/node/node40.h:83:5: warning: "GUESS_EXISTS" is not defined
  CC      fs/reiser4/safe_link.o
In file included from fs/reiser4/plugin/plugin.h:26,
                 from fs/reiser4/tree.h:15,
                 from fs/reiser4/safe_link.h:9,
                 from fs/reiser4/safe_link.c:49:
fs/reiser4/plugin/node/node40.h:83:5: warning: "GUESS_EXISTS" is not defined
  CC      fs/reiser4/plugin/plugin.o
In file included from fs/reiser4/plugin/plugin.h:26,
                 from fs/reiser4/plugin/plugin.c:177:
fs/reiser4/plugin/node/node40.h:83:5: warning: "GUESS_EXISTS" is not defined
fs/reiser4/plugin/plugin.c:326:5: warning: "REISER4_DEBUG_OUTPUT" is not 
defined
  CC      fs/reiser4/plugin/plugin_set.o
In file included from fs/reiser4/plugin/plugin.h:26,
                 from fs/reiser4/plugin/plugin_set.h:9,
                 from fs/reiser4/plugin/plugin_set.c:26:
fs/reiser4/plugin/node/node40.h:83:5: warning: "GUESS_EXISTS" is not defined
  CC      fs/reiser4/plugin/node/node.o
In file included from fs/reiser4/plugin/plugin.h:26,
                 from fs/reiser4/plugin/node/node.c:53:
fs/reiser4/plugin/node/node40.h:83:5: warning: "GUESS_EXISTS" is not defined
  CC      fs/reiser4/plugin/object.o
In file included from fs/reiser4/plugin/plugin.h:26,
                 from fs/reiser4/plugin/file/pseudo.h:6,
                 from fs/reiser4/plugin/object.c:62:
fs/reiser4/plugin/node/node40.h:83:5: warning: "GUESS_EXISTS" is not defined
  CC      fs/reiser4/plugin/symlink.o
In file included from fs/reiser4/plugin/plugin.h:26,
                 from fs/reiser4/plugin/symlink.c:6:
fs/reiser4/plugin/node/node40.h:83:5: warning: "GUESS_EXISTS" is not defined
  CC      fs/reiser4/plugin/cryptcompress.o
In file included from fs/reiser4/plugin/plugin.h:26,
                 from fs/reiser4/inode.h:14,
                 from fs/reiser4/plugin/cryptcompress.c:27:
fs/reiser4/plugin/node/node40.h:83:5: warning: "GUESS_EXISTS" is not defined
fs/reiser4/plugin/cryptcompress.c:600:5: warning: "REISER4_TRACE" is not 
defined
  CC      fs/reiser4/plugin/digest.o
In file included from fs/reiser4/plugin/plugin.h:26,
                 from fs/reiser4/plugin/digest.c:7:
fs/reiser4/plugin/node/node40.h:83:5: warning: "GUESS_EXISTS" is not defined
  CC      fs/reiser4/plugin/node/node40.o
In file included from fs/reiser4/plugin/node/node40.c:9:
fs/reiser4/plugin/node/node40.h:83:5: warning: "GUESS_EXISTS" is not defined
fs/reiser4/plugin/node/node40.c:448:5: warning: "REISER4_STATS" is not 
defined
  CC      fs/reiser4/plugin/compress/minilzo.o
  CC      fs/reiser4/plugin/compress/compress.o
In file included from fs/reiser4/plugin/plugin.h:26,
                 from fs/reiser4/inode.h:14,
                 from fs/reiser4/plugin/compress/compress.c:5:
fs/reiser4/plugin/node/node40.h:83:5: warning: "GUESS_EXISTS" is not defined
  CC      fs/reiser4/plugin/compress/compress_mode.o
In file included from fs/reiser4/plugin/plugin.h:26,
                 from fs/reiser4/inode.h:14,
                 from fs/reiser4/plugin/compress/compress_mode.c:5:
fs/reiser4/plugin/node/node40.h:83:5: warning: "GUESS_EXISTS" is not defined
  CC      fs/reiser4/plugin/item/static_stat.o
In file included from fs/reiser4/plugin/plugin.h:26,
                 from fs/reiser4/tree.h:15,
                 from fs/reiser4/super.h:11,
                 from fs/reiser4/plugin/item/static_stat.c:6:
fs/reiser4/plugin/node/node40.h:83:5: warning: "GUESS_EXISTS" is not defined
fs/reiser4/plugin/item/static_stat.c:39:5: warning: "REISER4_DEBUG_OUTPUT" 
is not defined
fs/reiser4/plugin/item/static_stat.c:418:5: warning: "REISER4_DEBUG_OUTPUT" 
is not defined
fs/reiser4/plugin/item/static_stat.c:508:5: warning: "REISER4_DEBUG_OUTPUT" 
is not defined
fs/reiser4/plugin/item/static_stat.c:572:5: warning: "REISER4_DEBUG_OUTPUT" 
is not defined
fs/reiser4/plugin/item/static_stat.c:677:5: warning: "REISER4_DEBUG_OUTPUT" 
is not defined
fs/reiser4/plugin/item/static_stat.c:1052:5: warning: "REISER4_DEBUG_OUTPUT" 
is not defined
fs/reiser4/plugin/item/static_stat.c:1085:5: warning: "REISER4_DEBUG_OUTPUT" 
is not defined
fs/reiser4/plugin/item/static_stat.c:1103:5: warning: "REISER4_DEBUG_OUTPUT" 
is not defined
fs/reiser4/plugin/item/static_stat.c:1121:5: warning: "REISER4_DEBUG_OUTPUT" 
is not defined
fs/reiser4/plugin/item/static_stat.c:1140:5: warning: "REISER4_DEBUG_OUTPUT" 
is not defined
fs/reiser4/plugin/item/static_stat.c:1158:5: warning: "REISER4_DEBUG_OUTPUT" 
is not defined
fs/reiser4/plugin/item/static_stat.c:1176:5: warning: "REISER4_DEBUG_OUTPUT" 
is not defined
fs/reiser4/plugin/item/static_stat.c:1194:5: warning: "REISER4_DEBUG_OUTPUT" 
is not defined
fs/reiser4/plugin/item/static_stat.c:1213:5: warning: "REISER4_DEBUG_OUTPUT" 
is not defined
  CC      fs/reiser4/plugin/item/sde.o
In file included from fs/reiser4/plugin/plugin.h:26,
                 from fs/reiser4/plugin/item/sde.c:11:
fs/reiser4/plugin/node/node40.h:83:5: warning: "GUESS_EXISTS" is not defined
fs/reiser4/plugin/item/sde.c:21:5: warning: "REISER4_DEBUG_OUTPUT" is not 
defined
  CC      fs/reiser4/plugin/item/cde.o
In file included from fs/reiser4/plugin/plugin.h:26,
                 from fs/reiser4/plugin/item/cde.c:65:
fs/reiser4/plugin/node/node40.h:83:5: warning: "GUESS_EXISTS" is not defined
fs/reiser4/plugin/item/cde.c:466:5: warning: "REISER4_DEBUG_OUTPUT" is not 
defined
  CC      fs/reiser4/plugin/item/blackbox.o
In file included from fs/reiser4/plugin/plugin.h:26,
                 from fs/reiser4/tree.h:15,
                 from fs/reiser4/plugin/item/blackbox.c:11:
fs/reiser4/plugin/node/node40.h:83:5: warning: "GUESS_EXISTS" is not defined
  CC      fs/reiser4/plugin/item/internal.o
In file included from fs/reiser4/plugin/plugin.h:26,
                 from fs/reiser4/plugin/item/internal.c:13:
fs/reiser4/plugin/node/node40.h:83:5: warning: "GUESS_EXISTS" is not defined
fs/reiser4/plugin/item/internal.c:213:5: warning: "REISER4_DEBUG_OUTPUT" is 
not defined
  CC      fs/reiser4/plugin/item/tail.o
In file included from fs/reiser4/plugin/plugin.h:26,
                 from fs/reiser4/inode.h:14,
                 from fs/reiser4/plugin/item/tail.c:4:
fs/reiser4/plugin/node/node40.h:83:5: warning: "GUESS_EXISTS" is not defined
  CC      fs/reiser4/plugin/item/ctail.o
In file included from fs/reiser4/plugin/plugin.h:26,
                 from fs/reiser4/plugin/item/ctail.c:24:
fs/reiser4/plugin/node/node40.h:83:5: warning: "GUESS_EXISTS" is not defined
fs/reiser4/plugin/item/ctail.c:198:5: warning: "REISER4_DEBUG_OUTPUT" is not 
defined
  CC      fs/reiser4/plugin/item/extent.o
In file included from fs/reiser4/plugin/plugin.h:26,
                 from fs/reiser4/tree.h:15,
                 from fs/reiser4/super.h:11,
                 from fs/reiser4/plugin/item/extent.c:5:
fs/reiser4/plugin/node/node40.h:83:5: warning: "GUESS_EXISTS" is not defined
  CC      fs/reiser4/plugin/item/extent_item_ops.o
In file included from fs/reiser4/plugin/plugin.h:26,
                 from fs/reiser4/inode.h:14,
                 from fs/reiser4/plugin/item/extent_item_ops.c:4:
fs/reiser4/plugin/node/node40.h:83:5: warning: "GUESS_EXISTS" is not defined
  CC      fs/reiser4/plugin/item/extent_file_ops.o
In file included from fs/reiser4/plugin/plugin.h:26,
                 from fs/reiser4/inode.h:14,
                 from fs/reiser4/plugin/item/extent_file_ops.c:4:
fs/reiser4/plugin/node/node40.h:83:5: warning: "GUESS_EXISTS" is not defined
  CC      fs/reiser4/plugin/item/extent_flush_ops.o
In file included from fs/reiser4/plugin/plugin.h:26,
                 from fs/reiser4/tree.h:15,
                 from fs/reiser4/plugin/item/extent_flush_ops.c:4:
fs/reiser4/plugin/node/node40.h:83:5: warning: "GUESS_EXISTS" is not defined
  CC      fs/reiser4/plugin/hash.o
In file included from fs/reiser4/plugin/plugin.h:26,
                 from fs/reiser4/plugin/hash.c:8:
fs/reiser4/plugin/node/node40.h:83:5: warning: "GUESS_EXISTS" is not defined
  CC      fs/reiser4/plugin/fibration.o
In file included from fs/reiser4/plugin/plugin.h:26,
                 from fs/reiser4/plugin/fibration.c:28:
fs/reiser4/plugin/node/node40.h:83:5: warning: "GUESS_EXISTS" is not defined
  CC      fs/reiser4/plugin/tail_policy.o
In file included from fs/reiser4/plugin/plugin.h:26,
                 from fs/reiser4/tree.h:15,
                 from fs/reiser4/plugin/tail_policy.c:20:
fs/reiser4/plugin/node/node40.h:83:5: warning: "GUESS_EXISTS" is not defined
  CC      fs/reiser4/plugin/item/item.o
In file included from fs/reiser4/plugin/plugin.h:26,
                 from fs/reiser4/plugin/item/item.c:14:
fs/reiser4/plugin/node/node40.h:83:5: warning: "GUESS_EXISTS" is not defined
fs/reiser4/plugin/item/item.c:353:5: warning: "REISER4_DEBUG_OUTPUT" is not 
defined
fs/reiser4/plugin/item/item.c:406:5: warning: "REISER4_DEBUG_OUTPUT" is not 
defined
fs/reiser4/plugin/item/item.c:463:5: warning: "REISER4_DEBUG_OUTPUT" is not 
defined
fs/reiser4/plugin/item/item.c:520:5: warning: "REISER4_DEBUG_OUTPUT" is not 
defined
fs/reiser4/plugin/item/item.c:681:5: warning: "REISER4_DEBUG_OUTPUT" is not 
defined
fs/reiser4/plugin/item/item.c:741:5: warning: "REISER4_DEBUG_OUTPUT" is not 
defined
  CC      fs/reiser4/plugin/dir/hashed_dir.o
In file included from fs/reiser4/plugin/plugin.h:26,
                 from fs/reiser4/plugin/dir/hashed_dir.c:42:
fs/reiser4/plugin/node/node40.h:83:5: warning: "GUESS_EXISTS" is not defined
fs/reiser4/plugin/dir/hashed_dir.c:1209:36: warning: "REISER4_STATS" is not 
defined
  CC      fs/reiser4/plugin/dir/pseudo_dir.o
In file included from fs/reiser4/plugin/plugin.h:26,
                 from fs/reiser4/inode.h:14,
                 from fs/reiser4/plugin/dir/pseudo_dir.c:6:
fs/reiser4/plugin/node/node40.h:83:5: warning: "GUESS_EXISTS" is not defined
  CC      fs/reiser4/plugin/dir/dir.o
In file included from fs/reiser4/plugin/plugin.h:26,
                 from fs/reiser4/plugin/dir/dir.c:14:
fs/reiser4/plugin/node/node40.h:83:5: warning: "GUESS_EXISTS" is not defined
  CC      fs/reiser4/plugin/security/perm.o
In file included from fs/reiser4/plugin/plugin.h:26,
                 from fs/reiser4/plugin/security/perm.c:5:
fs/reiser4/plugin/node/node40.h:83:5: warning: "GUESS_EXISTS" is not defined
  CC      fs/reiser4/plugin/pseudo/pseudo.o
In file included from fs/reiser4/plugin/plugin.h:26,
                 from fs/reiser4/inode.h:14,
                 from fs/reiser4/plugin/pseudo/pseudo.c:97:
fs/reiser4/plugin/node/node40.h:83:5: warning: "GUESS_EXISTS" is not defined
  CC      fs/reiser4/plugin/space/bitmap.o
In file included from fs/reiser4/plugin/plugin.h:26,
                 from fs/reiser4/jnode.h:19,
                 from fs/reiser4/plugin/space/bitmap.c:6:
fs/reiser4/plugin/node/node40.h:83:5: warning: "GUESS_EXISTS" is not defined
  CC      fs/reiser4/plugin/disk_format/disk_format40.o
In file included from fs/reiser4/plugin/plugin.h:26,
                 from fs/reiser4/plugin/disk_format/disk_format40.c:9:
fs/reiser4/plugin/node/node40.h:83:5: warning: "GUESS_EXISTS" is not defined
  CC      fs/reiser4/plugin/disk_format/disk_format.o
In file included from fs/reiser4/plugin/plugin.h:26,
                 from fs/reiser4/plugin/disk_format/disk_format.c:7:
fs/reiser4/plugin/node/node40.h:83:5: warning: "GUESS_EXISTS" is not defined
  CC      fs/reiser4/plugin/file/pseudo.o
In file included from fs/reiser4/plugin/plugin.h:26,
                 from fs/reiser4/plugin/file/pseudo.h:6,
                 from fs/reiser4/plugin/file/pseudo.c:7:
fs/reiser4/plugin/node/node40.h:83:5: warning: "GUESS_EXISTS" is not defined
  CC      fs/reiser4/plugin/file/file.o
In file included from fs/reiser4/plugin/plugin.h:26,
                 from fs/reiser4/inode.h:14,
                 from fs/reiser4/plugin/file/file.c:4:
fs/reiser4/plugin/node/node40.h:83:5: warning: "GUESS_EXISTS" is not defined
  CC      fs/reiser4/plugin/file/regular.o
In file included from fs/reiser4/plugin/plugin.h:26,
                 from fs/reiser4/plugin/file/regular.c:8:
fs/reiser4/plugin/node/node40.h:83:5: warning: "GUESS_EXISTS" is not defined
  CC      fs/reiser4/plugin/file/tail_conversion.o
In file included from fs/reiser4/plugin/plugin.h:26,
                 from fs/reiser4/inode.h:14,
                 from fs/reiser4/plugin/file/tail_conversion.c:3:
fs/reiser4/plugin/node/node40.h:83:5: warning: "GUESS_EXISTS" is not defined


- HM



