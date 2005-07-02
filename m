From: Horst von Brand <vonbrand@inf.utfsm.cl>
Subject: Re: reiser4 plugins
Date: Fri, 01 Jul 2005 21:48:09 -0400
Message-ID: <200507020148.j621m9m0006559@laptop11.inf.utfsm.cl>
References: <ninja@slaphack.com>
Return-path: <linux-kernel-owner+glk-linux-kernel=40m.gmane.org-S261366AbVGDCrv@vger.kernel.org>
In-Reply-To: Message from David Masover <ninja@slaphack.com> 
   of "Fri, 01 Jul 2005 14:55:12 EST." <42C59FA0.1090908@slaphack.com> 
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Masover <ninja@slaphack.com>
Cc: David Weinehall <tao@acc.umu.se>, =?ISO-8859-1?Q?Markus_T=F6rnqvist?= <mjt@nysv.org>, Douglas McNaught <doug@mcnaught.org>, Horst von Brand <vonbrand@inf.utfsm.cl>, Hubert Chan <hubert@uhoreg.ca>, Kyle Moffett <mrmacman_g4@mac.com>, Valdis.Kletnieks@vt.edu, Lincoln Dale <ltd@cisco.com>, Gregory Maxwell <gmaxwell@gmail.com>, Hans Reiser <reiser@namesys.com>, Jeff Garzik <jgarzik@pobox.com>, Christoph Hellwig <hch@infradead.org>, Andrew Morton <akpm@osdl.org>, linux-kernel@vger.kernel.org, ReiserFS List <reiserfs-list@namesys.com>

David Masover <ninja@slaphack.com> wrote:
> David Weinehall wrote:
> > On Fri, Jul 01, 2005 at 03:08:58AM -0500, David Masover wrote:
> >>David Weinehall wrote:

> >>>GNOME and KDE run on operating systems that run other kernels than
> >>>Linux, hence they have to implement their own userland VFS anyway.
> >>>Adding this to the Linux kernel won't help them one bit, unless
> >>>we can magically convince Sun to add it to Solaris, all different
> >>>BSD:s to add it to their kernels, etc.  Not going to happen.
> >>>An effort to get GNOME and KDE to unify their VFS:s would be
> >>>far more benificial,

> >> Than what?  Creating a unified VFS which I can access from Bash,
> >> and which obsoletes both GNOME and KDE's VFSes except in their
> >> presentation?

> > On one of the platforms that they support, yes.  But only for kernels
> > newer than 2.6.yy...  So they'd still have to have their own VFS for
> > 2.4.xx, 2.6.xx (xx < yy), FreeBSD, OpenBSD, Solaris, etc...

> Right.  But, /proc started somewhere, didn't it?

Sun.

> I have the feeling that other systems will duplicate it if it's good.

Linux copied here.

> Even if they don't, it would be more beneficial to me

How, exactly?

Besides, /your/ convenience isn't the only thing that matters...

>                                                       and probably
> most Linux users

"Most Linux users" don't use experimental filesystems at all...

>                  to have metafs supported in both GNOME and KDE, even
> if they still need an emulation layer to support other systems.

So Gnome and KDE get larger (and thus slower) for everybody. Besides, Gnome
and KDE will have to agree on the formats involved first, which is /exactly/
what is supposed to be impossible unless this stuff is implemented in the
kernel...
-- 
Dr. Horst H. von Brand                   User #22616 counter.li.org
Departamento de Informatica                     Fono: +56 32 654431
Universidad Tecnica Federico Santa Maria              +56 32 654239
Casilla 110-V, Valparaiso, Chile                Fax:  +56 32 797513
