From: Oleg Drokin <green@namesys.com>
Subject: Re: [ANNOUNCE]: reiser4 snapshot
Date: Fri, 14 Feb 2003 09:53:59 +0300
Message-ID: <20030214095359.D10351@namesys.com>
References: <15947.44879.855354.614016@laputa.namesys.com> <20030213203235.E17656@humilis>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12753-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20030213203235.E17656@humilis>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ookhoi <ookhoi@humilis.net>
Cc: Nikita Danilov <Nikita@namesys.com>, Reiserfs developers mail-list <Reiserfs-Dev@namesys.com>, Reiserfs mail-list <Reiserfs-List@namesys.com>

Hello!

On Thu, Feb 13, 2003 at 08:32:36PM +0100, Ookhoi wrote:
> > Snapshot is released as a patch against linux-2.5.60. It should also
> > work with current (February 13th) bk snapshot.
> > REISER4_NOOPT config option (Disable compiler optimizations for
> > reiser4 code.) is known to not compile on x86.
> I can't find that option in .config  The only REISER options that I have
> are:
> $ grep REISER .config
> CONFIG_REISER4_FS=y
> # CONFIG_REISER4_CHECK is not set
> CONFIG_REISERFS_FS=y
> # CONFIG_REISERFS_CHECK is not set
> # CONFIG_REISERFS_PROC_INFO is not set
> $

This is one of debugging options, so you won't see debugging options unless
you enable CONFIG_REISER4_CHECK

> I do get some warnings and a compile error. This is on an up to date
> debian sid (unstable) and with gcc (GCC) 3.2.3 20030210
> Do you need more info on this?

Sure.

> In file included from fs/reiser4/super.h:10,
>                  from fs/reiser4/debug.c:7:
> fs/reiser4/tree.h: In function `write_trylock_tree':
> fs/reiser4/tree.h:460: warning: implicit declaration of function `_raw_write_trylock'
> In file included from fs/reiser4/jnode.c:20:
> fs/reiser4/tree.h: In function `write_trylock_tree':
> fs/reiser4/tree.h:460: warning: implicit declaration of function `_raw_write_trylock'
> In file included from fs/reiser4/znode.c:153:
> fs/reiser4/tree.h: In function `write_trylock_tree':
> fs/reiser4/tree.h:460: warning: implicit declaration of function `_raw_write_trylock'
> In file included from fs/reiser4/super.h:10,
>                  from fs/reiser4/key.c:7:
> fs/reiser4/tree.h: In function `write_trylock_tree':
> fs/reiser4/tree.h:460: warning: implicit declaration of function `_raw_write_trylock'
> In file included from fs/reiser4/super.h:10,
>                  from fs/reiser4/pool.c:48:
> fs/reiser4/tree.h: In function `write_trylock_tree':
> fs/reiser4/tree.h:460: warning: implicit declaration of function `_raw_write_trylock'
> In file included from fs/reiser4/tree_mod.c:16:
> fs/reiser4/tree.h: In function `write_trylock_tree':
> fs/reiser4/tree.h:460: warning: implicit declaration of function `_raw_write_trylock'
> In file included from fs/reiser4/estimate.c:5:
> fs/reiser4/tree.h: In function `write_trylock_tree':
> fs/reiser4/tree.h:460: warning: implicit declaration of function `_raw_write_trylock'
> In file included from fs/reiser4/carry.c:146:
> fs/reiser4/tree.h: In function `write_trylock_tree':
> fs/reiser4/tree.h:460: warning: implicit declaration of function `_raw_write_trylock'
> In file included from fs/reiser4/carry_ops.c:19:
> fs/reiser4/tree.h: In function `write_trylock_tree':
> fs/reiser4/tree.h:460: warning: implicit declaration of function `_raw_write_trylock'
> In file included from fs/reiser4/lock.c:349:
> fs/reiser4/tree.h: In function `write_trylock_tree':
> fs/reiser4/tree.h:460: warning: implicit declaration of function `_raw_write_trylock'
> In file included from fs/reiser4/tree.c:97:
> fs/reiser4/tree.h: In function `write_trylock_tree':
> fs/reiser4/tree.h:460: warning: implicit declaration of function `_raw_write_trylock'
> In file included from fs/reiser4/super.h:10,
>                  from fs/reiser4/context.c:6:
> fs/reiser4/tree.h: In function `write_trylock_tree':
> fs/reiser4/tree.h:460: warning: implicit declaration of function `_raw_write_trylock'
> In file included from fs/reiser4/tap.c:18:
> fs/reiser4/tree.h: In function `write_trylock_tree':
> fs/reiser4/tree.h:460: warning: implicit declaration of function `_raw_write_trylock'
> In file included from fs/reiser4/coord.c:6:
> fs/reiser4/tree.h: In function `write_trylock_tree':
> fs/reiser4/tree.h:460: warning: implicit declaration of function `_raw_write_trylock'
> In file included from fs/reiser4/block_alloc.c:9:
> fs/reiser4/tree.h: In function `write_trylock_tree':
> fs/reiser4/tree.h:460: warning: implicit declaration of function `_raw_write_trylock'
> In file included from fs/reiser4/txnmgr.c:187:
> fs/reiser4/tree.h: In function `write_trylock_tree':
> fs/reiser4/tree.h:460: warning: implicit declaration of function `_raw_write_trylock'
> In file included from fs/reiser4/super.h:10,
>                  from fs/reiser4/kassign.c:10:
> fs/reiser4/tree.h: In function `write_trylock_tree':
> fs/reiser4/tree.h:460: warning: implicit declaration of function `_raw_write_trylock'
> In file included from fs/reiser4/flush.c:22:
> fs/reiser4/tree.h: In function `write_trylock_tree':
> fs/reiser4/tree.h:460: warning: implicit declaration of function `_raw_write_trylock'
> In file included from fs/reiser4/super.h:10,
>                  from fs/reiser4/wander.c:157:
> fs/reiser4/tree.h: In function `write_trylock_tree':
> fs/reiser4/tree.h:460: warning: implicit declaration of function `_raw_write_trylock'
> In file included from fs/reiser4/eottl.c:14:
> fs/reiser4/tree.h: In function `write_trylock_tree':
> fs/reiser4/tree.h:460: warning: implicit declaration of function `_raw_write_trylock'
> In file included from fs/reiser4/search.c:16:
> fs/reiser4/tree.h: In function `write_trylock_tree':
> fs/reiser4/tree.h:460: warning: implicit declaration of function `_raw_write_trylock'
> In file included from fs/reiser4/page_cache.c:176:
> fs/reiser4/tree.h: In function `write_trylock_tree':
> fs/reiser4/tree.h:460: warning: implicit declaration of function `_raw_write_trylock'
> In file included from fs/reiser4/super.h:10,
>                  from fs/reiser4/lnode.c:85:
> fs/reiser4/tree.h: In function `write_trylock_tree':
> fs/reiser4/tree.h:460: warning: implicit declaration of function `_raw_write_trylock'
> In file included from fs/reiser4/super.h:10,
>                  from fs/reiser4/seal.c:35:
> fs/reiser4/tree.h: In function `write_trylock_tree':
> fs/reiser4/tree.h:460: warning: implicit declaration of function `_raw_write_trylock'
> In file included from fs/reiser4/super.h:10,
>                  from fs/reiser4/trace.c:9:
> fs/reiser4/tree.h: In function `write_trylock_tree':
> fs/reiser4/tree.h:460: warning: implicit declaration of function `_raw_write_trylock'
> In file included from fs/reiser4/super.h:10,
>                  from fs/reiser4/flush_queue.c:5:
> fs/reiser4/tree.h: In function `write_trylock_tree':
> fs/reiser4/tree.h:460: warning: implicit declaration of function `_raw_write_trylock'
> In file included from fs/reiser4/ktxnmgrd.c:7:
> fs/reiser4/tree.h: In function `write_trylock_tree':
> fs/reiser4/tree.h:460: warning: implicit declaration of function `_raw_write_trylock'
> fs/reiser4/ktxnmgrd.c: In function `ktxnmgrd':
> fs/reiser4/ktxnmgrd.c:39: too many arguments to function `daemonize'
> make[2]: *** [fs/reiser4/ktxnmgrd.o] Error 1
> make[1]: *** [fs/reiser4] Error 2
> make: *** [fs] Error 2

Ah. I missed the fact that the diff I produced was against yesterday's bk snapshot.
vanilla 2.5.60 misses _raw_write_trylock declaration for UP systems and have a bit
different daemonize() semantics.
I have put reiser4-kernel-2.5.60.diff file in the same place as the snapshot.
This is the patch that should be applied to 2.5.60 in addition to reiser4 patch
to make it compile. (those who use latest Linus' bitkeeper tree should not worry).
Also I updated READ.ME file.
Thanks for letting us know.

Bye,
    Oleg 
