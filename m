From: Horst von Brand <vonbrand@inf.utfsm.cl>
Subject: Re: silent semantic changes with reiser4
Date: Tue, 07 Sep 2004 14:15:54 -0400
Message-ID: <200409071815.i87IFseF004907@laptop11.inf.utfsm.cl>
References: <reiser@namesys.com>
Return-path: <reiserfs-list-return-21580-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Message from Hans Reiser <reiser@namesys.com> 
   of "Tue, 07 Sep 2004 11:05:39 MST." <413DF873.1090304@namesys.com> 
List-Id: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: Spam <spam@tnonline.net>, Christer Weinigel <christer@weinigel.se>, David Masover <ninja@slaphack.com>, Tonnerre <tonnerre@thundrix.ch>, Linus Torvalds <torvalds@osdl.org>, Pavel Machek <pavel@ucw.cz>, Jamie Lokier <jamie@shareable.org>, Chris Wedgwood <cw@f00f.org>, viro@parcelfarce.linux.theplanet.co.uk, Christoph Hellwig <hch@lst.de>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

Hans Reiser <reiser@namesys.com> said:
> Horst von Brand wrote:
> >Spam <spam@tnonline.net> said:
> >>Christer Weinigel <christer@weinigel.se> said:

[...]

> >>>2. How do we want to expose named streams?

> >>>   One suggestion is file-as-directory in some form.

> >Which is broken, as it forbids hard links to files.

> No, it forbids hard links to the directory aspect of the file-directory 
> duality.

How do you distinguish a "hard link to the directory personality" from
"hard link to the file personality"? And how do you make sure that only one
of them can be followed if you go to the directory, while allowing several
to the exact same file?!

> >Now you have 3 principal types of objects: Directories, containers (files
> >with streams), and files (no streams).

> No, the reiser4 design supports only files and directories, but makes 
> them able to do what people use streams for.

I.e., you have files/directories with/without "use as streams" stuff. 4
types (or uses) of things.

> The reiser4 design is based on a hatred of streams, and a desire to show 
> that adding more features to files and directories makes streams 
> unnecessary.

Trade one ugly wart for others...
-- 
Dr. Horst H. von Brand                   User #22616 counter.li.org
Departamento de Informatica                     Fono: +56 32 654431
Universidad Tecnica Federico Santa Maria              +56 32 654239
Casilla 110-V, Valparaiso, Chile                Fax:  +56 32 797513
