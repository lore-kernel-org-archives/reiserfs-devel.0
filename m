From: Kevin Turner <acapnotic@foobox.net>
Subject: bad_unaligned_access_length in compiling reiserfsck for mips
Date: Sat, 29 Jan 2005 18:53:52 -0800
Message-ID: <1107053632.4059.241.camel@troglodyte.asianpear>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23232-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ReiserFS list <reiserfs-list@namesys.com>

My cross-compile dies when it tries to link reiserfsck:
check_tree.o(.text+0x3a80): In function `__put_unaligned':
check_tree.c: undefined reference to `bad_unaligned_access_length'

That error is from asm/unaligned.h, and is supposed to mean that someone
tried to put_unaligned something that wasn't 1, 2, 4, or 8 bytes, but
the code in check_tree.c looks to me like its using it with __u32, so
I'm stumped.

reiserfsprogs version: 3.6.19
linux-libc-headers version: 2.6.8.1

Host: linux-i686
Target: linux-mipsel
Compiler: gcc 3.3.4
compilation flags: 
 -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2


-- 
The moon is waning gibbous, 83.3% illuminated, 18.7 days old.

