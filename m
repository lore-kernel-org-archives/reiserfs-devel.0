From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: fsck.reiser4 can't fix 1 fixable corruption
Date: Fri, 23 Apr 2004 13:03:50 +0400
Message-ID: <200404231303.50547.vitaly@namesys.com>
References: <200404201733.51809.rmeijer@internet.gr> <40880F5C.6080207@namesys.com> <1082703897.3616.9.camel@firefly>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18175-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1082703897.3616.9.camel@firefly>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Yury Umanets <umka@namesys.com>, Hans Reiser <reiser@namesys.com>
Cc: Domenico Andreoli <cavok@tiscali.it>, reiserfs-list@namesys.com

On Friday 23 April 2004 11:04, Yury Umanets wrote:
> On Thu, 2004-04-22 at 21:30, Hans Reiser wrote:
> > Domenico Andreoli wrote:
> > >On Wed, Apr 21, 2004 at 09:30:07PM +0200, Sander Sweers wrote:
> > >>NOTE: the ebuilds have /--enable-stand-alone/ to have grub build
> > >> reiser4 support.
> > >
> > >how hard is to have reiser4 support built in grub?
> > >
> > >-----[ Domenico Andreoli, aka cavok
> > > --[ http://filibusta.crema.unimi.it/~cavok/gpgkey.asc
> > >   ---[ 3A0F 2F80 F79C 678A 8936  4FEE 0677 9033 A20E BC50
> >
> > Yury told me it was done....  Yury....
>
> Hello!
>
> Yes, it was done. But probably it is broken now due to lots of last
> changes like new plugins, plugin inheritance, interface changes etc.
>
> We should ask Vitaly what is the status of it now...

It seems Hans asks why reiser4 support is not included into the 
grub yet. The patch for the grub is in the reiser4progs package, 
but IIRC will not be included into the grub untill reiser4 ships. 
Yura, did you get this answer?

-- 
Thanks,
Vitaly Fertman


