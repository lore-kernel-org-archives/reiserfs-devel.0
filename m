From: Chris Worley <chrisw@lnxi.com>
Subject: Re: Permission denied on access to files; even as
	root
Date: Sun, 16 Jun 2002 23:14:21 +0000 (UTC)
Message-ID: <1024374536.26879.11318.camel@xserver>
References: <1024353028.26879.10577.camel@xserver>
	<3D0CC8F8.9090206@namesys.com> <1024354235.21004.10629.camel@xserver> 
	<20020616222011.A15910@namesys.com>  <1024358539.26879.10782.camel@xserver>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10750-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <1024358539.26879.10782.camel@xserver>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

I'm loosing files faster than I can compile.

Just give me a hint: if I can install/compile/lilo SuSE's
kernel-source-2.4.16.SuSE-32.i386.rpm and the listed reiserfs tools,
will my file system be repairable?  Most of /lib /usr/lib /usr/*bin and
/*bin have become unusable.

Thanks,

Chris

On Mon, 2002-06-17 at 18:02, Chris Worley wrote:
> So, If I:
> 
>     1) compile and install (configured as my previous kernel) the kernel
>     kernel-source-2.4.16.SuSE-32.i386.rpm at ftp.suse.com in
>     /pub/suse/i386/update/7.3/2.4.16-20020416 and
>     
>     2) configure/make/install reiserfsprogs-3.x.1b, and 
>     
>     3) remake my lvm initrd, then 
>     
>     4) reboot single user and run reiserfsck (no args), 
>     
> I'll have a working, fixed file system that will have large file
> capabilities?
> 
> Thanks,
> 
> Chris
> 
> On Sun, 2002-06-16 at 12:20, Oleg Drokin wrote:
> > Hello!
> > 
> > 
> > On Mon, Jun 17, 2002 at 04:50:33PM -0600, Chris Worley wrote:
> > 
> > > I'm Running Linux 2.4.10-4GB on SuSE 7.3 with reiserfsprogs-3.x.0j-1
> > 
> > Consider upgrading your server otherwise problem will repeat itself.
> > SuSE update kernel 2.4.16 would be fine for you.
> > 
> > > The problem is progressive.  I.e. "/bin/hostname" can't be executed
> > > today, and it was fine after trying the "conv".
> > 
> > Yes, newly created files occupy OIDs of already existing ones.
> > 
> > Upgrade kernel and fsck, then run reiserfsck and it will fix the problems.
> > 3.x.1b version of reiserfsprogs would be fine for you.
> > 
> > Bye,
> >     Oleg
> > 
> 
> 


