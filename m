From: Chris Wright <chrisw@osdl.org>
Subject: Re: 2.6.15 Bug? New security model?
Date: Wed, 8 Feb 2006 12:50:33 -0800
Message-ID: <20060208205033.GB22771@shell0.pdx.osdl.net>
References: <200602080212.27896.bernd-schubert@gmx.de> <43E94A02.2080205@vilain.net> <20060208053732.GA13560@butterfly.hjsoft.com> <200602081314.59639.bernd-schubert@gmx.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-28048-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200602081314.59639.bernd-schubert@gmx.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bernd Schubert <bernd-schubert@gmx.de>
Cc: John M Flinchbaugh <john@hjsoft.com>, reiserfs-list@namesys.com, Sam Vilain <sam@vilain.net>, linux-kernel@vger.kernel.org

* Bernd Schubert (bernd-schubert@gmx.de) wrote:
> On Wednesday 08 February 2006 06:37, John M Flinchbaugh wrote:
> > On Wed, Feb 08, 2006 at 02:31:46PM +1300, Sam Vilain wrote:
> > > Bernd Schubert wrote:
> > > >With 2.6.15:
> > > >bathl:~# touch /var/run/test
> > > >touch: cannot touch `/var/run/test': Permission denied
> > > >With 2.6.13:
> > > >bathl:~# touch /var/run/test
> > > >(No error message)
> > >
> > > Some ideas; ACLs, SELinux, Attributes, Capabilities.
> >
> > lsattr -d /var/run && lsattr /var/run
> 
> Indeed, with 2.6.13
> 
> bathl:~# lsattr -d /var/run
> lsattr: Inappropriate ioctl for device While reading flags on /var/run
> 
> with 2.6.15.3

OK, this has a reiserfs fix for attrs support.  Rather than back it
out, I'd like to get the proper fix.

> bathl:~# cat lsatr.out.2.6.15
> --S-ia-AcBZXEj-t- /var/run
> 
> After the problem came up, I already suspected something like this and 
> therefore already had the kernel recompiled without xattr support, so I  
> don't know why lsattr shows something for 2.6.15 and nothing for 2.6.13.

attrs != xattrs

Couple of things:

1) what does 'grep attrs_cleared /proc/fs/reiserfs/on-disk-super' show?

2) does mount -o attrs ... make a difference?

thanks,
-chris
