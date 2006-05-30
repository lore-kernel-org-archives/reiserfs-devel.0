From: Marcus Furlong <furlongm@hotmail.com>
Subject: Re: reiser4 for 2.6.16 (version 3)
Date: Tue, 30 May 2006 16:59:16 +0100
Message-ID: <e5hq4f$ou8$1@sea.gmane.org>
References: <200605301554.35901.zam@namesys.com> <web-8763177@inc.ru>
Reply-To: furlongm@hotmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-28695-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Sender: news <news@sea.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: reiserfs-list@namesys.com

mail@viliar.net.ru wrote:

> #cd /usr/src/linux-std
> #make clean
> #gzip -dc ../reiser4-for-2.6.16-3.patch.gz | patch -p1
> --silent
> #make all
> #make modules_install
> ---cut---
> if [ -r System.map -a -x /sbin/depmod ]; then /sbin/depmod
> -ae -F System.map  2.6.16.18; fi
> WARNING:
> /lib/modules/2.6.16.18/kernel/fs/reiser4/reiser4.ko needs
> unknown symbol balance_dirty_pages
> WARNING:
> /lib/modules/2.6.16.18/kernel/fs/reiser4/reiser4.ko needs
> unknown symbol page_cache_readahead
> make: *** [_modinst_post] Ошибка 1
> 
> # uname -a
> Linux losthold.vs 2.6.16.18 #12 PREEMPT Mon May 29 21:43:25
> MSD 2006 i686 AMD Athlon(tm)  unknown GNU/Linux
> # gcc -v
> Using built-in specs.
> Target: i586-mandriva-linux-gnu
> Configured with: ../configure --prefix=/usr
> --libexecdir=/usr/lib --with-slibdir=/lib
> --mandir=/usr/share/man --infodir=/usr/share/info
> --enable-shared --enable-threads=posix --disable-checking
> --enable-languages=c,c++,ada,f95,objc,java
> --host=i586-mandriva-linux-gnu --with-system-zlib
> --enable-long-long --enable-__cxa_atexit
> --enable-clocale=gnu --disable-libunwind-exceptions
> --enable-java-awt=gtk
> --with-java-home=/usr/lib/jvm/java-1.4.2-gcj-1.4.2.0/jre
> --enable-gtk-cairo --disable-libjava-multilib
> Thread model: posix
> gcc version 4.0.1 (4.0.1-5mdk for Mandriva Linux release
> 2006.0)O
> 
> reiser4-for-2.6.16-2.patch.gz -- compile and install
> without this problem.

Try
ftp://ftp.namesys.com/pub/reiser4-for-2.6/2.6.13/broken-out.4/reiser4-export-page_cache_readahead.patch

Alternatively, this goes away if you don't build it as a module IIRC.

