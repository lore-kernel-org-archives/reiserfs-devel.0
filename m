From: Vanuxem =?ISO-8859-1?Q?Gr=E9gory?= <g.vanuxem@wanadoo.fr>
Subject: Re: reiser4progs 1.0.5 configure script and libaal 1.0.5
Date: Mon, 15 Aug 2005 15:56:00 +0200
Message-ID: <1124114160.24528.4.camel@localhost.localdomain>
References: <1123947554.11989.ezmlm@namesys.com>
	 <42FE1E3C.7050308@namesys.com>
	 <1123950383.3241.0.camel@localhost.localdomain>
	 <200508151725.40698.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-25478-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200508151725.40698.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Vitaly Fertman <vitaly@namesys.com>
Cc: reiserfs-list@namesys.com

Le lundi 15 août 2005 à 17:25 +0400, Vitaly Fertman a écrit :
> On Saturday 13 August 2005 20:26, Vanuxem Grégory wrote:
> > Le samedi 13 aoШt 2005 Ю 20:22 +0400, Vladimir V. Saveliev a Иcrit :
> > > Hello
> > > 
> > > Vanuxem GrИgory wrote:
> > > > Hi,
> > > > 
> > > > The lastest reiser4progs (1.0.5) can't find libaal
> > > > in configure script.
> > > > 
> > > > More precisely it doesn't find libaal because of version problem
> > > > 
> > > > 
> > > > Any idea ?
> > > > 
> > > Have you  installed
> > > ftp://ftp.namesys.com/pub/reiser4progs/libaal-1.0.5.tar.gz?
> > 
> > Yes, sure
> 
> where have you installed libaal into? /usr/local?
> does you /etc/ld.so.conf have the path you instatlled libaal into?
> if not, add it and run /sbin/ldconfig.
> 

Yes but that doesn't work

here is the output:

checking for special C compiler options needed for large files... no
checking for _FILE_OFFSET_BITS value needed for large files... no
checking for _LARGE_FILES value needed for large files... no
configure: WARNING: Can't detect right _FILE_OFFSET_BITS. Will be forced
to 64bit.
checking for off_t... yes
checking size of off_t... 8
checking for aal_device_open in -laal... yes
checking aal/libaal.h usability... yes
checking aal/libaal.h presence... yes
checking for aal/libaal.h... yes
checking for libaal version = 1.0.5... no
ellipse:/home/greg/temp/reiser4progs-1.0.5#


That works only in a chrooted 32bits environment
(I have a x86_64)

Cheers,


Greg


