From: Yury Umanets <umka@namesys.com>
Subject: Re: libaal compile fails
Date: Wed, 29 Oct 2003 11:58:05 +0300
Message-ID: <3F9F811D.7070902@namesys.com>
References: <3F9F80F0.5040206@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15923-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3F9F80F0.5040206@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Yury Umanets <umka@namesys.com>
Cc: S?valdur Gunnarsson <addi@root.is>, ReiserFS <reiserfs-list@namesys.com>

Yury Umanets wrote:

> >>When I try building libaal it fails with the following error message:
>
> >>make[2]: Entering directory 
> `/raid/disc0/usr/src/linux-2.6.0-test9/libaal-0.4.13/src'
> >>source='file.c' object='libaal_la-file.lo' libtool=yes \
> >>depfile='.deps/libaal_la-file.Plo' 
> tmpdepfile='.deps/libaal_la-file.TPlo' \
> >>depmode=gcc3 /bin/sh ../depcomp \
> >>/bin/sh ../libtool --mode=compile gcc -DHAVE_CONFIG_H -I. -I. -I.. 
> -I../include   -D_REENTRANT -D_FILE_OFFSET_BITS=64 -O0 -g -W -Wall 
> >>-Wno-unused-parameter -Wredundant-decls -Werror -c -o 
> libaal_la-file.lo `test -f file.c || echo './'`file.c
> >>rm -f .libs/libaal_la-file.lo
> >>gcc -DHAVE_CONFIG_H -I. -I. -I.. -I../include -D_REENTRANT 
> -D_FILE_OFFSET_BITS=64 -O0 -g -W -Wall -Wno-unused-parameter 
> >>-Wredundant-decls -Werror -c file.c -MT libaal_la-file.lo -MD -MP 
> -MF .deps/libaal_la-file.TPlo  -fPIC -DPIC -o .libs/libaal_la-file.lo
> >>file.c: In function `file_len':
> >>file.c:213: parse error before '[' token
> >>cc1: warnings being treated as errors
> >>file.c:213: warning: signed and unsigned type in conditional expression
> >>make[2]: *** [libaal_la-file.lo] Error 1
> >>make[2]: Leaving directory 
> `/raid/disc0/usr/src/linux-2.6.0-test9/libaal-0.4.13/src'
> >>make[1]: *** [all-recursive] Error 1
> >>make[1]: Leaving directory 
> `/raid/disc0/usr/src/linux-2.6.0-test9/libaal-0.4.13'
> >>make: *** [all] Error 2
> >>titanium /usr/src/linux/libaal-0.4.13#
>
> Hello,
>
> This is pretty strange. Line 213 does not contain any "[" tokens and 
> suspicious macros. Have you got correct sources? Can you send me line 
> 213 with context?
>
> Also use please configure with option --disable-Werror specified.
>
Forgot to ask. Do you use recent snapshot of libaal?

-- 
umka


