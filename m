From: Horst von Brand <vonbrand@inf.utfsm.cl>
Subject: Re: silent semantic changes with reiser4
Date: Mon, 06 Sep 2004 14:14:38 -0400
Message-ID: <200409061814.i86IEcPJ005086@laptop11.inf.utfsm.cl>
References: <spam@tnonline.net>
Return-path: <reiserfs-list-return-21544-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Message from Spam <spam@tnonline.net> 
   of "Sun, 05 Sep 2004 14:30:12 +0200." <1819110960.20040905143012@tnonline.net> 
List-Id: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Spam <spam@tnonline.net>
Cc: Tonnerre <tonnerre@thundrix.ch>, Christer Weinigel <christer@weinigel.se>, Linus Torvalds <torvalds@osdl.org>, Horst von Brand <vonbrand@inf.utfsm.cl>, Pavel Machek <pavel@ucw.cz>, David Masover <ninja@slaphack.com>, Jamie Lokier <jamie@shareable.org>, Chris Wedgwood <cw@f00f.org>, viro@parcelfarce.linux.theplanet.co.uk, Christoph Hellwig <hch@lst.de>, Hans Reiser <reiser@namesys.com>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

Spam <spam@tnonline.net> said:

[...]

>   The problem with the userspace library is standardization. What
>   would be needed is a userspace library that has a extensible plugin
>   interface that is standardized. Otherwise we would need lots of
>   different libraries, and I seriously doubt that 1) this will happen
>   and 2) we get all Linux programs to be patched to use it.

What is the difference with a kernel implementation? Not by being in-kernel
will it make all the incompatible ways of doing this magically vanish, and
give outstanding performance. Plus handling and maintaining the in-kernel
stuff is _much_ harder than userspace libraries.

I'd go the other way around: Get userspace to agree on a common framework,
make it work in userspace; if (extensive, hopefully) experience shows that
a pure userspace solution has issues that can't be solved except by kernel
assistance, so be it.
-- 
Dr. Horst H. von Brand                   User #22616 counter.li.org
Departamento de Informatica                     Fono: +56 32 654431
Universidad Tecnica Federico Santa Maria              +56 32 654239
Casilla 110-V, Valparaiso, Chile                Fax:  +56 32 797513
