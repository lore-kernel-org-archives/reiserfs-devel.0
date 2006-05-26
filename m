From: <mail@viliar.net.ru>
Subject: Re: reiser4progs+libaal 1.0.5
Date: Sat, 27 May 2006 01:18:03 +0400
Message-ID: <web-8690434@inc.ru>
References: <1148636819.6436.21.camel@tribesman.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-28678-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1148636819.6436.21.camel@tribesman.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com


I should apologize. Having looked closely config.log I have
found the following:

configure:24301: gcc -o conftest  -static   conftest.c
-laal  >&5
/usr/bin/ld: cannot find -lc
collect2: ld returned 1 exit status
configure:24304: $? = 1
configure: program exited with status 1

Google + installing glibc-static-devel-2.3.5-5mdk.i586.rpm
resolve this problem.

Thanks to all for help!


On Fri, 26 May 2006 13:46:59 +0400
 "Vladimir V. Saveliev" <vs@namesys.com> wrote:
> Hello
> 
> On Thu, 2006-05-25 at 21:18 +0400, mail@viliar.net.ru
> wrote:
> > Hi all!
> > 
> > I have same problem, as at topic 
> >
>
http://www.nabble.com/reiser4progs+1.0.5+configure+script+and+libaal+1.0.5-t221999.html
> > 
> > The reiser4progs 1.0.5 can't find libaal 1.0.5, which
> > installed in /usr/local 
> 
> ls /usr/local/lib/libaal*
> ?
> 
> > (this path is in /etc/ld.so.conf
> > and ldconfig was made)
> > 
> > checking for aal_device_open in -laal... yes
> > checking aal/libaal.h usability... yes
> > checking aal/libaal.h presence... yes
> > checking for aal/libaal.h... yes
> > checking for libaal version = 1.0.5... no
> > 
> > But glibc not 2.3.2, as in that case.
> >  
> > # rpm -qa | grep glibc
> > glibc-2.3.5-5mdk
> > glibc-devel-2.3.5-5mdk
> > 
> > distro - Mandriva 2006 (kernel 2.6.16.18)
> > 
> > How can I trace an error?
> > 
> > Any help would be appreciated...
> > 
> > Thank you.
> > 
> > 
> > 
> > A.
> > 
> > --------------
> > 
> > "Hic Jacet Ego"
> > 
> 


A.

--------------

"Hic Jacet Ego"
