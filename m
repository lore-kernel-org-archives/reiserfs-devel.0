From: Domenico Andreoli <cavok@tiscali.it>
Subject: snapshot 2004.03.26 + linux 2.6.5 = build error
Date: Sun, 4 Apr 2004 18:10:30 +0200
Sender: Domenico Andreoli <cavok@libero.it>
Message-ID: <20040404161030.GA21978@raptus.homelinux.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-17693-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

hi there,

today i applied latest snapshot to linux kernel 2.6.5 and tried to
build it.

patch didn't apply cleanly, there were some hunks and a reject on
arch/sparc/kernel/init_task.c which looked trivial to fix.

problem arrived on reiser4 kernel module (i'm using as module with no
problems), build error follows:


  CC [M]  fs/reiser4/as_ops.o
fs/reiser4/as_ops.c: In function `move_inode_out_from_sync_inodes_loop':
fs/reiser4/as_ops.c:570: error: structure has no member named `dirtied_when'
make[4]: *** [fs/reiser4/as_ops.o] Error 1


any hotfix for this?

cheers
domenico

-----[ Domenico Andreoli, aka cavok
 --[ http://filibusta.crema.unimi.it/~cavok/gpgkey.asc
   ---[ 3A0F 2F80 F79C 678A 8936  4FEE 0677 9033 A20E BC50
