From: <mail@viliar.net.ru>
Subject: reiser4progs+libaal 1.0.5
Date: Thu, 25 May 2006 21:18:54 +0400
Message-ID: <web-8672996@inc.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-28675-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi all!

I have same problem, as at topic 
http://www.nabble.com/reiser4progs+1.0.5+configure+script+and+libaal+1.0.5-t221999.html

The reiser4progs 1.0.5 can't find libaal 1.0.5, which
installed in /usr/local (this path is in /etc/ld.so.conf
and ldconfig was made)

checking for aal_device_open in -laal... yes
checking aal/libaal.h usability... yes
checking aal/libaal.h presence... yes
checking for aal/libaal.h... yes
checking for libaal version = 1.0.5... no

But glibc not 2.3.2, as in that case.
 
# rpm -qa | grep glibc
glibc-2.3.5-5mdk
glibc-devel-2.3.5-5mdk

distro - Mandriva 2006 (kernel 2.6.16.18)

How can I trace an error?

Any help would be appreciated...

Thank you.



A.

--------------

"Hic Jacet Ego"
