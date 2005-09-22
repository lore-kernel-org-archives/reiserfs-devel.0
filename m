From: Grzegorz Piotr Jaskiewicz <gj@kdemail.net>
Subject: compilation problems with gcc4
Date: Thu, 22 Sep 2005 13:26:48 +0200
Message-ID: <200509221326.49204@gj-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26229-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Trying to get beast to compile for me, to do review and testing here, I get 
following problems with gcc 4.0.2:

  CC [M]  fs/reiser4/debug.o
In file included from fs/reiser4/jnode.h:12,
                 from fs/reiser4/lock.h:16,
                 from fs/reiser4/context.h:15,
                 from fs/reiser4/debug.c:32:
fs/reiser4/txnmgr.h: In function 'spin_unlock_atom':
fs/reiser4/txnmgr.h:559: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
fs/reiser4/txnmgr.h: In function 'spin_unlock_txnh':
fs/reiser4/txnmgr.h:560: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
fs/reiser4/txnmgr.h: In function 'spin_unlock_txnmgr':
fs/reiser4/txnmgr.h:561: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
In file included from fs/reiser4/lock.h:16,
                 from fs/reiser4/context.h:15,
                 from fs/reiser4/debug.c:32:
fs/reiser4/jnode.h: In function 'spin_unlock_jnode':
fs/reiser4/jnode.h:351: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
fs/reiser4/jnode.h: In function 'spin_unlock_jload':
fs/reiser4/jnode.h:355: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
In file included from fs/reiser4/context.h:15,
                 from fs/reiser4/debug.c:32:
fs/reiser4/lock.h: In function 'spin_unlock_stack':
fs/reiser4/lock.h:220: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
In file included from fs/reiser4/super.h:11,
                 from fs/reiser4/debug.c:33:
fs/reiser4/tree.h: In function 'spin_unlock_epoch':
fs/reiser4/tree.h:177: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
In file included from fs/reiser4/debug.c:33:
fs/reiser4/super.h: In function 'spin_unlock_super':
fs/reiser4/super.h:420: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
fs/reiser4/super.h: In function 'spin_unlock_super_eflush':
fs/reiser4/super.h:423: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
  CC [M]  fs/reiser4/jnode.o
In file included from fs/reiser4/jnode.c:108:
fs/reiser4/txnmgr.h: In function 'spin_unlock_atom':
fs/reiser4/txnmgr.h:559: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
fs/reiser4/txnmgr.h: In function 'spin_unlock_txnh':
fs/reiser4/txnmgr.h:560: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
fs/reiser4/txnmgr.h: In function 'spin_unlock_txnmgr':
fs/reiser4/txnmgr.h:561: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
In file included from fs/reiser4/jnode.c:109:
fs/reiser4/jnode.h: In function 'spin_unlock_jnode':
fs/reiser4/jnode.h:351: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
fs/reiser4/jnode.h: In function 'spin_unlock_jload':
fs/reiser4/jnode.h:355: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
In file included from fs/reiser4/znode.h:18,
                 from fs/reiser4/jnode.c:110:
fs/reiser4/lock.h: In function 'spin_unlock_stack':
fs/reiser4/lock.h:220: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
In file included from fs/reiser4/jnode.c:111:
fs/reiser4/tree.h: In function 'spin_unlock_epoch':
fs/reiser4/tree.h:177: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
In file included from fs/reiser4/jnode.c:113:
fs/reiser4/super.h: In function 'spin_unlock_super':
fs/reiser4/super.h:420: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
fs/reiser4/super.h: In function 'spin_unlock_super_eflush':
fs/reiser4/super.h:423: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
In file included from fs/reiser4/jnode.c:114:
fs/reiser4/inode.h: In function 'spin_unlock_inode_object':
fs/reiser4/inode.h:277: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
  CC [M]  fs/reiser4/znode.o
In file included from fs/reiser4/znode.c:149:
fs/reiser4/txnmgr.h: In function 'spin_unlock_atom':
fs/reiser4/txnmgr.h:559: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
fs/reiser4/txnmgr.h: In function 'spin_unlock_txnh':
fs/reiser4/txnmgr.h:560: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
fs/reiser4/txnmgr.h: In function 'spin_unlock_txnmgr':
fs/reiser4/txnmgr.h:561: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
In file included from fs/reiser4/znode.c:150:
fs/reiser4/jnode.h: In function 'spin_unlock_jnode':
fs/reiser4/jnode.h:351: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
fs/reiser4/jnode.h: In function 'spin_unlock_jload':
fs/reiser4/jnode.h:355: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
In file included from fs/reiser4/znode.h:18,
                 from fs/reiser4/znode.c:151:
fs/reiser4/lock.h: In function 'spin_unlock_stack':
fs/reiser4/lock.h:220: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
In file included from fs/reiser4/znode.c:153:
fs/reiser4/tree.h: In function 'spin_unlock_epoch':
fs/reiser4/tree.h:177: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
In file included from fs/reiser4/znode.c:155:
fs/reiser4/super.h: In function 'spin_unlock_super':
fs/reiser4/super.h:420: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
fs/reiser4/super.h: In function 'spin_unlock_super_eflush':
fs/reiser4/super.h:423: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
fs/reiser4/znode.c: In function 'znode_set_ld_key':
fs/reiser4/znode.c:729: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
  CC [M]  fs/reiser4/key.o
In file included from fs/reiser4/jnode.h:12,
                 from fs/reiser4/tree.h:16,
                 from fs/reiser4/super.h:11,
                 from fs/reiser4/key.c:7:
fs/reiser4/txnmgr.h: In function 'spin_unlock_atom':
fs/reiser4/txnmgr.h:559: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
fs/reiser4/txnmgr.h: In function 'spin_unlock_txnh':
fs/reiser4/txnmgr.h:560: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
fs/reiser4/txnmgr.h: In function 'spin_unlock_txnmgr':
fs/reiser4/txnmgr.h:561: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
In file included from fs/reiser4/tree.h:16,
                 from fs/reiser4/super.h:11,
                 from fs/reiser4/key.c:7:
fs/reiser4/jnode.h: In function 'spin_unlock_jnode':
fs/reiser4/jnode.h:351: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
fs/reiser4/jnode.h: In function 'spin_unlock_jload':
fs/reiser4/jnode.h:355: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
In file included from fs/reiser4/znode.h:18,
                 from fs/reiser4/tree.h:17,
                 from fs/reiser4/super.h:11,
                 from fs/reiser4/key.c:7:
fs/reiser4/lock.h: In function 'spin_unlock_stack':
fs/reiser4/lock.h:220: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
In file included from fs/reiser4/super.h:11,
                 from fs/reiser4/key.c:7:
fs/reiser4/tree.h: In function 'spin_unlock_epoch':
fs/reiser4/tree.h:177: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
In file included from fs/reiser4/key.c:7:
fs/reiser4/super.h: In function 'spin_unlock_super':
fs/reiser4/super.h:420: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
fs/reiser4/super.h: In function 'spin_unlock_super_eflush':
fs/reiser4/super.h:423: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
  CC [M]  fs/reiser4/pool.o
In file included from fs/reiser4/jnode.h:12,
                 from fs/reiser4/tree.h:16,
                 from fs/reiser4/super.h:11,
                 from fs/reiser4/pool.c:49:
fs/reiser4/txnmgr.h: In function 'spin_unlock_atom':
fs/reiser4/txnmgr.h:559: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
fs/reiser4/txnmgr.h: In function 'spin_unlock_txnh':
fs/reiser4/txnmgr.h:560: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
fs/reiser4/txnmgr.h: In function 'spin_unlock_txnmgr':
fs/reiser4/txnmgr.h:561: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
In file included from fs/reiser4/tree.h:16,
                 from fs/reiser4/super.h:11,
                 from fs/reiser4/pool.c:49:
fs/reiser4/jnode.h: In function 'spin_unlock_jnode':
fs/reiser4/jnode.h:351: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
fs/reiser4/jnode.h: In function 'spin_unlock_jload':
fs/reiser4/jnode.h:355: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
In file included from fs/reiser4/znode.h:18,
                 from fs/reiser4/tree.h:17,
                 from fs/reiser4/super.h:11,
                 from fs/reiser4/pool.c:49:
fs/reiser4/lock.h: In function 'spin_unlock_stack':
fs/reiser4/lock.h:220: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
In file included from fs/reiser4/super.h:11,
                 from fs/reiser4/pool.c:49:
fs/reiser4/tree.h: In function 'spin_unlock_epoch':
fs/reiser4/tree.h:177: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
In file included from fs/reiser4/pool.c:49:
fs/reiser4/super.h: In function 'spin_unlock_super':
fs/reiser4/super.h:420: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
fs/reiser4/super.h: In function 'spin_unlock_super_eflush':
fs/reiser4/super.h:423: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
  CC [M]  fs/reiser4/tree_mod.o
In file included from fs/reiser4/jnode.h:12,
                 from fs/reiser4/tree_mod.c:23:
fs/reiser4/txnmgr.h: In function 'spin_unlock_atom':
fs/reiser4/txnmgr.h:559: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
fs/reiser4/txnmgr.h: In function 'spin_unlock_txnh':
fs/reiser4/txnmgr.h:560: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
fs/reiser4/txnmgr.h: In function 'spin_unlock_txnmgr':
fs/reiser4/txnmgr.h:561: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
In file included from fs/reiser4/tree_mod.c:23:
fs/reiser4/jnode.h: In function 'spin_unlock_jnode':
fs/reiser4/jnode.h:351: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
fs/reiser4/jnode.h: In function 'spin_unlock_jload':
fs/reiser4/jnode.h:355: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
In file included from fs/reiser4/znode.h:18,
                 from fs/reiser4/tree_mod.c:24:
fs/reiser4/lock.h: In function 'spin_unlock_stack':
fs/reiser4/lock.h:220: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
In file included from fs/reiser4/tree_mod.c:28:
fs/reiser4/tree.h: In function 'spin_unlock_epoch':
fs/reiser4/tree.h:177: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
In file included from fs/reiser4/tree_mod.c:29:
fs/reiser4/super.h: In function 'spin_unlock_super':
fs/reiser4/super.h:420: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
fs/reiser4/super.h: In function 'spin_unlock_super_eflush':
fs/reiser4/super.h:423: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
  CC [M]  fs/reiser4/estimate.o
In file included from fs/reiser4/jnode.h:12,
                 from fs/reiser4/tree.h:16,
                 from fs/reiser4/estimate.c:5:
fs/reiser4/txnmgr.h: In function 'spin_unlock_atom':
fs/reiser4/txnmgr.h:559: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
fs/reiser4/txnmgr.h: In function 'spin_unlock_txnh':
fs/reiser4/txnmgr.h:560: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
fs/reiser4/txnmgr.h: In function 'spin_unlock_txnmgr':
fs/reiser4/txnmgr.h:561: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
In file included from fs/reiser4/tree.h:16,
                 from fs/reiser4/estimate.c:5:
fs/reiser4/jnode.h: In function 'spin_unlock_jnode':
fs/reiser4/jnode.h:351: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
fs/reiser4/jnode.h: In function 'spin_unlock_jload':
fs/reiser4/jnode.h:355: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
In file included from fs/reiser4/znode.h:18,
                 from fs/reiser4/tree.h:17,
                 from fs/reiser4/estimate.c:5:
fs/reiser4/lock.h: In function 'spin_unlock_stack':
fs/reiser4/lock.h:220: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
In file included from fs/reiser4/estimate.c:5:
fs/reiser4/tree.h: In function 'spin_unlock_epoch':
fs/reiser4/tree.h:177: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
In file included from fs/reiser4/vfs_ops.h:15,
                 from fs/reiser4/inode.h:19,
                 from fs/reiser4/estimate.c:7:
fs/reiser4/super.h: In function 'spin_unlock_super':
fs/reiser4/super.h:420: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
fs/reiser4/super.h: In function 'spin_unlock_super_eflush':
fs/reiser4/super.h:423: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
In file included from fs/reiser4/estimate.c:7:
fs/reiser4/inode.h: In function 'spin_unlock_inode_object':
fs/reiser4/inode.h:277: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
  CC [M]  fs/reiser4/carry.o
In file included from fs/reiser4/jnode.h:12,
                 from fs/reiser4/carry.c:138:
fs/reiser4/txnmgr.h: In function 'spin_unlock_atom':
fs/reiser4/txnmgr.h:559: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
fs/reiser4/txnmgr.h: In function 'spin_unlock_txnh':
fs/reiser4/txnmgr.h:560: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
fs/reiser4/txnmgr.h: In function 'spin_unlock_txnmgr':
fs/reiser4/txnmgr.h:561: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
In file included from fs/reiser4/carry.c:138:
fs/reiser4/jnode.h: In function 'spin_unlock_jnode':
fs/reiser4/jnode.h:351: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
fs/reiser4/jnode.h: In function 'spin_unlock_jload':
fs/reiser4/jnode.h:355: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
In file included from fs/reiser4/znode.h:18,
                 from fs/reiser4/carry.c:139:
fs/reiser4/lock.h: In function 'spin_unlock_stack':
fs/reiser4/lock.h:220: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
In file included from fs/reiser4/carry.c:144:
fs/reiser4/tree.h: In function 'spin_unlock_epoch':
fs/reiser4/tree.h:177: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
In file included from fs/reiser4/carry.c:147:
fs/reiser4/super.h: In function 'spin_unlock_super':
fs/reiser4/super.h:420: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
fs/reiser4/super.h: In function 'spin_unlock_super_eflush':
fs/reiser4/super.h:423: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
  CC [M]  fs/reiser4/carry_ops.o
In file included from fs/reiser4/jnode.h:12,
                 from fs/reiser4/carry_ops.c:11:
fs/reiser4/txnmgr.h: In function 'spin_unlock_atom':
fs/reiser4/txnmgr.h:559: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
fs/reiser4/txnmgr.h: In function 'spin_unlock_txnh':
fs/reiser4/txnmgr.h:560: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
fs/reiser4/txnmgr.h: In function 'spin_unlock_txnmgr':
fs/reiser4/txnmgr.h:561: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
In file included from fs/reiser4/carry_ops.c:11:
fs/reiser4/jnode.h: In function 'spin_unlock_jnode':
fs/reiser4/jnode.h:351: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
fs/reiser4/jnode.h: In function 'spin_unlock_jload':
fs/reiser4/jnode.h:355: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
In file included from fs/reiser4/znode.h:18,
                 from fs/reiser4/carry_ops.c:12:
fs/reiser4/lock.h: In function 'spin_unlock_stack':
fs/reiser4/lock.h:220: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
In file included from fs/reiser4/carry_ops.c:19:
fs/reiser4/tree.h: In function 'spin_unlock_epoch':
fs/reiser4/tree.h:177: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
In file included from fs/reiser4/carry_ops.c:20:
fs/reiser4/super.h: In function 'spin_unlock_super':
fs/reiser4/super.h:420: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
fs/reiser4/super.h: In function 'spin_unlock_super_eflush':
fs/reiser4/super.h:423: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
  CC [M]  fs/reiser4/lock.o
In file included from fs/reiser4/lock.c:211:
fs/reiser4/txnmgr.h: In function 'spin_unlock_atom':
fs/reiser4/txnmgr.h:559: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
fs/reiser4/txnmgr.h: In function 'spin_unlock_txnh':
fs/reiser4/txnmgr.h:560: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
fs/reiser4/txnmgr.h: In function 'spin_unlock_txnmgr':
fs/reiser4/txnmgr.h:561: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
In file included from fs/reiser4/znode.h:17,
                 from fs/reiser4/lock.c:212:
fs/reiser4/jnode.h: In function 'spin_unlock_jnode':
fs/reiser4/jnode.h:351: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
fs/reiser4/jnode.h: In function 'spin_unlock_jload':
fs/reiser4/jnode.h:355: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
In file included from fs/reiser4/znode.h:18,
                 from fs/reiser4/lock.c:212:
fs/reiser4/lock.h: In function 'spin_unlock_stack':
fs/reiser4/lock.h:220: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
In file included from fs/reiser4/lock.c:214:
fs/reiser4/tree.h: In function 'spin_unlock_epoch':
fs/reiser4/tree.h:177: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
In file included from fs/reiser4/lock.c:216:
fs/reiser4/super.h: In function 'spin_unlock_super':
fs/reiser4/super.h:420: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
fs/reiser4/super.h: In function 'spin_unlock_super_eflush':
fs/reiser4/super.h:423: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
  CC [M]  fs/reiser4/tree.o
In file included from fs/reiser4/tree.c:180:
fs/reiser4/txnmgr.h: In function 'spin_unlock_atom':
fs/reiser4/txnmgr.h:559: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
fs/reiser4/txnmgr.h: In function 'spin_unlock_txnh':
fs/reiser4/txnmgr.h:560: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
fs/reiser4/txnmgr.h: In function 'spin_unlock_txnmgr':
fs/reiser4/txnmgr.h:561: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
In file included from fs/reiser4/tree.c:181:
fs/reiser4/jnode.h: In function 'spin_unlock_jnode':
fs/reiser4/jnode.h:351: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
fs/reiser4/jnode.h: In function 'spin_unlock_jload':
fs/reiser4/jnode.h:355: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
In file included from fs/reiser4/znode.h:18,
                 from fs/reiser4/tree.c:182:
fs/reiser4/lock.h: In function 'spin_unlock_stack':
fs/reiser4/lock.h:220: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
In file included from fs/reiser4/tree.c:188:
fs/reiser4/tree.h: In function 'spin_unlock_epoch':
fs/reiser4/tree.h:177: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
In file included from fs/reiser4/vfs_ops.h:15,
                 from fs/reiser4/tree.c:189:
fs/reiser4/super.h: In function 'spin_unlock_super':
fs/reiser4/super.h:420: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
fs/reiser4/super.h: In function 'spin_unlock_super_eflush':
fs/reiser4/super.h:423: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
In file included from fs/reiser4/tree.c:193:
fs/reiser4/inode.h: In function 'spin_unlock_inode_object':
fs/reiser4/inode.h:277: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
  CC [M]  fs/reiser4/context.o
In file included from fs/reiser4/jnode.h:12,
                 from fs/reiser4/tree.h:16,
                 from fs/reiser4/super.h:11,
                 from fs/reiser4/context.c:37:
fs/reiser4/txnmgr.h: In function 'spin_unlock_atom':
fs/reiser4/txnmgr.h:559: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
fs/reiser4/txnmgr.h: In function 'spin_unlock_txnh':
fs/reiser4/txnmgr.h:560: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
fs/reiser4/txnmgr.h: In function 'spin_unlock_txnmgr':
fs/reiser4/txnmgr.h:561: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
In file included from fs/reiser4/tree.h:16,
                 from fs/reiser4/super.h:11,
                 from fs/reiser4/context.c:37:
fs/reiser4/jnode.h: In function 'spin_unlock_jnode':
fs/reiser4/jnode.h:351: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
fs/reiser4/jnode.h: In function 'spin_unlock_jload':
fs/reiser4/jnode.h:355: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
In file included from fs/reiser4/znode.h:18,
                 from fs/reiser4/tree.h:17,
                 from fs/reiser4/super.h:11,
                 from fs/reiser4/context.c:37:
fs/reiser4/lock.h: In function 'spin_unlock_stack':
fs/reiser4/lock.h:220: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
In file included from fs/reiser4/super.h:11,
                 from fs/reiser4/context.c:37:
fs/reiser4/tree.h: In function 'spin_unlock_epoch':
fs/reiser4/tree.h:177: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
In file included from fs/reiser4/context.c:37:
fs/reiser4/super.h: In function 'spin_unlock_super':
fs/reiser4/super.h:420: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
fs/reiser4/super.h: In function 'spin_unlock_super_eflush':
fs/reiser4/super.h:423: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
  CC [M]  fs/reiser4/tap.o
In file included from fs/reiser4/jnode.h:12,
                 from fs/reiser4/tree.h:16,
                 from fs/reiser4/tap.c:19:
fs/reiser4/txnmgr.h: In function 'spin_unlock_atom':
fs/reiser4/txnmgr.h:559: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
fs/reiser4/txnmgr.h: In function 'spin_unlock_txnh':
fs/reiser4/txnmgr.h:560: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
fs/reiser4/txnmgr.h: In function 'spin_unlock_txnmgr':
fs/reiser4/txnmgr.h:561: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
In file included from fs/reiser4/tree.h:16,
                 from fs/reiser4/tap.c:19:
fs/reiser4/jnode.h: In function 'spin_unlock_jnode':
fs/reiser4/jnode.h:351: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
fs/reiser4/jnode.h: In function 'spin_unlock_jload':
fs/reiser4/jnode.h:355: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
In file included from fs/reiser4/znode.h:18,
                 from fs/reiser4/tree.h:17,
                 from fs/reiser4/tap.c:19:
fs/reiser4/lock.h: In function 'spin_unlock_stack':
fs/reiser4/lock.h:220: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
In file included from fs/reiser4/tap.c:19:
fs/reiser4/tree.h: In function 'spin_unlock_epoch':
fs/reiser4/tree.h:177: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
  CC [M]  fs/reiser4/coord.o
In file included from fs/reiser4/jnode.h:12,
                 from fs/reiser4/tree.h:16,
                 from fs/reiser4/coord.c:6:
fs/reiser4/txnmgr.h: In function 'spin_unlock_atom':
fs/reiser4/txnmgr.h:559: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
fs/reiser4/txnmgr.h: In function 'spin_unlock_txnh':
fs/reiser4/txnmgr.h:560: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
fs/reiser4/txnmgr.h: In function 'spin_unlock_txnmgr':
fs/reiser4/txnmgr.h:561: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
In file included from fs/reiser4/tree.h:16,
                 from fs/reiser4/coord.c:6:
fs/reiser4/jnode.h: In function 'spin_unlock_jnode':
fs/reiser4/jnode.h:351: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
fs/reiser4/jnode.h: In function 'spin_unlock_jload':
fs/reiser4/jnode.h:355: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
In file included from fs/reiser4/znode.h:18,
                 from fs/reiser4/tree.h:17,
                 from fs/reiser4/coord.c:6:
fs/reiser4/lock.h: In function 'spin_unlock_stack':
fs/reiser4/lock.h:220: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
In file included from fs/reiser4/coord.c:6:
fs/reiser4/tree.h: In function 'spin_unlock_epoch':
fs/reiser4/tree.h:177: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
  CC [M]  fs/reiser4/block_alloc.o
In file included from fs/reiser4/block_alloc.c:6:
fs/reiser4/txnmgr.h: In function 'spin_unlock_atom':
fs/reiser4/txnmgr.h:559: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
fs/reiser4/txnmgr.h: In function 'spin_unlock_txnh':
fs/reiser4/txnmgr.h:560: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
fs/reiser4/txnmgr.h: In function 'spin_unlock_txnmgr':
fs/reiser4/txnmgr.h:561: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
In file included from fs/reiser4/znode.h:17,
                 from fs/reiser4/block_alloc.c:7:
fs/reiser4/jnode.h: In function 'spin_unlock_jnode':
fs/reiser4/jnode.h:351: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
fs/reiser4/jnode.h: In function 'spin_unlock_jload':
fs/reiser4/jnode.h:355: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
In file included from fs/reiser4/znode.h:18,
                 from fs/reiser4/block_alloc.c:7:
fs/reiser4/lock.h: In function 'spin_unlock_stack':
fs/reiser4/lock.h:220: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
In file included from fs/reiser4/block_alloc.c:9:
fs/reiser4/tree.h: In function 'spin_unlock_epoch':
fs/reiser4/tree.h:177: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
In file included from fs/reiser4/block_alloc.c:10:
fs/reiser4/super.h: In function 'spin_unlock_super':
fs/reiser4/super.h:420: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
fs/reiser4/super.h: In function 'spin_unlock_super_eflush':
fs/reiser4/super.h:423: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
  CC [M]  fs/reiser4/txnmgr.o
In file included from fs/reiser4/txnmgr.c:223:
fs/reiser4/txnmgr.h: In function 'spin_unlock_atom':
fs/reiser4/txnmgr.h:559: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
fs/reiser4/txnmgr.h: In function 'spin_unlock_txnh':
fs/reiser4/txnmgr.h:560: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
fs/reiser4/txnmgr.h: In function 'spin_unlock_txnmgr':
fs/reiser4/txnmgr.h:561: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
In file included from fs/reiser4/txnmgr.c:224:
fs/reiser4/jnode.h: In function 'spin_unlock_jnode':
fs/reiser4/jnode.h:351: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
fs/reiser4/jnode.h: In function 'spin_unlock_jload':
fs/reiser4/jnode.h:355: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
In file included from fs/reiser4/znode.h:18,
                 from fs/reiser4/txnmgr.c:225:
fs/reiser4/lock.h: In function 'spin_unlock_stack':
fs/reiser4/lock.h:220: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
In file included from fs/reiser4/txnmgr.c:227:
fs/reiser4/tree.h: In function 'spin_unlock_epoch':
fs/reiser4/tree.h:177: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
In file included from fs/reiser4/txnmgr.c:230:
fs/reiser4/super.h: In function 'spin_unlock_super':
fs/reiser4/super.h:420: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
fs/reiser4/super.h: In function 'spin_unlock_super_eflush':
fs/reiser4/super.h:423: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
In file included from fs/reiser4/txnmgr.c:234:
fs/reiser4/inode.h: In function 'spin_unlock_inode_object':
fs/reiser4/inode.h:277: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
  CC [M]  fs/reiser4/kassign.o
In file included from fs/reiser4/jnode.h:12,
                 from fs/reiser4/tree.h:16,
                 from fs/reiser4/super.h:11,
                 from fs/reiser4/vfs_ops.h:15,
                 from fs/reiser4/kassign.c:200:
fs/reiser4/txnmgr.h: In function 'spin_unlock_atom':
fs/reiser4/txnmgr.h:559: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
fs/reiser4/txnmgr.h: In function 'spin_unlock_txnh':
fs/reiser4/txnmgr.h:560: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
fs/reiser4/txnmgr.h: In function 'spin_unlock_txnmgr':
fs/reiser4/txnmgr.h:561: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
In file included from fs/reiser4/tree.h:16,
                 from fs/reiser4/super.h:11,
                 from fs/reiser4/vfs_ops.h:15,
                 from fs/reiser4/kassign.c:200:
fs/reiser4/jnode.h: In function 'spin_unlock_jnode':
fs/reiser4/jnode.h:351: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
fs/reiser4/jnode.h: In function 'spin_unlock_jload':
fs/reiser4/jnode.h:355: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
In file included from fs/reiser4/znode.h:18,
                 from fs/reiser4/tree.h:17,
                 from fs/reiser4/super.h:11,
                 from fs/reiser4/vfs_ops.h:15,
                 from fs/reiser4/kassign.c:200:
fs/reiser4/lock.h: In function 'spin_unlock_stack':
fs/reiser4/lock.h:220: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
In file included from fs/reiser4/super.h:11,
                 from fs/reiser4/vfs_ops.h:15,
                 from fs/reiser4/kassign.c:200:
fs/reiser4/tree.h: In function 'spin_unlock_epoch':
fs/reiser4/tree.h:177: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
In file included from fs/reiser4/vfs_ops.h:15,
                 from fs/reiser4/kassign.c:200:
fs/reiser4/super.h: In function 'spin_unlock_super':
fs/reiser4/super.h:420: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
fs/reiser4/super.h: In function 'spin_unlock_super_eflush':
fs/reiser4/super.h:423: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
In file included from fs/reiser4/kassign.c:201:
fs/reiser4/inode.h: In function 'spin_unlock_inode_object':
fs/reiser4/inode.h:277: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
  CC [M]  fs/reiser4/flush.o
In file included from fs/reiser4/flush.c:14:
fs/reiser4/txnmgr.h: In function 'spin_unlock_atom':
fs/reiser4/txnmgr.h:559: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
fs/reiser4/txnmgr.h: In function 'spin_unlock_txnh':
fs/reiser4/txnmgr.h:560: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
fs/reiser4/txnmgr.h: In function 'spin_unlock_txnmgr':
fs/reiser4/txnmgr.h:561: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
In file included from fs/reiser4/flush.c:15:
fs/reiser4/jnode.h: In function 'spin_unlock_jnode':
fs/reiser4/jnode.h:351: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
fs/reiser4/jnode.h: In function 'spin_unlock_jload':
fs/reiser4/jnode.h:355: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
In file included from fs/reiser4/znode.h:18,
                 from fs/reiser4/flush.c:16:
fs/reiser4/lock.h: In function 'spin_unlock_stack':
fs/reiser4/lock.h:220: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
In file included from fs/reiser4/flush.c:20:
fs/reiser4/tree.h: In function 'spin_unlock_epoch':
fs/reiser4/tree.h:177: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
In file included from fs/reiser4/vfs_ops.h:15,
                 from fs/reiser4/flush.c:21:
fs/reiser4/super.h: In function 'spin_unlock_super':
fs/reiser4/super.h:420: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
fs/reiser4/super.h: In function 'spin_unlock_super_eflush':
fs/reiser4/super.h:423: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
In file included from fs/reiser4/flush.c:22:
fs/reiser4/inode.h: In function 'spin_unlock_inode_object':
fs/reiser4/inode.h:277: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
  CC [M]  fs/reiser4/wander.o
In file included from fs/reiser4/wander.c:166:
fs/reiser4/txnmgr.h: In function 'spin_unlock_atom':
fs/reiser4/txnmgr.h:559: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
fs/reiser4/txnmgr.h: In function 'spin_unlock_txnh':
fs/reiser4/txnmgr.h:560: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
fs/reiser4/txnmgr.h: In function 'spin_unlock_txnmgr':
fs/reiser4/txnmgr.h:561: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
In file included from fs/reiser4/wander.c:167:
fs/reiser4/jnode.h: In function 'spin_unlock_jnode':
fs/reiser4/jnode.h:351: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
fs/reiser4/jnode.h: In function 'spin_unlock_jload':
fs/reiser4/jnode.h:355: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
In file included from fs/reiser4/znode.h:18,
                 from fs/reiser4/wander.c:168:
fs/reiser4/lock.h: In function 'spin_unlock_stack':
fs/reiser4/lock.h:220: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
In file included from fs/reiser4/super.h:11,
                 from fs/reiser4/wander.c:173:
fs/reiser4/tree.h: In function 'spin_unlock_epoch':
fs/reiser4/tree.h:177: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
In file included from fs/reiser4/wander.c:173:
fs/reiser4/super.h: In function 'spin_unlock_super':
fs/reiser4/super.h:420: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
fs/reiser4/super.h: In function 'spin_unlock_super_eflush':
fs/reiser4/super.h:423: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
In file included from fs/reiser4/wander.c:176:
fs/reiser4/inode.h: In function 'spin_unlock_inode_object':
fs/reiser4/inode.h:277: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
  CC [M]  fs/reiser4/eottl.o
In file included from fs/reiser4/jnode.h:12,
                 from fs/reiser4/znode.h:17,
                 from fs/reiser4/eottl.c:9:
fs/reiser4/txnmgr.h: In function 'spin_unlock_atom':
fs/reiser4/txnmgr.h:559: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
fs/reiser4/txnmgr.h: In function 'spin_unlock_txnh':
fs/reiser4/txnmgr.h:560: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
fs/reiser4/txnmgr.h: In function 'spin_unlock_txnmgr':
fs/reiser4/txnmgr.h:561: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
In file included from fs/reiser4/znode.h:17,
                 from fs/reiser4/eottl.c:9:
fs/reiser4/jnode.h: In function 'spin_unlock_jnode':
fs/reiser4/jnode.h:351: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
fs/reiser4/jnode.h: In function 'spin_unlock_jload':
fs/reiser4/jnode.h:355: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
In file included from fs/reiser4/znode.h:18,
                 from fs/reiser4/eottl.c:9:
fs/reiser4/lock.h: In function 'spin_unlock_stack':
fs/reiser4/lock.h:220: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
In file included from fs/reiser4/eottl.c:14:
fs/reiser4/tree.h: In function 'spin_unlock_epoch':
fs/reiser4/tree.h:177: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
In file included from fs/reiser4/eottl.c:15:
fs/reiser4/super.h: In function 'spin_unlock_super':
fs/reiser4/super.h:420: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
fs/reiser4/super.h: In function 'spin_unlock_super_eflush':
fs/reiser4/super.h:423: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
  CC [M]  fs/reiser4/search.o
In file included from fs/reiser4/jnode.h:12,
                 from fs/reiser4/search.c:13:
fs/reiser4/txnmgr.h: In function 'spin_unlock_atom':
fs/reiser4/txnmgr.h:559: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
fs/reiser4/txnmgr.h: In function 'spin_unlock_txnh':
fs/reiser4/txnmgr.h:560: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
fs/reiser4/txnmgr.h: In function 'spin_unlock_txnmgr':
fs/reiser4/txnmgr.h:561: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
In file included from fs/reiser4/search.c:13:
fs/reiser4/jnode.h: In function 'spin_unlock_jnode':
fs/reiser4/jnode.h:351: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
fs/reiser4/jnode.h: In function 'spin_unlock_jload':
fs/reiser4/jnode.h:355: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
In file included from fs/reiser4/znode.h:18,
                 from fs/reiser4/search.c:14:
fs/reiser4/lock.h: In function 'spin_unlock_stack':
fs/reiser4/lock.h:220: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
In file included from fs/reiser4/search.c:17:
fs/reiser4/tree.h: In function 'spin_unlock_epoch':
fs/reiser4/tree.h:177: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
In file included from fs/reiser4/search.c:19:
fs/reiser4/super.h: In function 'spin_unlock_super':
fs/reiser4/super.h:420: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
fs/reiser4/super.h: In function 'spin_unlock_super_eflush':
fs/reiser4/super.h:423: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
In file included from fs/reiser4/search.c:20:
fs/reiser4/inode.h: In function 'spin_unlock_inode_object':
fs/reiser4/inode.h:277: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
  CC [M]  fs/reiser4/page_cache.o
In file included from fs/reiser4/page_cache.c:174:
fs/reiser4/txnmgr.h: In function 'spin_unlock_atom':
fs/reiser4/txnmgr.h:559: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
fs/reiser4/txnmgr.h: In function 'spin_unlock_txnh':
fs/reiser4/txnmgr.h:560: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
fs/reiser4/txnmgr.h: In function 'spin_unlock_txnmgr':
fs/reiser4/txnmgr.h:561: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
In file included from fs/reiser4/page_cache.c:175:
fs/reiser4/jnode.h: In function 'spin_unlock_jnode':
fs/reiser4/jnode.h:351: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
fs/reiser4/jnode.h: In function 'spin_unlock_jload':
fs/reiser4/jnode.h:355: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
In file included from fs/reiser4/znode.h:18,
                 from fs/reiser4/page_cache.c:176:
fs/reiser4/lock.h: In function 'spin_unlock_stack':
fs/reiser4/lock.h:220: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
In file included from fs/reiser4/page_cache.c:178:
fs/reiser4/tree.h: In function 'spin_unlock_epoch':
fs/reiser4/tree.h:177: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
In file included from fs/reiser4/vfs_ops.h:15,
                 from fs/reiser4/page_cache.c:179:
fs/reiser4/super.h: In function 'spin_unlock_super':
fs/reiser4/super.h:420: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
fs/reiser4/super.h: In function 'spin_unlock_super_eflush':
fs/reiser4/super.h:423: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
In file included from fs/reiser4/page_cache.c:180:
fs/reiser4/inode.h: In function 'spin_unlock_inode_object':
fs/reiser4/inode.h:277: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
  CC [M]  fs/reiser4/kcond.o
  CC [M]  fs/reiser4/seal.o
In file included from fs/reiser4/jnode.h:12,
                 from fs/reiser4/seal.c:42:
fs/reiser4/txnmgr.h: In function 'spin_unlock_atom':
fs/reiser4/txnmgr.h:559: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
fs/reiser4/txnmgr.h: In function 'spin_unlock_txnh':
fs/reiser4/txnmgr.h:560: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
fs/reiser4/txnmgr.h: In function 'spin_unlock_txnmgr':
fs/reiser4/txnmgr.h:561: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
In file included from fs/reiser4/seal.c:42:
fs/reiser4/jnode.h: In function 'spin_unlock_jnode':
fs/reiser4/jnode.h:351: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
fs/reiser4/jnode.h: In function 'spin_unlock_jload':
fs/reiser4/jnode.h:355: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
In file included from fs/reiser4/znode.h:18,
                 from fs/reiser4/seal.c:43:
fs/reiser4/lock.h: In function 'spin_unlock_stack':
fs/reiser4/lock.h:220: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
In file included from fs/reiser4/super.h:11,
                 from fs/reiser4/seal.c:44:
fs/reiser4/tree.h: In function 'spin_unlock_epoch':
fs/reiser4/tree.h:177: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
In file included from fs/reiser4/seal.c:44:
fs/reiser4/super.h: In function 'spin_unlock_super':
fs/reiser4/super.h:420: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
fs/reiser4/super.h: In function 'spin_unlock_super_eflush':
fs/reiser4/super.h:423: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
  CC [M]  fs/reiser4/dscale.o
  CC [M]  fs/reiser4/flush_queue.o
In file included from fs/reiser4/jnode.h:12,
                 from fs/reiser4/tree.h:16,
                 from fs/reiser4/super.h:11,
                 from fs/reiser4/flush_queue.c:5:
fs/reiser4/txnmgr.h: In function 'spin_unlock_atom':
fs/reiser4/txnmgr.h:559: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
fs/reiser4/txnmgr.h: In function 'spin_unlock_txnh':
fs/reiser4/txnmgr.h:560: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
fs/reiser4/txnmgr.h: In function 'spin_unlock_txnmgr':
fs/reiser4/txnmgr.h:561: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
In file included from fs/reiser4/tree.h:16,
                 from fs/reiser4/super.h:11,
                 from fs/reiser4/flush_queue.c:5:
fs/reiser4/jnode.h: In function 'spin_unlock_jnode':
fs/reiser4/jnode.h:351: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
fs/reiser4/jnode.h: In function 'spin_unlock_jload':
fs/reiser4/jnode.h:355: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
In file included from fs/reiser4/znode.h:18,
                 from fs/reiser4/tree.h:17,
                 from fs/reiser4/super.h:11,
                 from fs/reiser4/flush_queue.c:5:
fs/reiser4/lock.h: In function 'spin_unlock_stack':
fs/reiser4/lock.h:220: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
In file included from fs/reiser4/super.h:11,
                 from fs/reiser4/flush_queue.c:5:
fs/reiser4/tree.h: In function 'spin_unlock_epoch':
fs/reiser4/tree.h:177: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
In file included from fs/reiser4/flush_queue.c:5:
fs/reiser4/super.h: In function 'spin_unlock_super':
fs/reiser4/super.h:420: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
fs/reiser4/super.h: In function 'spin_unlock_super_eflush':
fs/reiser4/super.h:423: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
fs/reiser4/flush_queue.c: In function 'spin_unlock_fq':
fs/reiser4/flush_queue.c:31: warning: comparisons like X<=Y<=Z do not have 
their mathematical meaning
  CC [M]  fs/reiser4/ktxnmgrd.o
In file included from fs/reiser4/ktxnmgrd.c:27:
fs/reiser4/txnmgr.h: In function 'spin_unlock_atom':
fs/reiser4/txnmgr.h:559: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
fs/reiser4/txnmgr.h: In function 'spin_unlock_txnh':
fs/reiser4/txnmgr.h:560: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
fs/reiser4/txnmgr.h: In function 'spin_unlock_txnmgr':
fs/reiser4/txnmgr.h:561: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
In file included from fs/reiser4/tree.h:16,
                 from fs/reiser4/ktxnmgrd.c:28:
fs/reiser4/jnode.h: In function 'spin_unlock_jnode':
fs/reiser4/jnode.h:351: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
fs/reiser4/jnode.h: In function 'spin_unlock_jload':
fs/reiser4/jnode.h:355: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
In file included from fs/reiser4/znode.h:18,
                 from fs/reiser4/tree.h:17,
                 from fs/reiser4/ktxnmgrd.c:28:
fs/reiser4/lock.h: In function 'spin_unlock_stack':
fs/reiser4/lock.h:220: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
In file included from fs/reiser4/ktxnmgrd.c:28:
fs/reiser4/tree.h: In function 'spin_unlock_epoch':
fs/reiser4/tree.h:177: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
In file included from fs/reiser4/ktxnmgrd.c:30:
fs/reiser4/super.h: In function 'spin_unlock_super':
fs/reiser4/super.h:420: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
fs/reiser4/super.h: In function 'spin_unlock_super_eflush':
fs/reiser4/super.h:423: warning: comparisons like X<=Y<=Z do not have their 
mathematical meaning
fs/reiser4/ktxnmgrd.c: In function 'ktxnmgrd':
fs/reiser4/ktxnmgrd.c:112: error: too many arguments to function 
'refrigerator'
make[2]: *** [fs/reiser4/ktxnmgrd.o] Error 1
make[1]: *** [fs/reiser4] Error 2
make: *** [fs] Error 2

That's reiserfs4 patch from ftp.namesys.com called:
reiser4-for-2.6.12-3.patch
gcc (GCC) 4.0.2 20050917 (prerelease)

I already requested that patch update to possible newest snapshot from 
namesys'es cvs or whatever they use.

Thanks.
 
-- 
GJ

Binary system, you're either 1 or 0...
dead or alive ;)
