From: Nikita Danilov <Nikita@Namesys.COM>
Subject: Re: build failure 11/05 snapshot
Date: Mon, 11 Nov 2002 22:03:36 +0300
Message-ID: <15823.65288.345634.69230@laputa.namesys.com>
References: <cliffw@osdl.org>
	<200211082229.gA8MTt502371@mail.osdl.org>
	<200211111900.gABJ0Js10024@mail.osdl.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11963-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200211111900.gABJ0Js10024@mail.osdl.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Cliff White <cliffw@osdl.org>
Cc: reiser@namesys.com, reiserfs-list@namesys.com, reiserfs-dev@namesys.com

Cliff White writes:
 > 
 > Ths is a re-send, haven't received any response, haven't seen any

Sorry for delay.

 > newer snapshots. Attempted to build today with 2.5.47 bk tree, exact
 > same error. 
 > When new code?

We hope to produce new snapshot to-morrow.

For now just comment out 

inode->i_version = ++event;

in line 265 of fs/reiser4/plugin/item/static_stat.c---you are just
compiling with newer version of core kernel than one snapshot was made for.

 > cliffw
 > 

Nikita.

 > > attempting to build the 11.05 snapshot, using current bk tree:
 > > -----------------------------------
 > > gcc -Wp,-MD,fs/reiser4/plugin/item/.static_stat.o.d -D__KERNEL__ -Iinclude 
 > > -Wall -Wstrict-prototypes -Wno-trigraphs -O2 -fomit-frame-pointer 
 > > -fno-strict-aliasing -fno-common -pipe -mpreferred-stack-boundary=2 
 > > -march=i686 -Iarch/i386/mach-generic -nostdinc -iwithprefix include -DMODULE 
 > > -include include/linux/modversions.h   -DKBUILD_BASENAME=static_stat   -c -o 
 > > fs/reiser4/plugin/item/static_stat.o fs/reiser4/plugin/item/static_stat.c
 > > fs/reiser4/plugin/item/static_stat.c: In function `sd_load':
 > > fs/reiser4/plugin/item/static_stat.c:265: `event' undeclared (first use in 
 > > this function)
 > > fs/reiser4/plugin/item/static_stat.c:265: (Each undeclared identifier is 
 > > reported only once
 > > fs/reiser4/plugin/item/static_stat.c:265: for each function it appears in.)
 > > make[2]: *** [fs/reiser4/plugin/item/static_stat.o] Error 1
 > > make[1]: *** [fs/reiser4] Error 2
 > > make: *** [fs] Error 2
 > > 
 > > cliffw
 > > 
 > > 
 > 
 > 
