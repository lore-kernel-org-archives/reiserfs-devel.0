From: Philippe =?ISO-8859-15?Q?Gramoull=E9?= <philippe.gramoulle@mmania.com>
Subject: reiserfsprogs 3.6.11 compile failure. 3.6.12-pre3 compiles ok
Date: Tue, 27 Jan 2004 15:13:46 +0100
Message-ID: <20040127151346.674f4843@philou.gramoulle.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16631-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs <reiserfs-list@namesys.com>


 Hi,

While installing a box to start playing with reiser4 i got a compile error
while trying to build reiserfsprogs 3.6.11. This the first time this happens as
i had already compiled it successfully on other Debian Unstable boxes.

I guess i may be because of a newly installed development package that breaks
some macro.

Reiserfsprogs 3.6.12-pre3 compiles fine.

Thanks,

Philippe

boogie:/usr/src/reiserfsprogs-3.6.11# make
Making all in include
make[1]: Entering directory `/usr/src/reiserfsprogs-3.6.11/include'
make  all-am
make[2]: Entering directory `/usr/src/reiserfsprogs-3.6.11/include'
make[2]: Leaving directory `/usr/src/reiserfsprogs-3.6.11/include'
make[1]: Leaving directory `/usr/src/reiserfsprogs-3.6.11/include'
Making all in lib
make[1]: Entering directory `/usr/src/reiserfsprogs-3.6.11/lib'
if gcc -DHAVE_CONFIG_H -I. -I. -I../include     -g -O2 -Wall -MT io.o -MD -MP -MF ".deps/io.Tpo" \
  -c -o io.o `test -f 'io.c' || echo './'`io.c; \
then mv ".deps/io.Tpo" ".deps/io.Po"; \
else rm -f ".deps/io.Tpo"; exit 1; \
fi
if gcc -DHAVE_CONFIG_H -I. -I. -I../include     -g -O2 -Wall -MT misc.o -MD -MP -MF ".deps/misc.Tpo" \
  -c -o misc.o `test -f 'misc.c' || echo './'`misc.c; \
then mv ".deps/misc.Tpo" ".deps/misc.Po"; \
else rm -f ".deps/misc.Tpo"; exit 1; \
fi
misc.c: In function `count_blocks':
misc.c:431: error: parse error before '[' token
make[1]: *** [misc.o] Error 1
make[1]: Leaving directory `/usr/src/reiserfsprogs-3.6.11/lib'
make: *** [all-recursive] Error 1
boogie:/usr/src/reiserfsprogs-3.6.11# 
