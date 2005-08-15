From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: reiser4progs 1.0.5 configure script and libaal 1.0.5
Date: Mon, 15 Aug 2005 17:48:47 +0400
Message-ID: <200508151748.47603.vitaly@namesys.com>
References: <1123947554.11989.ezmlm@namesys.com> <200508151725.40698.vitaly@namesys.com> <1124114160.24528.4.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25479-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1124114160.24528.4.camel@localhost.localdomain>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Vanuxem =?iso-8859-1?q?Gr=E9gory?= <g.vanuxem@wanadoo.fr>
Cc: reiserfs-list@namesys.com

> > where have you installed libaal into? /usr/local?
> > does you /etc/ld.so.conf have the path you instatlled libaal into?
> > if not, add it and run /sbin/ldconfig.
> > 
> 
> Yes but that doesn't work
> 
> here is the output:
> 
> checking for special C compiler options needed for large files... no
> checking for _FILE_OFFSET_BITS value needed for large files... no
> checking for _LARGE_FILES value needed for large files... no
> configure: WARNING: Can't detect right _FILE_OFFSET_BITS. Will be forced
> to 64bit.
> checking for off_t... yes
> checking size of off_t... 8
> checking for aal_device_open in -laal... yes
> checking aal/libaal.h usability... yes
> checking aal/libaal.h presence... yes
> checking for aal/libaal.h... yes
> checking for libaal version = 1.0.5... no
> ellipse:/home/greg/temp/reiser4progs-1.0.5#

so what do you see in config.log?
which test program fails?
do you see a libaal.so in the wanted place?
actually there is --with-libaal option for not standard 
places, but you are not supposed to use it if you install 
libaal by default.

is it possible to get an access to your computer to test it?
 
> That works only in a chrooted 32bits environment
> (I have a x86_64)

what distro?

-- 
Thanks,
Vitaly Fertman
