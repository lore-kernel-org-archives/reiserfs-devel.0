From: "Bostjan Skufca (at) domenca.si" <bostjan.skufca@domenca.si>
Subject: 2.4.23 does not compile without modules being supported
Date: Fri, 5 Dec 2003 17:00:00 +0100
Message-ID: <200312051700.00020.bostjan.skufca@domenca.si>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16251-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi,

I used vanilla kernel 2.4.23, patched it with quota & data_logging patches 1-6 
but without last one (write_times, but it makes no difference), patched it 
with grsec (without it it does not make any difference either), configured it 
without modules and "make bzImage" says this:

cc -D__KERNEL__ -I/hram/src/linux-2.4.23/include -Wall -Wstrict-prototypes 
-Wno-trigraphs -O2 -fno-strict-aliasing -fno-common -fomit-frame-pointer 
-pipe -mpreferred-stack-boundary=2 -march=i686   -nostdinc -iwithprefix 
include -DKBUILD_BASENAME=journal  -c -o journal.o journal.c
In file included from journal.c:42:
/hram/src/linux-2.4.23/include/linux/module.h:21:34: linux/modversions.h: No 
such file or directory
make[3]: *** [journal.o] Error 1
make[3]: Leaving directory `/hram/src/linux-2.4.23/fs/reiserfs'
make[2]: *** [first_rule] Error 2
make[2]: Leaving directory `/hram/src/linux-2.4.23/fs/reiserfs'
make[1]: *** [_subdir_reiserfs] Error 2
make[1]: Leaving directory `/hram/src/linux-2.4.23/fs'
make: *** [_dir_fs] Error 2


if i edited 
/hram/src/linux-2.4.23/include/linux/module.h

and changed
"linux/modversions.h"
to system one
"/usr/include/linux/modversions.h"

then it compiles and runs fine.
If i include module support it also compiles fine (as modversions.h gets 
generated).

Distro: slackware 9.0 with bundled gcc (3.2.2)


Best regards,
Bostjan
