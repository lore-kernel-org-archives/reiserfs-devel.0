From: Horst von Brand <vonbrand@inf.utfsm.cl>
Subject: Re: silent semantic changes with reiser4
Date: Tue, 07 Sep 2004 17:02:20 -0400
Message-ID: <200409072102.i87L2K4u005503@laptop11.inf.utfsm.cl>
References: <reiser@namesys.com>
Return-path: <reiserfs-list-return-21590-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Message from Hans Reiser <reiser@namesys.com> 
   of "Tue, 07 Sep 2004 12:14:44 MST." <413E08A4.9020005@namesys.com> 
List-Id: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: Spam <spam@tnonline.net>, Christer Weinigel <christer@weinigel.se>, David Masover <ninja@slaphack.com>, Tonnerre <tonnerre@thundrix.ch>, Linus Torvalds <torvalds@osdl.org>, Pavel Machek <pavel@ucw.cz>, Jamie Lokier <jamie@shareable.org>, Chris Wedgwood <cw@f00f.org>, viro@parcelfarce.linux.theplanet.co.uk, Christoph Hellwig <hch@lst.de>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

Hans Reiser <reiser@namesys.com> said:
> Horst von Brand wrote:
> >Hans Reiser <reiser@namesys.com> said:
> >>Horst von Brand wrote:
> >>>Spam <spam@tnonline.net> said:
> >>>>Christer Weinigel <christer@weinigel.se> said:

[...]

> >>>>>2. How do we want to expose named streams?
> >>>>>  One suggestion is file-as-directory in some form.

> >>>Which is broken, as it forbids hard links to files.

> >>No, it forbids hard links to the directory aspect of the file-directory 
> >>duality.

> >How do you distinguish a "hard link to the directory personality" from
> >"hard link to the file personality"?

> Put in (undoubtedly overly) simple terms, if you can do it to a file you 
> can do it to the file personality, but if you currently can only do it 
> to a directory and get an error from attempting it to a file then in the 
> new scheme doing it to the hard link only gives the same error.

Let me sort this out: If it can't be done POSIXly to a directory, it can't
be done in Reiser4 to a file (which really is a directory too). So there
can be exactly _one_ hard link to a file. Way borken.

> Or, we can ask Alexander to help us use his deadlock detection algorithm 
> and try to do things right....

Good luck with that one. I'd suspect if it can be made to work, it will
have _huge_ overhead, so much that it is useless. I'd love to be proven
wrong, but I won't hold my breath.
-- 
Dr. Horst H. von Brand                   User #22616 counter.li.org
Departamento de Informatica                     Fono: +56 32 654431
Universidad Tecnica Federico Santa Maria              +56 32 654239
Casilla 110-V, Valparaiso, Chile                Fax:  +56 32 797513

