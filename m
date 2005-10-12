From: =?iso-8859-2?q?V=E1clav_H=F9la?= <ax@natur.cuni.cz>
Subject: Re: Reiser4 problems on gentoo & 2.6.14-rc1-mm1
Date: Wed, 12 Oct 2005 14:54:00 +0200
Message-ID: <200510121454.00672.ax@natur.cuni.cz>
References: <200510121243.55956.ax@natur.cuni.cz> <434CF0B9.7030406@namesys.com>
Reply-To: ax@natur.cuni.cz
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-26507-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <434CF0B9.7030406@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

Dne st=F8eda 12 =F8=EDjna 2005 13:17 Vladimir V. Saveliev napsal(a):
> Hello
>
> I believe it is fixed in 2.6.14-rc2-mm2. Please use it.
>
> PS: if it still does not work - try to set REISER4_USE_EFLUSH macro (it is
> in file fs/reiser4/reiser4.h) to 1.
> If that does not help - please report.

But I cannot compile 2.6.14-rc2-mm2:

  CC      fs/reiser4/debug.o
In file included from fs/reiser4/lock.h:15,
                 from fs/reiser4/context.h:14,
                 from fs/reiser4/debug.c:25:
fs/reiser4/txnmgr.h: In function `spin_atom_init':
fs/reiser4/txnmgr.h:512: error: duplicate case value
fs/reiser4/txnmgr.h:512: error: previously used here
fs/reiser4/txnmgr.h: In function `spin_txnh_init':
fs/reiser4/txnmgr.h:513: error: duplicate case value
fs/reiser4/txnmgr.h:513: error: previously used here
fs/reiser4/txnmgr.h: In function `spin_txnmgr_init':
fs/reiser4/txnmgr.h:514: error: duplicate case value
fs/reiser4/txnmgr.h:514: error: previously used here
In file included from fs/reiser4/context.h:14,
                 from fs/reiser4/debug.c:25:
fs/reiser4/lock.h: In function `spin_stack_init':
fs/reiser4/lock.h:198: error: duplicate case value
fs/reiser4/lock.h:198: error: previously used here
In file included from fs/reiser4/znode.h:16,
                 from fs/reiser4/tree.h:15,
                 from fs/reiser4/super.h:9,
                 from fs/reiser4/debug.c:26:
fs/reiser4/jnode.h: In function `spin_jnode_init':
fs/reiser4/jnode.h:344: error: duplicate case value
fs/reiser4/jnode.h:344: error: previously used here
fs/reiser4/jnode.h: In function `spin_jload_init':
fs/reiser4/jnode.h:348: error: duplicate case value
fs/reiser4/jnode.h:348: error: previously used here
In file included from fs/reiser4/super.h:9,
                 from fs/reiser4/debug.c:26:
fs/reiser4/tree.h: In function `spin_epoch_init':
fs/reiser4/tree.h:169: error: duplicate case value
fs/reiser4/tree.h:169: error: previously used here
In file included from fs/reiser4/debug.c:26:
fs/reiser4/super.h: In function `spin_super_init':
fs/reiser4/super.h:379: error: duplicate case value
fs/reiser4/super.h:379: error: previously used here
make[2]: *** [fs/reiser4/debug.o] Error 1
make[1]: *** [fs/reiser4] Error 2
make: *** [fs] Error 2

Ax
=2D-=20
V=E1clav H=F9la,
spr=E1vce po=B9tovn=EDho serveru
P=F8=EDrodov=ECdeck=E1 fakulta
Univerzita Karlova v Praze
