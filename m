From: Chris Worley <chrisw@lnxi.com>
Subject: Re: Permission denied on access to files; even as
	root
Date: 18 Jun 2002 00:17:06 -0600
Message-ID: <1024381027.3767.20.camel@xserver>
References: <1024353028.26879.10577.camel@xserver>
	<3D0CC8F8.9090206@namesys.com> <1024354235.21004.10629.camel@xserver>
	<20020616222011.A15910@namesys.com> <1024358539.26879.10782.camel@xserver>
	<1024374536.26879.11318.camel@xserver>  <20020617091352.B18719@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10755-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <20020617091352.B18719@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Long day.  Tried booting into single user mode, and running reiserfsck
with --fix-fixable, it would say it was running in "fixable" mode, but
end saying there were 30000+ files that could be fixed w/
"--fix-fixable"; repeated many times, but the files permissions would
not cooperate.  I finally did a "--rebuild-tree"... there's a few
hundred files in lost+found (much less than the last time I had to
rebuild the tree),  The reiserfs loadable module has debugging turned
on, which might help if there are any problems remaining.

Anyway, the system is up and stable again.  I can create large files
too.

Thanks to all that helped!

Chris

On Sun, 2002-06-16 at 23:13, Oleg Drokin wrote:
> Hello!
> 
> On Mon, Jun 17, 2002 at 10:28:55PM -0600, Chris Worley wrote:
> 
> > Just give me a hint: if I can install/compile/lilo SuSE's
> > kernel-source-2.4.16.SuSE-32.i386.rpm and the listed reiserfs tools,
> > will my file system be repairable?  Most of /lib /usr/lib /usr/*bin and
> > /*bin have become unusable.
> 
> Yes, usually reiserfsck fixes such a problem without any troubles and
> all the files are accessible again.
> 
> You may even not compile SuSE kernel, but take precompiled one (and the tools
> too) from updates. Though I do not know if they have LVM support suitable for
> you.
> 
> Bye,
>     Oleg
> 


