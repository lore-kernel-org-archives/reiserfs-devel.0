From: Oleg Drokin <green@namesys.com>
Subject: Re: Is it good for a PDA fs?
Date: Sat, 22 Jun 2002 23:07:48 +0400
Message-ID: <20020622230748.A1981@namesys.com>
References: <20020622115207.E23457@gerf.org> <20020622175746.I13075@parcelfarce.linux.theplanet.co.uk> <3D14B8E9.4020808@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10796-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <3D14B8E9.4020808@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: Chris Dukes <pakrat@www.uk.linux.org>, The Doctor What <docwhat@gerf.org>, reiserfs-list@namesys.com

Hello!

On Sat, Jun 22, 2002 at 09:50:33PM +0400, Hans Reiser wrote:
> >faster.  The tail merging might save space, but I would like to see
> >a study of its effects on the longevity of compact flash.
> >I think, but could be mistaken, than you want JFFS or JFFS2.
> I also have a sharp zaurus with 256M CF......
> Currently the CF uses VFAT, yes?
> I bet it has the same wear issues, and no space savings....

CF is different story. They fight level of wearing in underlying layer.
And on high level they emulate IDE.
Zaurus also have compact flash memory directly accessible by CPU, that
one can be access via MTD devices in Linux. There you can actually
control wering by yourself. But reiserfs (v3) is not very suited for that
JFFS & JFFS2 do.

And you can format CF with reiserfs without any problems
But do not expect that windows or digital cameras would understand
that ;)
Also - in conjunctions with PDAs - reiserfs is quite memory (RAM) hungry,
so using it on 32M ram box is somewhat questionable.

And static 32M journal (that's 13% off your CF size, btw)

> The zaurus has a non-standard kernel though, and it is based off of some 
> rather old release (2.4.4?).  You would want to apply their kernel 
> extensions to 2.4.18 or later I think  before using reiserfs....  If you 
> do so, and get it working, let me know, the only reason I haven't used 
> reiserfs on my CF is that I don't know where to get a recent kernel with 
> their (presumably useful to the PDA) extensions....

Building ARM kernels is easy.
I always build kernels for my ARM toys myself.

and I bet that Zaurus kernel is based off some -rmk kernel with
may be minor patches (sources of these should be available at Sharp
of course).
So getting (making) new kernel should be trivial.
Especially if they use some decent bootloader that allows to have
several kernels.

> Marcelo is doing a great job with keeping 2.4 stable.....

If only he'd release 2.4.19 soon...

But he is probably out for kernel con too... So no new 2.4 kernel
for a while it seems.

Bye,
    Oleg
