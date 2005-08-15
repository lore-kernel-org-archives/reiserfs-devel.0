From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: reiser4progs 1.0.5 configure script and libaal 1.0.5
Date: Mon, 15 Aug 2005 17:25:40 +0400
Message-ID: <200508151725.40698.vitaly@namesys.com>
References: <1123947554.11989.ezmlm@namesys.com> <42FE1E3C.7050308@namesys.com> <1123950383.3241.0.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-25477-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1123950383.3241.0.camel@localhost.localdomain>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Vanuxem =?utf-8?q?Gr=C3=A9gory?= <g.vanuxem@wanadoo.fr>
Cc: reiserfs-list@namesys.com

On Saturday 13 August 2005 20:26, Vanuxem Grégory wrote:
> Le samedi 13 aoШt 2005 Ю 20:22 +0400, Vladimir V. Saveliev a Иcrit :
> > Hello
> > 
> > Vanuxem GrИgory wrote:
> > > Hi,
> > > 
> > > The lastest reiser4progs (1.0.5) can't find libaal
> > > in configure script.
> > > 
> > > More precisely it doesn't find libaal because of version problem
> > > 
> > > 
> > > Any idea ?
> > > 
> > Have you  installed
> > ftp://ftp.namesys.com/pub/reiser4progs/libaal-1.0.5.tar.gz?
> 
> Yes, sure

where have you installed libaal into? /usr/local?
does you /etc/ld.so.conf have the path you instatlled libaal into?
if not, add it and run /sbin/ldconfig.

-- 
Thanks,
Vitaly Fertman
