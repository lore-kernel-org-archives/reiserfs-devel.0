From: Nikita Danilov <Nikita@Namesys.COM>
Subject: [ANNOUNCE]: reiser4 snapshot
Date: Thu, 13 Feb 2003 17:44:31 +0300
Message-ID: <15947.44879.855354.614016@laputa.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12739-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Reiserfs developers mail-list <Reiserfs-Dev@Namesys.COM>, Reiserfs mail-list <Reiserfs-List@Namesys.COM>

Hello,

new reiser4 snapshot is available at:

http://www.namesys.com/snapshots/2003.02.13/

Your feedback and testing efforts are most valuable to us.

From README:
----------------------------------------------------------------------
Reiser4 snapshot for 2003.02.13

WARNING!!! This code is experimental! WE ARE NOT KIDDING! DO NOT PUT
ANY VALUABLE DATA ON REISER4 YET!

This is mostly bug fixing shapshot.

Snapshot is released as a patch against linux-2.5.60. It should also work with
current (February 13th) bk snapshot.
REISER4_NOOPT config option (Disable compiler optimizations for reiser4 code.)
is known to not compile on x86.
Some read-ahead experimental code is present in this snapshot.

Changelog (extracted by "bk changes"):

ChangeSet@1.1167, 2003-02-13 16:20:37+03:00, green@angband.namesys.com
  spin_macros.h:
    unclude linux/spin_macros.h, not asm/spin_macros.h, as asm/spin_macros.h is only needed on SMP

ChangeSet@1.1166, 2003-02-12 21:43:03+03:00, edward@theta.namesys.com
  plugin.h:
    Added new jnode plugin 
  cryptcompress.h:
    Remove old cluster cache support
  cryptcompress.c:
    Remove old per-node cluster cache support 
  jnode.h:
    New jnode type support
  jnode.c:
    Added new jnode type for cluster cache pages 
  compress.c:
    Rename header
  Makefile:
    Rename source file
  cryptcompress.h:
    Rename: plugin/crypto_compressed.h -> plugin/cryptcompress.h
  cryptcompress.c:
    Rename: plugin/crypo_compressed.c -> plugin/cryptcompress.c

ChangeSet@1.1164, 2003-02-12 20:19:15+03:00, god@laputa.namesys.com
  ugly work around for spin lock profiling

ChangeSet@1.1163, 2003-02-12 20:18:56+03:00, god@laputa.namesys.com
  restore atomicity of critical section in jload()

ChangeSet@1.1162, 2003-02-12 20:15:53+03:00, god@laputa.namesys.com
  make check for validness of block counters assertive

ChangeSet@1.1161, 2003-02-12 17:54:43+03:00, god@laputa.namesys.com
  fix wrong assertion

ChangeSet@1.1160, 2003-02-12 17:54:30+03:00, god@laputa.namesys.com
  spin lock profiling. Take two.

ChangeSet@1.1159, 2003-02-12 16:24:28+03:00, god@laputa.namesys.com
  hadle special case of taking spin-lock bypassing wrapper functions 

ChangeSet@1.1156.1.1, 2003-02-12 14:42:37+03:00, vs@tribesman.namesys.com
  Merge vs@thebsh:/home/bk/reiser4
  into tribesman.namesys.com:/home/vs/reiser4-linux-2.5/fs/reiser4

ChangeSet@1.1157, 2003-02-12 15:10:33+03:00, god@laputa.namesys.com
  fix compilation breakaga

ChangeSet@1.1156, 2003-02-12 14:27:39+03:00, god@laputa.namesys.com
  spin-lock profiling. Requires patches to arch code to be enabled.

ChangeSet@1.1151.1.4, 2003-02-12 14:42:28+03:00, vs@tribesman.namesys.com
  compilability with EFLUSH turned off

ChangeSet@1.1151.3.1, 2003-02-12 21:03:10+03:00, zam@crimson.namesys.com
  shifted_nodes_below has no sense if we are on leaf level.

ChangeSet@1.1151.1.3, 2003-02-12 13:36:04+03:00, vs@tribesman.namesys.com
  cleanup

ChangeSet@1.1154, 2003-02-12 13:46:05+03:00, god@laputa.namesys.com
  fix rwlock_t initialisations

ChangeSet@1.1153, 2003-02-12 13:45:43+03:00, god@laputa.namesys.com
  fix naming insanity

ChangeSet@1.1151.2.1, 2003-02-11 19:11:36+03:00, zam@crimson.namesys.com
  uncomment call to cbk_cache back

ChangeSet@1.1151.1.1, 2003-02-12 11:30:33+03:00, green@angband.namesys.com
  ktxnmgrd.c:
    new daemonize() semantic

ChangeSet@1.1152, 2003-02-12 13:44:54+03:00, god@laputa.namesys.com
  fix indentation

ChangeSet@1.1151, 2003-02-11 17:27:58+03:00, god@laputa.namesys.com
  fix last fix

ChangeSet@1.1131.1.120, 2003-02-11 15:44:15+03:00, god@laputa.namesys.com
  release tree lock in the error path of renew_sibling_link()

ChangeSet@1.1149, 2003-02-11 14:26:06+03:00, vs@tribesman.namesys.com
  conflict is resolved

ChangeSet@1.1131.1.119, 2003-02-11 15:43:39+03:00, god@laputa.namesys.com
  strengthen lock ordering predicate for tree

ChangeSet@1.1131.1.118, 2003-02-11 14:08:10+03:00, god@laputa.namesys.com
  replace check with assertion

ChangeSet@1.1131.1.117, 2003-02-11 14:07:52+03:00, god@laputa.namesys.com
  remove unneeded includes

ChangeSet@1.1131.1.116, 2003-02-11 14:06:36+03:00, god@laputa.namesys.com
  more read-write tree lock fixes

ChangeSet@1.1131.1.115, 2003-02-11 14:06:17+03:00, god@laputa.namesys.com
  make item_plugin_by_coord() inline

ChangeSet@1.1148, 2003-02-11 14:24:19+03:00, vs@tribesman.namesys.com
  using new tree spinlocking macroses

ChangeSet@1.1131.1.114, 2003-02-11 14:05:38+03:00, god@laputa.namesys.com
  more read-write tree lock fixes

ChangeSet@1.1147, 2003-02-11 13:22:35+03:00, vs@tribesman.namesys.com
  Merge vs@thebsh:/home/bk/reiser4
  into tribesman.namesys.com:/home/vs/reiser4-linux-2.5/fs/reiser4

ChangeSet@1.1131.1.113, 2003-02-11 14:05:12+03:00, god@laputa.namesys.com
  make reiser4_inode_data() inline

ChangeSet@1.1131.1.112, 2003-02-11 11:53:43+03:00, god@laputa.namesys.com
  Merge god@thebsh.namesys.com:/home/bk/reiser4
  into laputa.namesys.com:/home/god/projects/2.5/fs/reiser4

ChangeSet@1.1131.1.111, 2003-02-11 11:51:43+03:00, god@laputa.namesys.com
  fix nesting

ChangeSet@1.1131.1.110, 2003-02-11 11:12:18+03:00, god@laputa.namesys.com
  fix compilability

ChangeSet@1.1131.1.109, 2003-02-11 11:10:57+03:00, god@laputa.namesys.com
  add question

ChangeSet@1.1131.1.108, 2003-02-11 11:10:40+03:00, god@laputa.namesys.com
  unlock transaction handle and jnode in case of TXN_CAPTURE_DONT_FUSE

ChangeSet@1.1131.1.107, 2003-02-11 11:10:03+03:00, god@laputa.namesys.com
  fix error that led to -EAGAIN in writepage: add_empty_leaf() sometimes left
  new child unconnected

ChangeSet@1.1131.1.106, 2003-02-11 11:09:19+03:00, god@laputa.namesys.com
  switch tree lock to read-write

ChangeSet@1.1131.1.105, 2003-02-11 11:06:33+03:00, god@laputa.namesys.com
  add description of [tap-sane] invariant

ChangeSet@1.1131.1.104, 2003-02-11 11:06:07+03:00, god@laputa.namesys.com
  comment tap.[ch]

ChangeSet@1.1146, 2003-02-11 13:22:11+03:00, vs@tribesman.namesys.com
  cleanup

ChangeSet@1.1131.1.103, 2003-02-11 11:05:50+03:00, god@laputa.namesys.com
  add macros for read-write spin locks

ChangeSet@1.1131.24.1, 2003-02-10 18:17:23+03:00, zam@crimson.namesys.com
  znode_remove_sibling_list can be called for half-connected node.

ChangeSet@1.1145, 2003-02-10 12:08:46+03:00, vs@tribesman.namesys.com
  conflict resolved

ChangeSet@1.1131.23.1, 2003-02-10 17:27:18+03:00, grev@flint.users.botik.ru
  cleanup: renaming 

ChangeSet@1.1131.1.102, 2003-02-11 11:00:14+03:00, god@laputa.namesys.com
  remove warning nikita-1845

ChangeSet@1.1131.1.101, 2003-02-10 09:25:54+03:00, green@angband.namesys.com
  ktxnmgrd.c:
    Adopt to new placement of signal stuff in 2.5

ChangeSet@1.1131.1.100, 2003-02-08 00:14:34+03:00, grev@flint.users.botik.ru
  cleanup: renaming functions

ChangeSet@1.1131.1.99, 2003-02-07 22:55:25+03:00, grev@flint.users.botik.ru
  cleanup: renaming functions

ChangeSet@1.1131.1.98, 2003-02-07 21:39:33+03:00, zam@crimson.namesys.com
  return source code compilability and some renames back.

ChangeSet@1.1131.1.97, 2003-02-07 20:55:51+03:00, grev@flint.users.botik.ru
  cleanup: renaming reiser4_flush_reserved, reiser4_set_flush_reserved, reiser4_atom_flush_reserved 

ChangeSet@1.1131.22.2, 2003-02-07 19:29:50+03:00, zam@crimson.namesys.com
  fixing lock ordering

ChangeSet@1.1131.1.95, 2003-02-07 20:11:26+03:00, reiser@bitshadow.namesys.com
  comment

ChangeSet@1.1131.1.94, 2003-02-07 16:37:43+03:00, reiser@bitshadow.namesys.com
  comment

ChangeSet@1.1131.1.93, 2003-02-07 14:09:00+03:00, reiser@bitshadow.namesys.com
  comment

ChangeSet@1.1131.1.92, 2003-02-07 11:36:15+03:00, god@laputa.namesys.com
  remove BA_CAN_COMMIT from grabbing flags: long term lock is held
  during prepare_extent2tail() so transaction commit can deadlock.

ChangeSet@1.1131.1.91, 2003-02-07 11:13:08+03:00, god@laputa.namesys.com
  Merge

ChangeSet@1.1131.19.9, 2003-02-06 23:27:48+03:00, umka@haron.namesys.com
  Merge umka@thebsh:/home/bk/reiser4
  into haron.namesys.com:/home/umka/work/reiser4/reiser4-linux-2.5/fs/reiser4

ChangeSet@1.1131.21.1, 2003-02-07 19:00:48+03:00, zam@crimson.namesys.com
  move spinlocks out from cbk slot scanning loop.

ChangeSet@1.1131.20.2, 2003-02-06 22:42:32+03:00, reiser@bitshadow.namesys.com
  c

ChangeSet@1.1131.20.1, 2003-02-06 21:29:26+03:00, zam@crimson.namesys.com
  Ahtung! e-flush is called.

ChangeSet@1.1131.19.8, 2003-02-06 23:27:40+03:00, umka@haron.namesys.com

ChangeSet@1.1131.19.7, 2003-02-06 19:23:44+03:00, zam@crimson.namesys.com
  remove unnecessary check for a failure which can't happen

ChangeSet@1.1131.19.6, 2003-02-06 18:59:07+03:00, zam@crimson.namesys.com
  more comment -- better code !

ChangeSet@1.1131.19.5, 2003-02-06 17:47:27+03:00, zam@crimson.namesys.com
  typo fixed

ChangeSet@1.1131.1.90, 2003-02-07 11:12:20+03:00, god@laputa.namesys.com
  cleanup of flush.c

ChangeSet@1.1131.19.4, 2003-02-06 17:33:41+03:00, zam@crimson.namesys.com
  fix forward declaration

ChangeSet@1.1131.1.89, 2003-02-07 11:11:52+03:00, god@laputa.namesys.com
  s/atom_get_locked_by_jnode/atom_locked_by_jnode/g

ChangeSet@1.1131.19.3, 2003-02-06 17:29:08+03:00, zam@crimson.namesys.com
  implement inexpensive protection from e-flush and replace
  jload by it in critical places.

ChangeSet@1.1131.1.88, 2003-02-07 11:11:22+03:00, god@laputa.namesys.com
  add backtrace-based profiling

ChangeSet@1.1131.19.2, 2003-02-06 15:06:28+03:00, zam@crimson.namesys.com
  comment update,
  make squalloc_right_neighbor static again

ChangeSet@1.1131.1.87, 2003-02-07 11:10:33+03:00, god@laputa.namesys.com
  add comment about padding in coord_t

ChangeSet@1.1131.19.1, 2003-02-06 14:32:16+03:00, zam@crimson.namesys.com
  Merge zam@thebsh:/home/bk/reiser4
  into crimson.namesys.com:/home/shuric/work/uml/fs/reiser4

ChangeSet@1.1131.1.86, 2003-02-07 11:10:13+03:00, god@laputa.namesys.com
  fix commentary for reiser4_context

ChangeSet@1.1131.1.85, 2003-02-06 14:08:17+03:00, god@laputa.namesys.com
  Merge god@thebsh.namesys.com:/home/bk/reiser4
  into laputa.namesys.com:/home/god/projects/2.5/fs/reiser4

ChangeSet@1.1131.1.84, 2003-02-06 14:08:05+03:00, god@laputa.namesys.com
  commenting flush.c

ChangeSet@1.1131.1.83, 2003-02-06 14:06:34+03:00, god@laputa.namesys.com
  update invariant documentation

ChangeSet@1.1131.1.82, 2003-02-05 21:03:55+03:00, god@laputa.namesys.com
  fix internal_update()'s prototype

ChangeSet@1.1131.1.81, 2003-02-05 21:03:37+03:00, god@laputa.namesys.com
  call balance_dirty_pages_ratelimited() in write

ChangeSet@1.1131.18.4, 2003-02-06 14:31:29+03:00, zam@crimson.namesys.com
  comment update

ChangeSet@1.1131.1.80, 2003-02-05 21:03:19+03:00, god@laputa.namesys.com
  don't allow block allocator to commit during tail->extent reservation,
  because we are holding lock on formatted node during this and
  it can lead to the deadlock.

ChangeSet@1.1131.18.3, 2003-02-06 12:36:52+03:00, zam@crimson.namesys.com
  comment update

ChangeSet@1.1131.1.79, 2003-02-05 21:01:31+03:00, god@laputa.namesys.com
  cosmetic change

ChangeSet@1.1131.18.2, 2003-02-05 16:01:05+03:00, zam@crimson.namesys.com
  what race is meant here, I do not understand

ChangeSet@1.1131.1.78, 2003-02-05 21:01:13+03:00, god@laputa.namesys.com
  add debugging fields to the context: trace where grabbing has been per
  formed and for what amount of blocks
  
  fix bug in reiser4_grab(): only call grab_space_disable() on success.

ChangeSet@1.1131.16.6, 2003-02-06 22:35:31+03:00, reiser@bitshadow.namesys.com
  comment

ChangeSet@1.1131.1.77, 2003-02-05 20:59:31+03:00, god@laputa.namesys.com
  remove copy of on-disk super-block from struct super_block

ChangeSet@1.1131.17.1, 2003-02-05 15:38:03+03:00, zam@crimson.namesys.com
  remove the code duplicated in reiser4_get_neighbor

ChangeSet@1.1131.1.76, 2003-02-05 20:58:26+03:00, god@laputa.namesys.com
  check that no long term locks are held at the beginning of transaction
  commit.
  
  remove obsolete debugging code

ChangeSet@1.1131.16.4, 2003-02-05 13:49:38+03:00, zam@crimson.namesys.com
  A whitespace (new line) added after goto label

ChangeSet@1.1131.1.75, 2003-02-05 18:40:30+03:00, god@laputa.namesys.com
  add and use reiser4_blocknr_is_sane() function

ChangeSet@1.1131.16.3, 2003-02-04 20:45:37+03:00, zam@crimson.namesys.com
  update TODO

ChangeSet@1.1131.1.74, 2003-02-05 18:40:07+03:00, god@laputa.namesys.com
  add ->update() flush op.

ChangeSet@1.1131.16.2, 2003-02-04 20:12:59+03:00, zam@crimson.namesys.com
  outdated comment removed

ChangeSet@1.1131.1.73, 2003-02-05 18:39:22+03:00, god@laputa.namesys.com
  add invariants checking for jnodes

ChangeSet@1.1131.16.1, 2003-02-04 19:41:54+03:00, zam@crimson.namesys.com
  Merge

ChangeSet@1.1131.1.72, 2003-02-05 16:37:02+03:00, god@laputa.namesys.com
  introduce and use get_fake_znode()

ChangeSet@1.1131.1.71, 2003-02-04 18:50:41+03:00, god@laputa.namesys.com
  Merge god@thebsh.namesys.com:/home/bk/reiser4
  into laputa.namesys.com:/home/god/projects/2.5/fs/reiser4

ChangeSet@1.1131.1.70, 2003-02-04 18:50:33+03:00, god@laputa.namesys.com
  update of znode.c comments

ChangeSet@1.1131.15.2, 2003-02-04 19:39:41+03:00, zam@crimson.namesys.com
  comments update

ChangeSet@1.1131.1.69, 2003-02-04 18:50:12+03:00, god@laputa.namesys.com
  don't acquire dk lock before calling set_child_delimiting_keys()

ChangeSet@1.1131.15.1, 2003-02-04 17:20:29+03:00, zam@crimson.namesys.com
  correcting a function name 

ChangeSet@1.1131.14.2, 2003-02-05 14:37:26+03:00, reiser@bitshadow.namesys.com
  comment

ChangeSet@1.1131.1.68, 2003-02-04 18:49:44+03:00, god@laputa.namesys.com
  fix typoes in flush.c

ChangeSet@1.1131.1.67, 2003-02-04 15:10:31+03:00, god@laputa.namesys.com
  add comment at the top of doc/lock-ordering.dot

ChangeSet@1.1131.1.66, 2003-02-04 13:16:33+03:00, god@laputa.namesys.com
  turn mt flush on by default

ChangeSet@1.1131.1.65, 2003-02-04 13:16:14+03:00, god@laputa.namesys.com
  take spin-lock around call to update_znode_dkeys()

ChangeSet@1.1131.1.64, 2003-02-03 15:58:31+03:00, god@laputa.namesys.com
  don't take DK spin-lock twice

ChangeSet@1.1131.1.63, 2003-02-03 13:53:06+03:00, god@laputa.namesys.com
  more DK fixes

ChangeSet@1.1131.13.1, 2003-02-04 14:07:39+03:00, reiser@bitshadow.namesys.com
  comment

ChangeSet@1.1131.1.62, 2003-02-03 11:09:16+03:00, god@laputa.namesys.com
  weaken assertions

ChangeSet@1.1131.1.61, 2003-01-31 21:43:22+03:00, god@laputa.namesys.com
  add description of DK problem.

ChangeSet@1.1131.1.60, 2003-01-31 21:38:31+03:00, god@laputa.namesys.com
  more dk fixing

ChangeSet@1.1131.1.59, 2003-01-31 21:08:52+03:00, god@laputa.namesys.com
  Merge god@thebsh.namesys.com:/home/bk/reiser4
  into laputa.namesys.com:/home/god/projects/2.5/fs/reiser4

ChangeSet@1.1131.11.6, 2003-01-31 19:59:05+03:00, zam@crimson.namesys.com
  make most probable code pathes faster.

ChangeSet@1.1131.11.5, 2003-01-31 19:15:30+03:00, zam@crimson.namesys.com
  add a e-flush check before taking spin-lock and calling eflush_del  

ChangeSet@1.1144, 2003-02-10 11:45:20+03:00, vs@tribesman.namesys.com
  minor debugging code

ChangeSet@1.1131.1.58, 2003-01-31 21:08:35+03:00, god@laputa.namesys.com
  dk fix

ChangeSet@1.1131.11.4, 2003-01-31 19:00:45+03:00, zam@crimson.namesys.com
  make add_d_ref inline

ChangeSet@1.1143, 2003-01-31 13:11:57+03:00, vs@tribesman.namesys.com
  conflict resolved

ChangeSet@1.1131.1.57, 2003-01-31 21:08:22+03:00, god@laputa.namesys.com
  add more sysfs attributes

ChangeSet@1.1142, 2003-01-31 13:10:32+03:00, vs@tribesman.namesys.com
  debugging code

ChangeSet@1.1131.1.56, 2003-01-30 18:30:10+03:00, god@laputa.namesys.com
  cleanup

ChangeSet@1.1131.12.1, 2003-01-30 20:15:30+03:00, zam@crimson.namesys.com
  comment update

ChangeSet@1.1131.11.2, 2003-01-30 15:44:35+03:00, vs@tribesman.namesys.com
  fix for lockup on locked page

ChangeSet@1.1131.1.55, 2003-01-30 18:29:35+03:00, god@laputa.namesys.com
  disable node check

ChangeSet@1.1131.11.1, 2003-01-30 14:44:44+03:00, zam@crimson.namesys.com
  1. reiser4 context flags clean-up
  2. do not mark pages accessed when in writeout mode.

ChangeSet@1.1141, 2003-01-30 12:41:08+03:00, vs@tribesman.namesys.com
  conflict resolved

ChangeSet@1.1131.1.54, 2003-01-30 18:29:14+03:00, god@laputa.namesys.com
  cleanup

ChangeSet@1.1131.1.52, 2003-01-29 20:54:06+03:00, god@laputa.namesys.com
  shuffle locks in extent code

ChangeSet@1.1131.1.51, 2003-01-29 20:53:33+03:00, god@laputa.namesys.com
  fix type (hmm?)

ChangeSet@1.1131.1.49, 2003-01-29 19:30:11+03:00, god@laputa.namesys.com
  restrict sunc_dkeys() to nodes belonging to the single balancing operation

ChangeSet@1.1131.1.48, 2003-01-29 19:14:21+03:00, god@laputa.namesys.com
  don't special-case ->mmap() plugin

ChangeSet@1.1131.1.47, 2003-01-29 19:13:52+03:00, god@laputa.namesys.com
  mark pages accessed in read/write

ChangeSet@1.1131.10.2, 2003-01-29 21:34:26+03:00, zam@crimson.namesys.com
  activate page if emergency flush could not submit it to disk

ChangeSet@1.1131.1.46, 2003-01-29 19:13:06+03:00, god@laputa.namesys.com
  update lock-ordering description

ChangeSet@1.1131.10.1, 2003-01-29 17:36:21+03:00, zam@crimson.namesys.com
  Merge zam@thebsh:/home/bk/reiser4
  into crimson.namesys.com:/home/shuric/work/uml/fs/reiser4

ChangeSet@1.1131.1.45, 2003-01-29 19:12:46+03:00, god@laputa.namesys.com
  funnel all delimiting key updates through znode_set_{l,r}d_key()

ChangeSet@1.1131.1.43, 2003-01-29 13:28:06+03:00, god@laputa.namesys.com
  Merge god@thebsh.namesys.com:/home/bk/reiser4
  into laputa.namesys.com:/home/god/projects/2.5/fs/reiser4

ChangeSet@1.1131.1.42, 2003-01-29 13:26:48+03:00, god@laputa.namesys.com
  use schedulable() in stead of explicit checks for ->spin_locked

ChangeSet@1.1131.1.41, 2003-01-29 13:23:32+03:00, god@laputa.namesys.com
  increment @iterations

ChangeSet@1.1140, 2003-01-30 12:34:23+03:00, vs@tribesman.namesys.com
  debugging code tossing around

ChangeSet@1.1131.1.40, 2003-01-29 13:23:05+03:00, god@laputa.namesys.com
  simplify VFS callbacks

ChangeSet@1.1131.8.3, 2003-01-29 15:29:22+03:00, vs@tribesman.namesys.com
  flushable: not sure wether it is right

ChangeSet@1.1131.1.39, 2003-01-29 13:22:37+03:00, god@laputa.namesys.com
  add permission plugin methods for read and write

ChangeSet@1.1131.9.1, 2003-01-29 17:36:01+03:00, zam@crimson.namesys.com
  e-flush code path for DIRTY/RELOC nodes cleanup/fix

ChangeSet@1.1131.8.2, 2003-01-29 12:54:03+03:00, vs@tribesman.namesys.com
  append_and_or_overwrite: change state of empty files after they actually became not empty

ChangeSet@1.1131.1.38, 2003-01-29 13:22:12+03:00, god@laputa.namesys.com
  cosmetic: move EMACS stuff to the end of the file

ChangeSet@1.1131.8.1, 2003-01-28 17:59:04+03:00, vs@tribesman.namesys.com
  reiser4_readpages: release pages which were not readahead

ChangeSet@1.1131.1.37, 2003-01-29 13:21:37+03:00, god@laputa.namesys.com
  add standard unix checks to the read/write: resource limits,
  suid removal on write, LFS, etc.

ChangeSet@1.1139, 2003-01-28 17:44:53+03:00, vs@tribesman.namesys.com
  conflict resolved

ChangeSet@1.1131.1.36, 2003-01-29 13:20:14+03:00, god@laputa.namesys.com
  moving fake_{lock,gen} out of function scope---this simplifies debugging

ChangeSet@1.1131.1.35, 2003-01-28 17:23:49+03:00, god@laputa.namesys.com
  don't look into right neighbor in is_next_item_internal(). This led to
  nasty bug.

ChangeSet@1.1131.1.34, 2003-01-28 17:23:13+03:00, god@laputa.namesys.com
  add assertion checking that right delimiting key is never *decreased*
  without obtaining long term lock first

ChangeSet@1.1131.1.33, 2003-01-28 14:46:30+03:00, god@laputa.namesys.com
  more lock-ordering updates

ChangeSet@1.1131.1.32, 2003-01-28 14:45:59+03:00, god@laputa.namesys.com
  fix deadlock between inode_guard and jnode_lock

ChangeSet@1.1131.1.31, 2003-01-28 14:45:33+03:00, god@laputa.namesys.com
  remove unneeded debugging code

ChangeSet@1.1131.1.30, 2003-01-28 14:45:09+03:00, god@laputa.namesys.com
  fix wrong order of initializations

ChangeSet@1.1131.7.2, 2003-01-27 20:49:25+03:00, zam@crimson.namesys.com
  disable rdtsc-based profiling by default

ChangeSet@1.1131.1.27, 2003-01-24 19:50:08+03:00, god@laputa.namesys.com
  sync description of lock oredering for core locks with changes in kernel

ChangeSet@1.1131.7.1, 2003-01-24 18:31:30+03:00, zam@crimson.namesys.com
  Merge zam@thebsh:/home/bk/reiser4
  into crimson.namesys.com:/home/shuric/work/uml/fs/reiser4

ChangeSet@1.1131.1.26, 2003-01-24 17:40:49+03:00, god@laputa.namesys.com
  inode spin lock can be taken from under jnode spin lock. Reflect this in lock-ordering specification and checks

ChangeSet@1.1131.1.25, 2003-01-24 15:43:33+03:00, god@laputa.namesys.com
  update lock ordering description, extract .dot representation 

ChangeSet@1.1131.1.24, 2003-01-24 15:42:08+03:00, god@laputa.namesys.com
  elaborate spin-lock predicate for inode and dk spin locks

ChangeSet@1.1131.1.23, 2003-01-24 15:41:13+03:00, god@laputa.namesys.com
  remove obsolete "fix" for i_nlink

ChangeSet@1.1131.1.22, 2003-01-24 15:40:47+03:00, god@laputa.namesys.com
  typo fixed

ChangeSet@1.1131.1.21, 2003-01-24 15:40:30+03:00, god@laputa.namesys.com
  remove unused ktxnmgrd_kick() function

ChangeSet@1.1131.6.2, 2003-01-24 18:21:56+03:00, zam@crimson.namesys.com
  recursive page lock in bitmap blocks loading fix 

ChangeSet@1.1131.1.20, 2003-01-24 15:39:51+03:00, god@laputa.namesys.com
  remove wait_on_page_locked() from jnode_finish_io()

ChangeSet@1.1131.6.1, 2003-01-24 15:50:00+03:00, zam@crimson.namesys.com
  do not do jrelse with locked page (not sure that previous variant was incorrect)

ChangeSet@1.1131.1.19, 2003-01-24 15:39:06+03:00, god@laputa.namesys.com
  eflush_del(): move iput() from under jnode spin lock

ChangeSet@1.1131.1.18, 2003-01-23 14:53:36+03:00, god@laputa.namesys.com
  use delete_sema for truncate

ChangeSet@1.1138, 2003-01-28 17:37:28+03:00, vs@tribesman.namesys.com
  debugging code

ChangeSet@1.1131.1.17, 2003-01-21 21:19:44+03:00, god@laputa.namesys.com
  remove `info' from extent_readpage

ChangeSet@1.1137, 2003-01-22 12:48:17+03:00, vs@tribesman.namesys.com
  Merge vs@thebsh:/home/bk/reiser4
  into tribesman.namesys.com:/home/vs/reiser4-linux-2.5/fs/reiser4

ChangeSet@1.1131.1.16, 2003-01-21 21:19:24+03:00, god@laputa.namesys.com
  add one more prof counter

ChangeSet@1.1131.1.15, 2003-01-21 19:59:10+03:00, god@laputa.namesys.com
  fix error in subsys support: don't duplicate default attributes on each level

ChangeSet@1.1131.1.14, 2003-01-21 19:43:43+03:00, god@laputa.namesys.com
  plugin_hash.[ch]: API for non-standard plugins (like compression,
  cryptography, etc.) to attach their state to reiser4 objects:
  inodes, jnodes, and super-blocks.

ChangeSet@1.1131.1.13, 2003-01-21 17:36:48+03:00, god@laputa.namesys.com
  cleanup tree traversal warnings

ChangeSet@1.1131.1.12, 2003-01-21 17:36:32+03:00, god@laputa.namesys.com
  make sysfs suppotr optional

ChangeSet@1.1131.1.11, 2003-01-21 17:36:11+03:00, god@laputa.namesys.com
  more i286 profiling stuff

ChangeSet@1.1131.1.10, 2003-01-21 16:03:11+03:00, god@laputa.namesys.com
  Merge god@thebsh.namesys.com:/home/bk/reiser4
  into laputa.namesys.com:/home/god/projects/2.5/fs/reiser4

ChangeSet@1.1136, 2003-01-22 12:48:08+03:00, vs@tribesman.namesys.com
  debugging code

ChangeSet@1.1131.5.1, 2003-01-21 15:27:10+03:00, zam@crimson.namesys.com
  eunflush does not prevent further e-flushes here 

ChangeSet@1.1135, 2003-01-21 12:59:38+03:00, vs@tribesman.namesys.com
  Merge vs@thebsh:/home/bk/reiser4
  into tribesman.namesys.com:/home/vs/reiser4-linux-2.5/fs/reiser4

ChangeSet@1.1131.4.4, 2003-01-21 15:55:57+03:00, edward@edward.namesys.com
  Added pointer to the cluster cache

ChangeSet@1.1131.4.3, 2003-04-20 22:16:29+04:00, zam@crimson.namesys.com
  fixing compilation if REISER4_STATS==0

ChangeSet@1.1131.4.2, 2003-04-20 21:20:10+04:00, zam@crimson.namesys.com
  typo 

ChangeSet@1.1131.3.2, 2003-04-20 20:51:18+04:00, zam@crimson.namesys.com
  added commit time stats

ChangeSet@1.1131.1.9, 2003-01-21 16:02:49+03:00, god@laputa.namesys.com
  move jput() to where it belongs properly---jnode.h

ChangeSet@1.1131.1.8, 2003-01-21 16:02:31+03:00, god@laputa.namesys.com
  i386 profiling

ChangeSet@1.1131.3.1, 2003-04-20 18:11:46+04:00, zam@crimson.namesys.com
  Merge zam@thebsh:/home/bk/reiser4
  into crimson.namesys.com:/home/shuric/work/uml/fs/reiser4

ChangeSet@1.1131.2.1, 2003-04-20 18:11:35+04:00, zam@crimson.namesys.com
  MTFLUSH semaphore statistics added

ChangeSet@1.1131.1.6, 2003-01-20 19:11:59+03:00, god@laputa.namesys.com
  fix race between jput() and writeback

ChangeSet@1.1131.1.5, 2003-01-20 19:10:12+03:00, god@laputa.namesys.com
  private_spinlock is located in i_data, rather than i_mapping

ChangeSet@1.1131.1.4, 2003-01-20 15:07:06+03:00, god@laputa.namesys.com
  fix context usage in statistics macros

ChangeSet@1.1131.1.3, 2003-01-20 13:46:14+03:00, god@laputa.namesys.com
  small cleanups

ChangeSet@1.1131.1.2, 2003-01-20 13:45:50+03:00, god@laputa.namesys.com
  add vfs calls statistics

ChangeSet@1.1131.1.1, 2003-04-20 12:47:56+04:00, zam@crimson.namesys.com
  add commit statistics 

ChangeSet@1.1134, 2003-01-21 12:54:51+03:00, vs@tribesman.namesys.com
  fixes of eflush list

ChangeSet@1.1133, 2003-01-21 11:54:27+03:00, vs@tribesman.namesys.com
  drop_enodes is added

ChangeSet@1.1132, 2003-01-20 11:25:20+03:00, vs@tribesman.namesys.com
  Merge vs@thebsh:/home/bk/reiser4
  into tribesman.namesys.com:/home/vs/reiser4-linux-2.5/fs/reiser4

ChangeSet@1.1131, 2003-04-17 22:00:38+04:00, zam@crimson.namesys.com
  wrong jrelse()

ChangeSet@1.1126.2.2, 2003-04-17 21:43:30+04:00, zam@crimson.namesys.com
  trivial fix

ChangeSet@1.1126.2.1, 2003-04-17 21:32:03+04:00, zam@crimson.namesys.com
  get e-fluhed nodes back before counting and allocating disk space for
  wandered nodes.

ChangeSet@1.1126.1.3, 2003-01-20 11:25:01+03:00, vs@tribesman.namesys.com
  reiser4_put_inode is started

ChangeSet@1.1126.1.2, 2003-01-17 20:26:59+03:00, vs@tribesman.namesys.com
  Merge vs@thebsh:/home/bk/reiser4
  into tribesman.namesys.com:/home/vs/reiser4-linux-2.5/fs/reiser4

ChangeSet@1.1129, 2003-01-17 21:47:28+03:00, god@laputa.namesys.com
  Merge god@thebsh.namesys.com:/home/bk/reiser4
  into laputa.namesys.com:/home/god/projects/2.5/fs/reiser4

ChangeSet@1.1126.1.1, 2003-04-17 17:37:58+04:00, zam@crimson.namesys.com
  Merge zam@thebsh:/home/bk/reiser4
  into crimson.namesys.com:/home/shuric/work/uml/fs/reiser4

ChangeSet@1.1125.1.2, 2003-04-17 17:37:48+04:00, zam@crimson.namesys.com
  after merge fixes

ChangeSet@1.1125.1.1, 2003-04-17 17:29:35+04:00, zam@crimson.namesys.com
  merging

ChangeSet@1.1123.1.2, 2003-04-17 17:09:15+04:00, zam@crimson.namesys.com
  adopting Green's sleepping functions profiling patch.

ChangeSet@1.1128, 2003-01-17 21:47:19+03:00, god@laputa.namesys.com
  more sysfs updates

ChangeSet@1.1127, 2003-01-17 17:23:33+03:00, god@laputa.namesys.com
  remove dead code

ChangeSet@1.1126, 2003-01-17 17:16:05+03:00, god@laputa.namesys.com
  more statistics fixes

ChangeSet@1.1125, 2003-01-17 16:19:33+03:00, god@laputa.namesys.com
  Merge god@thebsh.namesys.com:/home/bk/reiser4
  into laputa.namesys.com:/home/god/projects/2.5/fs/reiser4

ChangeSet@1.1123.1.1, 2003-01-17 14:27:50+03:00, vs@tribesman.namesys.com
  reiser4_kill_super: one more workaround

ChangeSet@1.1124, 2003-01-17 16:19:20+03:00, god@laputa.namesys.com
  statistics code cleanup

ChangeSet@1.1122, 2003-01-16 22:12:54+03:00, god@laputa.namesys.com
  conflict resolving

ChangeSet@1.1108.6.6, 2003-04-16 21:52:04+04:00, zam@crimson.namesys.com
  docs update

ChangeSet@1.1108.6.5, 2003-04-16 17:44:45+04:00, zam@crimson.namesys.com
  documentation update (not completed)
----------------------------------------------------------------------
Nikita.
