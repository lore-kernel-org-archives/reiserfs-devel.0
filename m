From: Nikita Danilov <Nikita@Namesys.COM>
Subject: Re: [reiserfs-dev] Re: [ANNOUNCE] reiser4 snaphots
Date: Wed, 6 Nov 2002 13:17:16 +0300
Message-ID: <15816.60460.180044.326393@laputa.namesys.com>
References: <3DC7D812.6070401@attbi.com>
	<15815.55860.150531.25135@laputa.namesys.com>
	<15815.63254.582593.239533@laputa.namesys.com>
	<20021106110314.P2099@humilis>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11926-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20021106110314.P2099@humilis>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ookhoi@humilis.net
Cc: Reiserfs mail-list <Reiserfs-List@namesys.com>, reiserfs-dev@namesys.com

Ookhoi writes:
 > Nikita Danilov wrote (ao):
 > > new reiser4 snapshot is available at:
 > > 
 > > http://namesys.com/snapshots/2002.11.05/
 > 
 > This is just a fyi.
 > 
 > The reiserfsprogs in this dir don't compile to the end for me with 
 > gcc3.2:
 > gcc (GCC) 3.2 20020903 (Red Hat Linux 8.0 3.2-7)
 > 
 > redhat 8.0
 > 
 > ./configure --prefix=/ --enable-Werror=no

Try --without-readline

 > 
 > make:
 > 
 > make[3]: Leaving directory `/usr/src/reiser4progs-0.1.0/progs/libmisc'
 > Making all in mkfs
 > make[3]: Entering directory `/usr/src/reiser4progs-0.1.0/progs/mkfs'
 > source='mkfs.c' object='mkfs.o' libtool=no \
 > depfile='.deps/mkfs.Po' tmpdepfile='.deps/mkfs.TPo' \
 > depmode=gcc3 /bin/sh ../../depcomp \
 > gcc -DHAVE_CONFIG_H -I. -I. -I../.. -I../../include -I../../progs/include    -g -O2 -D_REENTRANT -D_FILE_OFFSET_BITS=64 -g -W -Wall -Wno-unused -DPLUGIN_DIR=\"//lib/reiser4\" -c `test -f mkfs.c || echo './'`mkfs.c
 > /bin/sh ../../libtool --mode=link gcc  -g -O2 -D_REENTRANT -D_FILE_OFFSET_BITS=64 -g -W -Wall -Wno-unused -DPLUGIN_DIR=\"//lib/reiser4\"   -o mkfs.reiser4  mkfs.o ../../libreiser4/libreiser4.la ../../progs/libmisc/libmisc.la -lreadline  -luuid  
 > mkdir .libs
 > gcc -g -O2 -D_REENTRANT -D_FILE_OFFSET_BITS=64 -g -W -Wall -Wno-unused -DPLUGIN_DIR=\"//lib/reiser4\" -o .libs/mkfs.reiser4 mkfs.o  ../../libreiser4/.libs/libreiser4.so ../../progs/libmisc/.libs/libmisc.al /usr/src/reiser4progs-0.1.0/libaal/.libs/libaal.so -lreadline -luuid -Wl,--rpath -Wl,//lib
 > /usr/lib/gcc-lib/i386-redhat-linux/3.2/../../../libreadline.so: undefined reference to `tgetnum'
 > /usr/lib/gcc-lib/i386-redhat-linux/3.2/../../../libreadline.so: undefined reference to `tgoto'
 > /usr/lib/gcc-lib/i386-redhat-linux/3.2/../../../libreadline.so: undefined reference to `tgetflag'
 > /usr/lib/gcc-lib/i386-redhat-linux/3.2/../../../libreadline.so: undefined reference to `BC'
 > /usr/lib/gcc-lib/i386-redhat-linux/3.2/../../../libreadline.so: undefined reference to `tputs'
 > /usr/lib/gcc-lib/i386-redhat-linux/3.2/../../../libreadline.so: undefined reference to `PC'
 > /usr/lib/gcc-lib/i386-redhat-linux/3.2/../../../libreadline.so: undefined reference to `tgetent'
 > /usr/lib/gcc-lib/i386-redhat-linux/3.2/../../../libreadline.so: undefined reference to `UP'
 > /usr/lib/gcc-lib/i386-redhat-linux/3.2/../../../libreadline.so: undefined reference to `tgetstr'
 > collect2: ld returned 1 exit status
 > make[3]: *** [mkfs.reiser4] Error 1
 > make[3]: Leaving directory `/usr/src/reiser4progs-0.1.0/progs/mkfs'
 > make[2]: *** [all-recursive] Error 1
 > make[2]: Leaving directory `/usr/src/reiser4progs-0.1.0/progs'
 > make[1]: *** [all-recursive] Error 1
 > make[1]: Leaving directory `/usr/src/reiser4progs-0.1.0'
 > make: *** [all] Error 2

Nikita.
