From: "Jack Byer" <ojbyer@usa.net>
Subject: can not compile reiser4
Date: Sun, 10 Aug 2003 12:35:28 -0400
Message-ID: <002601c35f5d$689442d0$0200a8c0@zel>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15275-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

I'm trying to compile a 2.6.0-test2 kernel with reiser4 on a spare system.
I downloaded the latest reiser 4 sources from bitkeeper into the fs
directory of a vanilla 2.6.0-test2 tree using the instructions on your web
site ( bk clone bk://bk.namesys.com/bk/reiser4)
Then I applied the 2.6.0-test2-reiser4-2.6.0-test2.diff patch from your ftp
site.
When I try to compile, I get the following error:

  CC      fs/reiser4/entd.o
In file included from include/asm/hardirq.h:6,
                 from fs/reiser4/debug.h:17,
                 from fs/reiser4/entd.c:5:
include/linux/irq.h:69: warning: size of `irq_desc' is 28672 bytes
fs/reiser4/entd.c: In function `wait_for_flush':
fs/reiser4/entd.c:387: structure has no member named `pressure'
make[2]: *** [fs/reiser4/entd.o] Error 1
make[1]: *** [fs/reiser4] Error 2
make: *** [fs] Error 2

Also, the "size of `irq_desc' is 28672 bytes" warning was printed for every
file in the reiser4 directory up to that point.

