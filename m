From: Pavel Machek <pavel@ucw.cz>
Subject: Re: silent semantic changes with reiser4
Date: Mon, 6 Sep 2004 18:56:17 +0200
Sender: linux-fsdevel-owner@vger.kernel.org
Message-ID: <20040906165617.GE13539@atrey.karlin.mff.cuni.cz>
References: <1215700165.20040905135749@tnonline.net> <20040905115854.GH26560@thundrix.ch> <1819110960.20040905143012@tnonline.net> <20040906105018.GB28111@atrey.karlin.mff.cuni.cz> <6010544610.20040906143222@tnonline.net> <m3wtz7h2l6.fsf@zoo.weinigel.se> <826067315.20040906171320@tnonline.net> <m3sm9vh06b.fsf@zoo.weinigel.se> <20040906155456.GC13539@atrey.karlin.mff.cuni.cz> <m3pt4zjs81.fsf@zoo.weinigel.se>
Mime-Version: 1.0
Return-path: <linux-fsdevel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <m3pt4zjs81.fsf@zoo.weinigel.se>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christer Weinigel <christer@weinigel.se>
Cc: Spam <spam@tnonline.net>, Tonnerre <tonnerre@thundrix.ch>, Linus Torvalds <torvalds@osdl.org>, Horst von Brand <vonbrand@inf.utfsm.cl>, David Masover <ninja@slaphack.com>, Jamie Lokier <jamie@shareable.org>, Chris Wedgwood <cw@f00f.org>, viro@parcelfarce.linux.theplanet.co.uk, Christoph Hellwig <hch@lst.de>, Hans Reiser <reiser@namesys.com>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

Hi!

> >Plus mount required root priviledges last time I checked.
> 
>     bash$ ls -l /bin/mount 
>     -rwsr-xr-x  1 root root 78504 May  4 23:34 /bin/mount
> 
> with proper policies in userspace it allows users to perform mounts.  

You want to do exec() each time you enter a archive? I do not think
that is good idea.

> I'm not suggesting that the kernel should be unchanged, but really,
> some of the proposals here, to put a hell of a lot of complexity into
> the kernel it just wet dreams with not much thought of how it affects
> the kernel.  What happened to the philosophy of putting complexity and
> policy in userspace?  Look at khttpd and tux, they were hacks in the
> kernel to try things out.  But what ended up in the kernel is generic
> infrastructure that is useful for a lot more applications than just a
> web server.  That is the right way to do things.

Well, generic infrastructure for uservfs would be enough for me... And
it is few lines in kernel.
								Pavel
