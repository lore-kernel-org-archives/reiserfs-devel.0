From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: making reiser4/AMD64 hardlock
Date: Fri, 12 Nov 2004 21:17:39 +0300
Message-ID: <200411122117.39613.vitaly@namesys.com>
References: <1099472359.8158.36.camel@localhost> <1100073674.31776.21.camel@localhost> <1100102927.1659.64.camel@tribesman.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22365-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1100102927.1659.64.camel@tribesman.namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Vladimir Saveliev <vs@namesys.com>, Jake Maciejewski <maciejej@msoe.edu>
Cc: reiserfs-list@namesys.com

On Wednesday 10 November 2004 19:08, Vladimir Saveliev wrote:
> Hello
>
> On Wed, 2004-11-10 at 11:01, Jake Maciejewski wrote:
> > I documented a few more AMD64 errors/panics. The system hasn't been
> > freezing since I enabled debugging, but make, dd, or whatever else hits
> > the bug(s) still freeze.
> >
> > http://people.msoe.edu/~maciejej/patches/AMD64_reiser4_debug/11-08-04/
> > with reiser4progs 1.0.2 and my custom patched 2.6.9 kernel
> >
> > http://people.msoe.edu/~maciejej/patches/AMD64_reiser4_debug/11-09-04/
> > with reiser4progs 1.0.2 and 2.6.10-rc1 with the ftp.namesys.com patch
>
> Would you please try to reproduce this problem (reiser4[dd(7926)]:
> check_blocks_bitmap (fs/reiser4/plugin/space/bitmap.c:1174)[zam-623])
> with the attached patch?
>
> > Every test has been on a freshly made filesystem.
> >
> > You might be interested to know that I think fsck failed to fix
> > corruption after my 11-08-04/test1. When I tried to build the kernel
> > after a --build-fs, make failed. I didn't have checksums to verify the
> > tree, so something else could have been wrong. It froze when I tried to
> > dump metadata.

Would you also run fsck.reiser4 --check on the device after fsck.reiser4 --build-fs
to find out if fs is fixed or not before continue using it ?


> > On Thu, 2004-11-04 at 12:52 +0300, Vladimir Saveliev wrote:
> > > Hello
> > >
> > > On Wed, 2004-11-03 at 23:18, Hendrik Visage wrote:
> > > > On Wed, Nov 03, 2004 at 02:59:19AM -0600, Jake Maciejewski wrote:
> > > > > I've been testing reiser4 on 2.6.9 (patches from 2.6.9-mm1 and
> > > > > fixes from reiser4-for-2.6.9.diff). I have reiser4progs and libaal
> > > > > 1.0.1. Syslog doesn't catch any errors when I get hardlocks
> > > > > (haven't tried SysRq). I figured I could at least give you guys a
> > > > > hint about what kind of usage pattern kills reiser4.
> > >
> > > Please try to get as much debugging information as you can.
> > > sysrq+t's output may help to understand the problem. Do you have "File
> > > systems" -> "Reiser4" -> "Enable reiser4 debug options" -> "Assertions"
> > > turned on? If no, please turn it, it may also help. Try to catch its
> > > output, via serial console if it will not be stored in logs.
> > >
> > > I will try your test in x86.
> > >
> > > > I recall the last response about this issue:
> > > >
> > > >  We need an AMD64 cpu...
> > >
> > > well, yes.

-- 
Thanks,
Vitaly Fertman


