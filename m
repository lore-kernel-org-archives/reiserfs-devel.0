From: Eric Wong <eric@yhbt.net>
Subject: Re: libaal compile fails
Date: Wed, 19 Nov 2003 11:35:39 -0800
Message-ID: <20031119193539.GE24852@BL4ST>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-16124-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com, umka@namesys.com

Hi, I'm still having problems with compiling libaal on Debian
sid/unstable after trying the proposed-fix here:

http://marc.theaimsgroup.com/?l=reiserfs&m=106841085428596&w=2

Here is the output I got after making the above changes to the BLKGETSIZE64
macro:

gcc -DHAVE_CONFIG_H -I. -I. -I.. -I../include -D_REENTRANT
-D_FILE_OFFSET_BITS=64 -O0 -g -W -Wall -Wno-unused -Wredundant-decls
-Werror -c file.c -Wp,-MD,.deps/libaal_la-file.TPlo  -fPIC -DPIC -o
.libs/libaal_la-file.lo
file.c: In function `file_len':
file.c:213: warning: signed and unsigned type in conditional expression
make[2]: *** [libaal_la-file.lo] Error 1

I'm using gcc 3.3.2 and the somewhat troublesome (yet standard fare in
Debian unstable nowadays) linux-kernel-headers package that provides
kernel headers for glibc.  I'm running 2.6.0-test9

This package compiles fine on my Debian stable/Woody system, however.

If you need any more info, let me know.  Thanks.

-- 
Eric Wong  (normalperson on OFTC and Freenode)
