From: Domenico Andreoli <cavok@tiscali.it>
Subject: Fwd: Bug#266648: core dump on ENXIO
Date: Thu, 19 Aug 2004 00:16:45 +0200
Message-ID: <20040818221645.GA2259@raptus.homelinux.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20390-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

hi,

Harald Dunkel reported this bug on the latest debian package.

is this a bug?

cheers
dom

----- Forwarded message from Harald Dunkel <harald.dunkel@t-online.de> -----

Date: Wed, 18 Aug 2004 17:27:06 +0200
From: Harald Dunkel <harald.dunkel@t-online.de>
Subject: Bug#266648: core dump on ENXIO

If there is no hardware behind /dev/sdd, then
"mkreiserfs /dev/sdd" dies with SIGABRT and a
core dump file instead of setting a valid exit
value to indicate a problem.

# mkreiserfs /dev/sdd
mkreiserfs 3.6.18 (2003 www.namesys.com)

A pair of credits:
Yury Umanets  (aka Umka)  developed  libreiser4,  userspace  plugins,  and  all
userspace tools (reiser4progs) except of fsck.

Chris Mason wrote the journaling code for V3,  which was enormously more useful
to users than just waiting until  we could create a wandering log filesystem as
Hans would have unwisely done without him.
Jeff Mahoney optimized the bitmap  scanning code for V3,  and performed the  big
endian cleanups.


count_blocks: open failed (No such device or address)
Aborted (core dumped)

----- End forwarded message -----


-----[ Domenico Andreoli, aka cavok
 --[ http://people.debian.org/~cavok/gpgkey.asc
   ---[ 3A0F 2F80 F79C 678A 8936  4FEE 0677 9033 A20E BC50
