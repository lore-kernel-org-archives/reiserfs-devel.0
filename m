From: Christer Weinigel <christer@weinigel.se>
Subject: Re: silent semantic changes with reiser4
Date: 06 Sep 2004 16:52:21 +0200
Sender: linux-fsdevel-owner@vger.kernel.org
Message-ID: <m3wtz7h2l6.fsf@zoo.weinigel.se>
References: <200408311931.i7VJV8kt028102@laptop11.inf.utfsm.cl>
	<Pine.LNX.4.58.0408311252150.2295@ppc970.osdl.org>
	<m3eklm9ain.fsf@zoo.weinigel.se> <20040905111743.GC26560@thundrix.ch>
	<1215700165.20040905135749@tnonline.net>
	<20040905115854.GH26560@thundrix.ch>
	<1819110960.20040905143012@tnonline.net>
	<20040906105018.GB28111@atrey.karlin.mff.cuni.cz>
	<6010544610.20040906143222@tnonline.net>
Mime-Version: 1.0
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <6010544610.20040906143222@tnonline.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Spam <spam@tnonline.net>
Cc: Pavel Machek <pavel@suse.cz>, Tonnerre <tonnerre@thundrix.ch>, Christer Weinigel <christer@weinigel.se>, Linus Torvalds <torvalds@osdl.org>, Horst von Brand <vonbrand@inf.utfsm.cl>, David Masover <ninja@slaphack.com>, Jamie Lokier <jamie@shareable.org>, Chris Wedgwood <cw@f00f.org>, viro@parcelfarce.linux.theplanet.co.uk, Christoph Hellwig <hch@lst.de>, Hans Reiser <reiser@namesys.com>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

Spam <spam@tnonline.net> writes:

> >>   The problem with the userspace library is standardization. What
> >>   would be needed is a userspace library that has a extensible plugin
> >>   interface that is standardized. Otherwise we would need lots of
> >>   different libraries, and I seriously doubt that 1) this will happen
> >>   and 2) we get all Linux programs to be patched to use it.
> 
> > libvfs from midnight commander (and anything build on the top of it)
> > already is very extensible.
> 
>   This wasn't my point. My point was about all applications using it.
>   Most aren't.

So why do you think that just because you put an interface into the
everyone will automatically start using it and use it without any
conflicts (i.e. is foo/icon a windows icon, a gif, png, or jpeg file,
what size is it, 16x16, 48x48...).  

When you add a new shared namespace, userspace must be taught about it
anyways.  So start with a userspace library, convince people to use
it, and when you know what people want, _then_ put it into the kernel
to increase performance or security.  Don't start with "wouldn't it be
nice if" without any thought behind it, it will just mean that we get
another useless and misdesigned interface in the kernel that we have
to live with for years.

Do you know how long it took to get rid of /dev/cua0 and the locking
mess associated with it?  (Deity!  I just checked on my FC2 system,
it's still there.  I thought it would be dead by now.)

  /Christer

-- 
"Just how much can I get away with and still go to heaven?"

Freelance consultant specializing in device driver programming for Linux 
Christer Weinigel <christer@weinigel.se>  http://www.weinigel.se
