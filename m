From: Cliff White <cliffw@osdl.org>
Subject: build failure 11/05 snapshot
Date: Fri, 08 Nov 2002 14:29:55 -0800
Message-ID: <200211082229.gA8MTt502371@mail.osdl.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11955-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com, reiserfs-dev@namesys.com

attempting to build the 11.05 snapshot, using current bk tree:
-----------------------------------
gcc -Wp,-MD,fs/reiser4/plugin/item/.static_stat.o.d -D__KERNEL__ -Iinclude 
-Wall -Wstrict-prototypes -Wno-trigraphs -O2 -fomit-frame-pointer 
-fno-strict-aliasing -fno-common -pipe -mpreferred-stack-boundary=2 
-march=i686 -Iarch/i386/mach-generic -nostdinc -iwithprefix include -DMODULE 
-include include/linux/modversions.h   -DKBUILD_BASENAME=static_stat   -c -o 
fs/reiser4/plugin/item/static_stat.o fs/reiser4/plugin/item/static_stat.c
fs/reiser4/plugin/item/static_stat.c: In function `sd_load':
fs/reiser4/plugin/item/static_stat.c:265: `event' undeclared (first use in 
this function)
fs/reiser4/plugin/item/static_stat.c:265: (Each undeclared identifier is 
reported only once
fs/reiser4/plugin/item/static_stat.c:265: for each function it appears in.)
make[2]: *** [fs/reiser4/plugin/item/static_stat.o] Error 1
make[1]: *** [fs/reiser4] Error 2
make: *** [fs] Error 2

cliffw


