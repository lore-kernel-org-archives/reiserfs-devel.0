From: Horst von Brand <vonbrand@inf.utfsm.cl>
Subject: Re: silent semantic changes with reiser4
Date: Mon, 06 Sep 2004 22:06:57 -0400
Message-ID: <200409070206.i8726vrG006493@localhost.localdomain>
References: <ninja@slaphack.com>
Return-path: <reiserfs-list-return-21548-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Message from David Masover <ninja@slaphack.com> 
   of "Mon, 06 Sep 2004 13:53:13 EST." <413CB219.5030800@slaphack.com> 
List-Id: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Masover <ninja@slaphack.com>
Cc: Spam <spam@tnonline.net>, Tonnerre <tonnerre@thundrix.ch>, Christer Weinigel <christer@weinigel.se>, Linus Torvalds <torvalds@osdl.org>, Pavel Machek <pavel@ucw.cz>, Jamie Lokier <jamie@shareable.org>, Chris Wedgwood <cw@f00f.org>, viro@parcelfarce.linux.theplanet.co.uk, Christoph Hellwig <hch@lst.de>, Hans Reiser <reiser@namesys.com>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

David Masover <ninja@slaphack.com> said:
> Horst von Brand wrote:
> | Spam <spam@tnonline.net> said:
> |
> | [...]
> |
> |
> |>  The problem with the userspace library is standardization. What
> |>  would be needed is a userspace library that has a extensible plugin
> |>  interface that is standardized. Otherwise we would need lots of
> |>  different libraries, and I seriously doubt that 1) this will happen
> |>  and 2) we get all Linux programs to be patched to use it.
> |
> |
> | What is the difference with a kernel implementation? Not by being
> | in-kernel will it make all the incompatible ways of doing this
> | magically vanish, and give outstanding performance. Plus handling
> | and maintaining the in-kernel stuff is _much_ harder than userspace
> | libraries.

> First of all, only the interface has to be in the kernel.  I haven't
> heard anyone suggest otherwise.

Right. But it is _another_ interface in the kernel, plus special userland
code supporting it.

> Second, there are quite a few things which I might want to do, which can
> be done with this interface and without patching programs,

Such as?

>                                                            but would
> require massive patches to userspace.  There have been numerous examples.

Haven't seen any that made sense to me, sorry.

> There are some things which can't be solved without patching.

Maybe. Question is, is it worth it (kernel modifications + userland
support, or just userland support, or leave it alone). Sure, it might make
your particular application easier to write (at a cost for _all_ filesystem
hackers!), perhaps even a bit faster; but is _your_ particular convenience
worth the cost for _everybody_?

>                                                                Version
> control is one such thing.

bk, cvs, svn, rcs, ... are working just fine here, thank you so much. Used
to work on SunOS and Solaris, even SCO Unix (I used at least rcs and cvs
there). No Reiser4 in sight.

>                             But then there can be more generic patches
> - -- as soon as the transaction API is done, you only have to patch apps
> to use that, and have a version control reiser4 plugin.

Again, _what_ version control exactly? Will the above packages be able to
make use of it (remember they all are cross-platform (at least cross-Unix),
and so quite unlikely to make use of a Reiser4 on Linux whackiness...)?

> | I'd go the other way around: Get userspace to agree on a common framework,
> | make it work in userspace; if (extensive, hopefully) experience shows that
> | a pure userspace solution has issues that can't be solved except by kernel
> | assistance, so be it.

> We already have such a framework -- it's called "VFS".

Right. It offers what applications need to build their own stuff. It is
minimalistic (well, sort of) and  time-proven.
-- 
Dr. Horst H. von Brand                   User #22616 counter.li.org
Departamento de Informatica                     Fono: +56 32 654431
Universidad Tecnica Federico Santa Maria              +56 32 654239
Casilla 110-V, Valparaiso, Chile                Fax:  +56 32 797513
