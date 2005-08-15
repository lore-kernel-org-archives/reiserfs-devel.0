From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: reiser4progs 1.0.5 configure script and libaal 1.0.5
Date: Mon, 15 Aug 2005 18:13:51 +0400
Message-ID: <200508151813.51639.vitaly@namesys.com>
References: <1123947554.11989.ezmlm@namesys.com> <200508151748.47603.vitaly@namesys.com> <1124115100.24528.8.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-25482-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1124115100.24528.8.camel@localhost.localdomain>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Vanuxem =?utf-8?q?Gr=C3=A9gory?= <g.vanuxem@wanadoo.fr>
Cc: reiserfs-list@namesys.com

On Monday 15 August 2005 18:11, Vanuxem Grégory wrote:
> Le lundi 15 aoШt 2005 Ю 17:48 +0400, Vitaly Fertman a Иcrit :
> > > > where have you installed libaal into? /usr/local?
> > > > does you /etc/ld.so.conf have the path you instatlled libaal into?
> > > > if not, add it and run /sbin/ldconfig.
> > > > 
> > > 
> > > Yes but that doesn't work
> > > 
> > > here is the output:
> > > 
> > > checking for special C compiler options needed for large files... no
> > > checking for _FILE_OFFSET_BITS value needed for large files... no
> > > checking for _LARGE_FILES value needed for large files... no
> > > configure: WARNING: Can't detect right _FILE_OFFSET_BITS. Will be forced
> > > to 64bit.
> > > checking for off_t... yes
> > > checking size of off_t... 8
> > > checking for aal_device_open in -laal... yes
> > > checking aal/libaal.h usability... yes
> > > checking aal/libaal.h presence... yes
> > > checking for aal/libaal.h... yes
> > > checking for libaal version = 1.0.5... no
> > > ellipse:/home/greg/temp/reiser4progs-1.0.5#
> > 
> > so what do you see in config.log?
> Sended.

ok.

> > which test program fails?
> Don't know
> > do you see a libaal.so in the wanted place?
> Yes
> > actually there is --with-libaal option for not standard 
> > places, but you are not supposed to use it if you install 
> > libaal by default.
> > 
> > is it possible to get an access to your computer to test it?
> 
> with root access ???

no, it is not necessary.
 
> >  
> > > That works only in a chrooted 32bits environment
> > > (I have a x86_64)
> > 
> > what distro?
> Debian AMD64
> > 
> 
> Cheers,
> 
> Greg
> 

-- 
Thanks,
Vitaly Fertman
