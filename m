From: Christer Weinigel <christer@weinigel.se>
Subject: Re: silent semantic changes with reiser4
Date: 07 Sep 2004 00:37:22 +0200
Sender: linux-fsdevel-owner@vger.kernel.org
Message-ID: <m3hdqbja71.fsf@zoo.weinigel.se>
References: <200409061814.i86IEcPJ005086@laptop11.inf.utfsm.cl>
	<413CB219.5030800@slaphack.com>
Mime-Version: 1.0
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <413CB219.5030800@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Masover <ninja@slaphack.com>
Cc: Horst von Brand <vonbrand@inf.utfsm.cl>, Spam <spam@tnonline.net>, Tonnerre <tonnerre@thundrix.ch>, Christer Weinigel <christer@weinigel.se>, Linus Torvalds <torvalds@osdl.org>, Pavel Machek <pavel@ucw.cz>, Jamie Lokier <jamie@shareable.org>, Chris Wedgwood <cw@f00f.org>, viro@parcelfarce.linux.theplanet.co.uk, Christoph Hellwig <hch@lst.de>, Hans Reiser <reiser@namesys.com>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

David Masover <ninja@slaphack.com> writes:

> Second, there are quite a few things which I might want to do, which can
> be done with this interface and without patching programs, but would
> require massive patches to userspace.  There have been numerous
> examples.

Please give one example?  There is a lot of handwaving here on all
sides.

> | I'd go the other way around: Get userspace to agree on a common framework,
> | make it work in userspace; if (extensive, hopefully) experience shows that
> | a pure userspace solution has issues that can't be solved except by kernel
> | assistance, so be it.
> 
> We already have such a framework -- it's called "VFS".

That you'd like to break the semantics of.  Great.

  /Christer

-- 
"Just how much can I get away with and still go to heaven?"

Freelance consultant specializing in device driver programming for Linux 
Christer Weinigel <christer@weinigel.se>  http://www.weinigel.se
