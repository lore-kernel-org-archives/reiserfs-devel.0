From: "Lex  Jonkers" <jonkersl@Fourtop.nl>
Subject: 2.6.9-3 patch won't compile
Date: Mon, 13 Dec 2004 13:17:14 +0100
Message-ID: <18A36962E684664DB223E403DB64FB220C6805@W23FT01.Fourtop.local>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-22749-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-class: urn:content-classes:message
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi,

I'm having problems compiling 2.6.9-3 patch:

  CC      fs/reiser4/debug.o
  CC      fs/reiser4/stats.o
  CC      fs/reiser4/jnode.o
  CC      fs/reiser4/znode.o
  CC      fs/reiser4/key.o
  CC      fs/reiser4/pool.o
  CC      fs/reiser4/tree_mod.o
  CC      fs/reiser4/estimate.o
  CC      fs/reiser4/carry.o
  CC      fs/reiser4/carry_ops.o
  CC      fs/reiser4/lock.o
  CC      fs/reiser4/tree.o
  CC      fs/reiser4/context.o
  CC      fs/reiser4/tap.o
  CC      fs/reiser4/coord.o
  CC      fs/reiser4/block_alloc.o
  CC      fs/reiser4/txnmgr.o
  CC      fs/reiser4/kassign.o
  CC      fs/reiser4/flush.o
  CC      fs/reiser4/wander.o
  CC      fs/reiser4/eottl.o
  CC      fs/reiser4/search.o
  CC      fs/reiser4/page_cache.o
  CC      fs/reiser4/lnode.o
  CC      fs/reiser4/kcond.o
  CC      fs/reiser4/seal.o
  CC      fs/reiser4/dscale.o
  CC      fs/reiser4/log.o
  CC      fs/reiser4/flush_queue.o
  CC      fs/reiser4/ktxnmgrd.o
  CC      fs/reiser4/kattr.o
  CC      fs/reiser4/blocknrset.o
  CC      fs/reiser4/super.o
  CC      fs/reiser4/oid.o
  CC      fs/reiser4/tree_walk.o
  CC      fs/reiser4/inode.o
  CC      fs/reiser4/vfs_ops.o
  CC      fs/reiser4/inode_ops.o
  CC      fs/reiser4/file_ops.o
  CC      fs/reiser4/as_ops.o
  CC      fs/reiser4/emergency_flush.o
  CC      fs/reiser4/spinprof.o
  CC      fs/reiser4/entd.o
  CC      fs/reiser4/readahead.o
  CC      fs/reiser4/crypt.o
  CC      fs/reiser4/diskmap.o
  CC      fs/reiser4/prof.o
  CC      fs/reiser4/repacker.o
  CC      fs/reiser4/status_flags.o
  CC      fs/reiser4/init_super.o
  CC      fs/reiser4/safe_link.o
  CC      fs/reiser4/plugin/plugin.o
  CC      fs/reiser4/plugin/plugin_set.o
  CC      fs/reiser4/plugin/node/node.o
  CC      fs/reiser4/plugin/object.o
  CC      fs/reiser4/plugin/symlink.o
  CC      fs/reiser4/plugin/cryptcompress.o
fs/reiser4/plugin/cryptcompress.c: In function `set_cluster_params':
fs/reiser4/plugin/cryptcompress.c:2203: parse error before `hole_size'
fs/reiser4/plugin/cryptcompress.c:2204: `hole_size' undeclared (first =
use in this function)
fs/reiser4/plugin/cryptcompress.c:2204: (Each undeclared identifier is =
reported only once
fs/reiser4/plugin/cryptcompress.c:2204: for each function it appears =
in.)
make[2]: *** [fs/reiser4/plugin/cryptcompress.o] Error 1
make[1]: *** [fs/reiser4] Error 2
make: *** [fs] Error 2


Are these patches stand-alone or incremental?

With Regards,
Lex Jonkers
