From: Nikita Danilov <Nikita@Namesys.COM>
Subject: Re: build failure, 11/12 snapshot
Date: Tue, 12 Nov 2002 20:00:56 +0300
Message-ID: <15825.13256.268051.135322@laputa.namesys.com>
References: <200211121654.gACGsL613330@mail.osdl.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11975-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200211121654.gACGsL613330@mail.osdl.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Cliff White <cliffw@osdl.org>
Cc: Reiserfs-List@namesys.com

Cliff White writes:
 > 
 > Clean linux-2.5.47 ftp.kernel.org source + latest snapshot.
 > 
 > -----------------------------------
 > make -f scripts/Makefile.build obj=fs/reiser4
 >   gcc -Wp,-MD,fs/reiser4/.debug.o.d -D__KERNEL__ -Iinclude -Wall 
 > -Wstrict-prototypes -Wno-trigraphs -O2 -fomit-frame-pointer 
 > -fno-strict-aliasing -fno-common -pipe -mpreferred-stack-boundary=2 
 > -march=i686 -Iarch/i386/mach-generic -nostdinc -iwithprefix include    
 > -DKBUILD_BASENAME=debug   -c -o fs/reiser4/debug.o fs/reiser4/debug.c
 > In file included from fs/reiser4/jnode.h:11,
 >                  from fs/reiser4/tree.h:15,
 >                  from fs/reiser4/super.h:10,
 >                  from fs/reiser4/debug.c:6:
 > fs/reiser4/txnmgr.h: In function `spin_atom_is_locked':

Turn off spin-lock debugging.

 > fs/reiser4/txnmgr.h:424: structure has no member named `owner'
 > fs/reiser4/txnmgr.h:424: warning: control reaches end of non-void function

[...]

 > make[1]: *** [fs/reiser4] Error 2
 > make: *** [fs] Error 2
 > cliffw
 > 
 > 

Nikita.
