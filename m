From: Yury Umanets <umka@namesys.com>
Subject: Re: build problem BK reiser4progs: /usr/include/features.h:218:52:
 operator '==' has no left operand
Date: Thu, 16 Jan 2003 13:44:13 +0300
Message-ID: <3E268CFD.5080604@namesys.com>
References: <20030116102742.I7526@humilis>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12377-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030116102742.I7526@humilis>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: ookhoi@humilis.net
Cc: Reiserfs-List@namesys.com

Ookhoi wrote:

>Hi all,
>
>A fresh BK reiser4progs gives me the following error. It is not obvious
>to me what is wrong :-/
>
>Please only deal with this if you have time. I can use the snapshot
>progs just fine.
>
>Tnx!
>
>
>$ make
>make  all-recursive
>make[1]: Entering directory `/usr/src/reiser4progs'
>Making all in libaal
>make[2]: Entering directory `/usr/src/reiser4progs/libaal'
>/bin/sh ../libtool --mode=compile gcc -DHAVE_CONFIG_H -I. -I. -I.. -I../include    -D_REENTRANT -D_FILE_OFFSET_BITS= -g -W -Wall -Wno-unused -Werror -DPLUGIN_DIR=\"/usr/local/lib/reiser4\" -c device.c
>gcc -DHAVE_CONFIG_H -I. -I. -I.. -I../include -D_REENTRANT -D_FILE_OFFSET_BITS= -g -W -Wall -Wno-unused -Werror -DPLUGIN_DIR=\"/usr/local/lib/reiser4\" -Wp,-MD,.deps/device.pp -c device.c -o device.o
>In file included from /usr/include/stdint.h:26,
>                 from ../include/aal/aal.h:46,
>                 from device.c:8:
>/usr/include/features.h:218:52: operator '==' has no left operand
>make[2]: *** [device.lo] Error 1
>make[2]: Leaving directory `/usr/src/reiser4progs/libaal'
>make[1]: *** [all-recursive] Error 1
>make[1]: Leaving directory `/usr/src/reiser4progs'
>make: *** [all-recursive-am] Error 2
>
>
>  
>
Looks like the problem with your autoconf. What version do you use?

-- 
Yury Umanets


