From: Horst von Brand <vonbrand@inf.utfsm.cl>
Subject: Re: silent semantic changes with reiser4
Date: Tue, 31 Aug 2004 15:31:07 -0400
Message-ID: <200408311931.i7VJV8kt028102@laptop11.inf.utfsm.cl>
References: <pavel@ucw.cz>
Return-path: <reiserfs-list-return-21170-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Message from Pavel Machek <pavel@ucw.cz> 
   of "Tue, 31 Aug 2004 10:21:44 +0200." <20040831082144.GA535@elf.ucw.cz> 
List-Id: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pavel Machek <pavel@ucw.cz>
Cc: David Masover <ninja@slaphack.com>, Jamie Lokier <jamie@shareable.org>, Chris Wedgwood <cw@f00f.org>, viro@parcelfarce.linux.theplanet.co.uk, Linus Torvalds <torvalds@osdl.org>, Christoph Hellwig <hch@lst.de>, Hans Reiser <reiser@namesys.com>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

Pavel Machek <pavel@ucw.cz> said:
> David Masover <ninja@slaphack.com> said:

[...]

> > Just want to extract the tar file?  Maybe something like
> > cat foo.tgz/gunzip
> > In which case (of course) foo.tgz/gunzip has exactly the same directory
> > contents as foo.tgz
> 
> Yes, that would work.
> 
> > In fact, for just about any syntax anyone could suggest, I can't really
> > see why you can't just replace all weird symbols with a slash and a
> > symbol.  Instead of
> > 	foo.tgz#utar
> > you have
> > 	foo.tgz/#/utar
> > Only difference is, some things which used to require special tools can
> > now be serviced by less than what's in busybox.
> 
> That would work, too. I do not get your comment about busybox.

You do need extra tools anyway, placing them in the kernel is cheating (and
absolutely pointless, IMHO).
-- 
Dr. Horst H. von Brand                   User #22616 counter.li.org
Departamento de Informatica                     Fono: +56 32 654431
Universidad Tecnica Federico Santa Maria              +56 32 654239
Casilla 110-V, Valparaiso, Chile                Fax:  +56 32 797513
