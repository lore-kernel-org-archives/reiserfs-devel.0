From: Pavel Machek <pavel@suse.cz>
Subject: Re: silent semantic changes with reiser4
Date: Mon, 6 Sep 2004 12:50:18 +0200
Message-ID: <20040906105018.GB28111@atrey.karlin.mff.cuni.cz>
References: <200408311931.i7VJV8kt028102@laptop11.inf.utfsm.cl> <Pine.LNX.4.58.0408311252150.2295@ppc970.osdl.org> <m3eklm9ain.fsf@zoo.weinigel.se> <20040905111743.GC26560@thundrix.ch> <1215700165.20040905135749@tnonline.net> <20040905115854.GH26560@thundrix.ch> <1819110960.20040905143012@tnonline.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-21510-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1819110960.20040905143012@tnonline.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Spam <spam@tnonline.net>
Cc: Tonnerre <tonnerre@thundrix.ch>, Christer Weinigel <christer@weinigel.se>, Linus Torvalds <torvalds@osdl.org>, Horst von Brand <vonbrand@inf.utfsm.cl>, David Masover <ninja@slaphack.com>, Jamie Lokier <jamie@shareable.org>, Chris Wedgwood <cw@f00f.org>, viro@parcelfarce.linux.theplanet.co.uk, Christoph Hellwig <hch@lst.de>, Hans Reiser <reiser@namesys.com>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

Hi!

> >>   What if I do not use emacs, but vim, mcedit, gedit, or some other
> >>   editor? It doesn't seem logical to have to patch every application
> >>   that uses files.
> 
> > We would have to do that in  either case, so let's patch them to do it
> > in a nonintrusive way. And as to reading and writing inside tar files,
> > write and/or  use a really nice  userspace library to do  it. (As does
> > MacOS/X, as does KDE, etc.)
> 
>   The problem with the userspace library is standardization. What
>   would be needed is a userspace library that has a extensible plugin
>   interface that is standardized. Otherwise we would need lots of
>   different libraries, and I seriously doubt that 1) this will happen
>   and 2) we get all Linux programs to be patched to use it.

libvfs from midnight commander (and anything build on the top of it)
already is very extensible.
								Pavel
