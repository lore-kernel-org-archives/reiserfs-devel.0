From: Hans Reiser <reiser@namesys.com>
Subject: Re: silent semantic changes with reiser4
Date: Mon, 06 Sep 2004 23:32:05 -0700
Sender: linux-fsdevel-owner@vger.kernel.org
Message-ID: <413D55E5.1090103@namesys.com>
References: <200409061814.i86IEcPJ005086@laptop11.inf.utfsm.cl> <413CB219.5030800@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <413CB219.5030800@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: David Masover <ninja@slaphack.com>
Cc: Horst von Brand <vonbrand@inf.utfsm.cl>, Spam <spam@tnonline.net>, Tonnerre <tonnerre@thundrix.ch>, Christer Weinigel <christer@weinigel.se>, Linus Torvalds <torvalds@osdl.org>, Pavel Machek <pavel@ucw.cz>, Jamie Lokier <jamie@shareable.org>, Chris Wedgwood <cw@f00f.org>, viro@parcelfarce.linux.theplanet.co.uk, Christoph Hellwig <hch@lst.de>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

David Masover wrote:

>
> There are some things which can't be solved without patching.  Version
> control is one such thing.

You can do most of the version control stuff without patching, for 
instance selecting a version by name is easy (see Clearcase).  Clearcase 
users mostly do not patch user space binaries.  But your point is 
generally true that there are features that knowing about them allows 
you to better employ them.

> But then there can be more generic patches
> -- as soon as the transaction API is done, you only have to patch apps
> to use that, and have a version control reiser4 plugin.
>
> | I'd go the other way around: Get userspace to agree on a common 
> framework,
> | make it work in userspace; if (extensive, hopefully) experience 
> shows that
> | a pure userspace solution has issues that can't be solved except by 
> kernel
> | assistance, so be it.
>
> We already have such a framework -- it's called "VFS".

If doing it in the kernel is so hard, why hasn't it stopped us yet? ;-)

I am not asking other people to contibute their labor to making this 
thing they view as infeasible work, I am just asking them to get out of 
the way please, and let the users decide whether they like it.

Nothing significant about the reiserfs project was thought likely to 
work by sensible people before it worked.  I am a bit used to that.  
After all, Oracle's IFS and several similar projects proved filesystems 
on top of balanced trees cannot  perform well....;-)

Anyone who complains about kernel bloat should first consider that 
reiser4 is not by any means the largest filesystem in the kernel.

Hans
