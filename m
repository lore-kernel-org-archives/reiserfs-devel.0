From: Adrian Woodley <Adrian@Diskworld.com.au>
Subject: libaal-0.4.13 compile error
Date: Tue, 25 Nov 2003 01:08:54 +0800
Message-ID: <1069693734.26311.23.camel@Hex.Diskworld>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16152-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Reiserfs List <reiserfs-list@namesys.com>

G'Day all,
	recently tried compiling libaal-0.4.13 and came up with the following
error:

gcc -DHAVE_CONFIG_H -I. -I. -I.. -I../include -D_REENTRANT
-D_FILE_OFFSET_BITS=64 -O0 -g -W -Wall -Wno-unused-parameter
-Wredundant-decls -Werror -c file.c -MT libaal_la-file.lo -MD -MP -MF
.deps/libaal_la-file.TPlo  -fPIC -DPIC -o .libs/libaal_la-file.lo
file.c: In function `file_len':
file.c:213: error: parse error before '[' token
file.c:213: warning: signed and unsigned type in conditional expression
make[2]: *** [libaal_la-file.lo] Error 1
make[2]: Leaving directory `/usr/local/src/libaal-0.4.13/src'
make[1]: *** [all-recursive] Error 1
make[1]: Leaving directory `/usr/local/src/libaal-0.4.13'
make: *** [all] Error 2

gcc --version
gcc (GCC) 3.3.2 (Debian)

cat /proc/version 
Linux version 2.6.0-test9-reiser4-mm3 (root@Hex) (gcc version 3.3.2
(Debian)) #1 Mon Nov 17 23:20:30 WST 2003

Cheers,
Adrian

-- 
Linux Conf Australia
Adelaide 2004
conf.linux.org.au

