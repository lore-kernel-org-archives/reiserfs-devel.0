From: Alexander Zarochentsev <zam@namesys.com>
Subject: Re: reiser4 for 2.6.13 is available on our website
Date: Fri, 30 Sep 2005 12:31:01 +0400
Message-ID: <200509301231.02169.zam@namesys.com>
References: <433C23A2.9020403@namesys.com> <op.sxvmrokbd4os1z@localhost> <1128031794.10856.155.camel@gentoo>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-26353-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1128031794.10856.155.camel@gentoo>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com
Cc: Jake Maciejewski <maciejej@msoe.edu>, =?iso-8859-2?q?=A3ukasz_Mierzwa?= <prymitive@pcserwis.hopto.org>, Hans Reiser <reiser@namesys.com>

On Friday 30 September 2005 02:09, Jake Maciejewski wrote:
> I get the same with 2.6.13.2 and gcc 3.4.4 on amd64
>
can you try this patch?
=2D----------------------------------
=2D-- a/fs/reiser4/spin_macros.h
+++ b/fs/reiser4/spin_macros.h
@@ -82,8 +82,6 @@ typedef struct reiser4_rw_data {
 static inline void spin_ ## NAME ## _init(TYPE *x)				\
 {										\
 	__ODCA("nikita-2987", x !=3D NULL);					\
=2D	cassert(sizeof(x->FIELD) !=3D 0);						\
=2D	memset(& x->FIELD, 0, sizeof x->FIELD);					\
 	spin_lock_init(& x->FIELD.lock);					\
 }										\
 										\
@@ -236,7 +234,6 @@ typedef struct { int foo; } NAME ## _spi
 static inline void rw_ ## NAME ## _init(TYPE *x)				\
 {										\
 	__ODCA("nikita-2988", x !=3D NULL);					\
=2D	memset(& x->FIELD, 0, sizeof x->FIELD);					\
 	rwlock_init(& x->FIELD.lock);						\
 }										\
 										\
=2D----------------------------------
> On Thu, 2005-09-29 at 20:24 +0200, =A3ukasz Mierzwa wrote:
> > Dnia Thu, 29 Sep 2005 19:25:54 +0200, Hans Reiser <reiser@namesys.com>
> >
> > napisa=B3:
> > > Reiser4 performance dropped in the -mm series due to the write
> > > throttling patch and also dropped due to a fixed bug (removing type
> > > safe lists added a bug).  We don't yet know if we got quite all the
> > > performance back, we are still testing.  Conservative users should wa=
it
> > > a week or two to see if bug reports with reiser4 remain, or if indeed
> > > we did get all the bugs out  of the recent cleanup patch.
> > >
> > > Hans
> >
> >    CC      fs/proc/kmsg.o
> >    CC      fs/proc/proc_tty.o
> >    CC      fs/proc/proc_misc.o
> >    CC      fs/proc/kcore.o
> >    LD      fs/proc/proc.o
> >    LD      fs/proc/built-in.o
> >    CC      fs/ramfs/inode.o
> >    LD      fs/ramfs/ramfs.o
> >    LD      fs/ramfs/built-in.o
> >    CC      fs/reiser4/debug.o
> > In file included from fs/reiser4/lock.h:15,
> >                   from fs/reiser4/context.h:14,
> >                   from fs/reiser4/debug.c:25:
> > fs/reiser4/txnmgr.h: In function 'spin_atom_init':
> > fs/reiser4/txnmgr.h:512: error: duplicate case value
> > fs/reiser4/txnmgr.h:512: error: previously used here
> > fs/reiser4/txnmgr.h: In function 'spin_txnh_init':
> > fs/reiser4/txnmgr.h:513: error: duplicate case value
> > fs/reiser4/txnmgr.h:513: error: previously used here
> > fs/reiser4/txnmgr.h: In function 'spin_txnmgr_init':
> > fs/reiser4/txnmgr.h:514: error: duplicate case value
> > fs/reiser4/txnmgr.h:514: error: previously used here
> > In file included from fs/reiser4/context.h:14,
> >                   from fs/reiser4/debug.c:25:
> > fs/reiser4/lock.h: In function 'spin_stack_init':
> > fs/reiser4/lock.h:198: error: duplicate case value
> > fs/reiser4/lock.h:198: error: previously used here
> > In file included from fs/reiser4/znode.h:16,
> >                   from fs/reiser4/tree.h:15,
> >                   from fs/reiser4/super.h:9,
> >                   from fs/reiser4/debug.c:26:
> > fs/reiser4/jnode.h: In function 'spin_jnode_init':
> > fs/reiser4/jnode.h:344: error: duplicate case value
> > fs/reiser4/jnode.h:344: error: previously used here
> > fs/reiser4/jnode.h: In function 'spin_jload_init':
> > fs/reiser4/jnode.h:348: error: duplicate case value
> > fs/reiser4/jnode.h:348: error: previously used here
> > In file included from fs/reiser4/super.h:9,
> >                   from fs/reiser4/debug.c:26:
> > fs/reiser4/tree.h: In function 'spin_epoch_init':
> > fs/reiser4/tree.h:169: error: duplicate case value
> > fs/reiser4/tree.h:169: error: previously used here
> > In file included from fs/reiser4/debug.c:26:
> > fs/reiser4/super.h: In function 'spin_super_init':
> > fs/reiser4/super.h:379: error: duplicate case value
> > fs/reiser4/super.h:379: error: previously used here
> > make[2]: *** [fs/reiser4/debug.o] B=B3=B1d 1
> > make[1]: *** [fs/reiser4] B=B3=B1d 2
> > make: *** [fs] B=B3=B1d 2
> >
> > amd64 gentoo box running gcc 4.0.1, 2.6.13 +
> > reiser4-for-2.6.13-1.patch.gz
