From: Nikita Danilov <Nikita@Namesys.COM>
Subject: Re: build failure: reiser4progs-0.1.0
Date: Wed, 6 Nov 2002 13:23:23 +0300
Message-ID: <15816.60827.825112.148774@laputa.namesys.com>
References: <200211052145.gA5Ljdr32055@mail.osdl.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11927-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200211052145.gA5Ljdr32055@mail.osdl.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Cliff White <cliffw@osdl.org>
Cc: reiserfs-dev@Namesys.COM, Reiserfs-List@Namesys.COM, Linux-Kernel@vger.kernel.org

Cliff White writes:
 > 
 > Attempting to test reiser4, kernel 2.5.46, using the 2002.11.05 snapshot.

Can you please try "./configure --enable-Werror=no --without-readline"
as workaround?

 > --------------------------------------------------
 > gcc -DHAVE_CONFIG_H -I. -I. -I../.. -I../../include -g -O2 -D_REENTRANT 
 > -D_FILE_OFFSET_BITS=64 -g -W -Wall -Wno-unused -Werror 
 > -DPLUGIN_DIR=\"/usr/local/lib/reiser4\" -c alloc40.c -MT alloc40.lo -MD -MP 
 > -MF .deps/alloc40.TPlo  -fPIC -DPIC -o .libs/alloc40.lo
 > cc1: warnings being treated as errors
 > alloc40.c: In function `callback_fetch_bitmap':
 > alloc40.c:50: warning: signed and unsigned type in conditional expression
 > alloc40.c: In function `callback_flush_bitmap':
 > alloc40.c:209: warning: signed and unsigned type in conditional expression
 > alloc40.c: In function `callback_check_bitmap':
 > alloc40.c:376: warning: signed and unsigned type in conditional expression
 > make[3]: *** [alloc40.lo] Error 1
 > make[3]: Leaving directory `/root/cgl/kern/reiser/reiser4progs-0.1.0/plugin/all
 > oc40'
 > make[2]: *** [all-recursive] Error 1
 > make[2]: Leaving directory `/root/cgl/kern/reiser/reiser4progs-0.1.0/plugin'
 > make[1]: *** [all-recursive] Error 1
 > make[1]: Leaving directory `/root/cgl/kern/reiser/reiser4progs-0.1.0'
 > make: *** [all] Error 2
 > -------------------------------------
 > cliffw

Nikita.

 > 
 > 
