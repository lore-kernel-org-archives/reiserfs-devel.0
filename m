From: Pavel Machek <pavel@ucw.cz>
Subject: Re: silent semantic changes with reiser4
Date: Wed, 1 Sep 2004 06:59:22 +0200
Sender: linux-fsdevel-owner@vger.kernel.org
Message-ID: <20040901045922.GA512@elf.ucw.cz>
References: <200408311931.i7VJV8kt028102@laptop11.inf.utfsm.cl> <41352279.7020307@slaphack.com>
Mime-Version: 1.0
Return-path: <linux-fsdevel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <41352279.7020307@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Masover <ninja@slaphack.com>
Cc: Horst von Brand <vonbrand@inf.utfsm.cl>, Jamie Lokier <jamie@shareable.org>, Chris Wedgwood <cw@f00f.org>, viro@parcelfarce.linux.theplanet.co.uk, Linus Torvalds <torvalds@osdl.org>, Christoph Hellwig <hch@lst.de>, Hans Reiser <reiser@namesys.com>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

Hi!

> | You do need extra tools anyway, placing them in the kernel is cheating
> (and
> | absolutely pointless, IMHO).
> 
> Repeat after me:  plugins in kernel does NOT equal tools in kernel.
> 
> It's not hard to, for instance, imagine a generic plugin for archive
> manipulation which talks to a userspace daemon/library.  The kernel
> doesn't know anything other than (maybe) a list of extensions that are
> archives.  All else is handled in userspace -- the idea that "this is a
> zipfile" and "zipfiles can be extracted with the 'zip' command" are all
> in userspace.
> 
> It's not about the kernel, it's about the interface.  And see my other mail:
> 	cat foo.zip/README
> 	less foo.zip/contents/bar.c
> is a lot easier than
> 	lynx http://google.com/search?q=zip
> 	emerge zip
> 	man zip
> 	unzip foo.zip
> 	cat bar.c
> which already assumes quite a lot of expertise.

If you only want nice user interface, you can have that today. Its
done using coda, and hosted at uservfs.sf.net.
								Pavel
-- 
When do you have heart between your knees?
