From: Cliff White <cliffw@osdl.org>
Subject: build failure, 11/12 snapshot
Date: Tue, 12 Nov 2002 08:54:21 -0800
Message-ID: <200211121654.gACGsL613330@mail.osdl.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11974-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nikita@namesys.com, Reiserfs-List@namesys.com


Clean linux-2.5.47 ftp.kernel.org source + latest snapshot.

-----------------------------------
make -f scripts/Makefile.build obj=fs/reiser4
  gcc -Wp,-MD,fs/reiser4/.debug.o.d -D__KERNEL__ -Iinclude -Wall 
-Wstrict-prototypes -Wno-trigraphs -O2 -fomit-frame-pointer 
-fno-strict-aliasing -fno-common -pipe -mpreferred-stack-boundary=2 
-march=i686 -Iarch/i386/mach-generic -nostdinc -iwithprefix include    
-DKBUILD_BASENAME=debug   -c -o fs/reiser4/debug.o fs/reiser4/debug.c
In file included from fs/reiser4/jnode.h:11,
                 from fs/reiser4/tree.h:15,
                 from fs/reiser4/super.h:10,
                 from fs/reiser4/debug.c:6:
fs/reiser4/txnmgr.h: In function `spin_atom_is_locked':
fs/reiser4/txnmgr.h:424: structure has no member named `owner'
fs/reiser4/txnmgr.h:424: warning: control reaches end of non-void function
fs/reiser4/txnmgr.h: In function `spin_atom_is_not_locked':
fs/reiser4/txnmgr.h:424: structure has no member named `owner'
fs/reiser4/txnmgr.h:424: warning: control reaches end of non-void function
fs/reiser4/txnmgr.h: In function `spin_txnh_is_locked':
fs/reiser4/txnmgr.h:425: structure has no member named `owner'
fs/reiser4/txnmgr.h:425: warning: control reaches end of non-void function
fs/reiser4/txnmgr.h: In function `spin_txnh_is_not_locked':
fs/reiser4/txnmgr.h:425: structure has no member named `owner'
fs/reiser4/txnmgr.h:425: warning: control reaches end of non-void function
fs/reiser4/txnmgr.h: In function `spin_txnmgr_is_locked':
fs/reiser4/txnmgr.h:426: structure has no member named `owner'
fs/reiser4/txnmgr.h:426: warning: control reaches end of non-void function
fs/reiser4/txnmgr.h: In function `spin_txnmgr_is_not_locked':
fs/reiser4/txnmgr.h:426: structure has no member named `owner'
fs/reiser4/txnmgr.h:426: warning: control reaches end of non-void function
In file included from fs/reiser4/tree.h:15,
                 from fs/reiser4/super.h:10,
                 from fs/reiser4/debug.c:6:
fs/reiser4/jnode.h: In function `spin_jnode_is_locked':
fs/reiser4/jnode.h:190: structure has no member named `owner'
fs/reiser4/jnode.h:190: warning: control reaches end of non-void function
fs/reiser4/jnode.h: In function `spin_jnode_is_not_locked':
fs/reiser4/jnode.h:190: structure has no member named `owner'
fs/reiser4/jnode.h:190: warning: control reaches end of non-void function
In file included from fs/reiser4/tree.h:16,
                 from fs/reiser4/super.h:10,
                 from fs/reiser4/debug.c:6:
fs/reiser4/znode.h: In function `spin_stack_is_locked':
fs/reiser4/znode.h:314: structure has no member named `owner'
fs/reiser4/znode.h:314: warning: control reaches end of non-void function
fs/reiser4/znode.h: In function `spin_stack_is_not_locked':
fs/reiser4/znode.h:314: structure has no member named `owner'
fs/reiser4/znode.h:314: warning: control reaches end of non-void function
In file included from fs/reiser4/super.h:10,
                 from fs/reiser4/debug.c:6:
fs/reiser4/tree.h: In function `spin_tree_is_locked':
fs/reiser4/tree.h:640: structure has no member named `owner'
fs/reiser4/tree.h:640: warning: control reaches end of non-void function
fs/reiser4/tree.h: In function `spin_tree_is_not_locked':
fs/reiser4/tree.h:640: structure has no member named `owner'
fs/reiser4/tree.h:640: warning: control reaches end of non-void function
fs/reiser4/tree.h: In function `spin_dk_is_locked':
fs/reiser4/tree.h:648: structure has no member named `owner'
fs/reiser4/tree.h:648: warning: control reaches end of non-void function
fs/reiser4/tree.h: In function `spin_dk_is_not_locked':
fs/reiser4/tree.h:648: structure has no member named `owner'
fs/reiser4/tree.h:648: warning: control reaches end of non-void function
In file included from fs/reiser4/debug.c:6:
fs/reiser4/super.h: In function `spin_reiser4_super_info_data_is_locked':
fs/reiser4/super.h:249: structure has no member named `owner'
fs/reiser4/super.h:249: warning: control reaches end of non-void function
fs/reiser4/super.h: In function `spin_reiser4_super_info_data_is_not_locked':
fs/reiser4/super.h:249: structure has no member named `owner'
fs/reiser4/super.h:249: warning: control reaches end of non-void function
fs/reiser4/debug.c: In function `reiser4_panic':
fs/reiser4/debug.c:62: warning: `noreturn' function does return
make[2]: *** [fs/reiser4/debug.o] Error 1
make[1]: *** [fs/reiser4] Error 2
make: *** [fs] Error 2
cliffw


