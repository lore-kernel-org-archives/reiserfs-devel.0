From: Horst von Brand <vonbrand@inf.utfsm.cl>
Subject: Re: silent semantic changes with reiser4
Date: Tue, 07 Sep 2004 18:01:12 -0400
Message-ID: <200409072201.i87M1CaS005935@laptop11.inf.utfsm.cl>
References: <spam@tnonline.net>
Return-path: <reiserfs-list-return-21597-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Message from Spam <spam@tnonline.net> 
   of "Tue, 07 Sep 2004 23:29:35 +0200." <2010165891.20040907232935@tnonline.net> 
List-Id: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Spam <spam@tnonline.net>
Cc: Hans Reiser <reiser@namesys.com>, Christer Weinigel <christer@weinigel.se>, David Masover <ninja@slaphack.com>, Tonnerre <tonnerre@thundrix.ch>, Linus Torvalds <torvalds@osdl.org>, Pavel Machek <pavel@ucw.cz>, Jamie Lokier <jamie@shareable.org>, Chris Wedgwood <cw@f00f.org>, viro@parcelfarce.linux.theplanet.co.uk, Christoph Hellwig <hch@lst.de>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

Spam <spam@tnonline.net> said:
> Horst von Brand <vonbrand@inf.utfsm.cl> said:
> > Hans Reiser <reiser@namesys.com> said:
> >> Horst von Brand wrote:
> >> >Hans Reiser <reiser@namesys.com> said:
> >> >>Horst von Brand wrote:
> >> >>>Spam <spam@tnonline.net> said:
> >> >>>>Christer Weinigel <christer@weinigel.se> said:

[...]

> >> >>>>>2. How do we want to expose named streams?
> >> >>>>>  One suggestion is file-as-directory in some form.

> >> >>>Which is broken, as it forbids hard links to files.

> >> >>No, it forbids hard links to the directory aspect of the file-directory
> >> >>duality.

> >> >How do you distinguish a "hard link to the directory personality" from
> >> >"hard link to the file personality"?

> >> Put in (undoubtedly overly) simple terms, if you can do it to a file you
> >> can do it to the file personality, but if you currently can only do it
> >> to a directory and get an error from attempting it to a file then in the
> >> new scheme doing it to the hard link only gives the same error.

> > Let me sort this out: If it can't be done POSIXly to a directory, it can't
> > be done in Reiser4 to a file (which really is a directory too). So there
> > can be exactly _one_ hard link to a file. Way borken.

>   But you can make a hard link to a file in reiser4,

IIUC, this isn't safe (you might tie your filesystem into a knot this way,
as LWN puts it). Sure, you can do it right now (just as I was able to
create hard links to directories in some propietary Unix way back;
untangling the resulting mess, complete with segfaulting fsck, was a whole
world of fun... it just happened rarely enough that it did not matter very
much); production versions will have to forbid it (or incurr in _huge_
overheads locking everything in sight, or detecting loops).
-- 
Dr. Horst H. von Brand                   User #22616 counter.li.org
Departamento de Informatica                     Fono: +56 32 654431
Universidad Tecnica Federico Santa Maria              +56 32 654239
Casilla 110-V, Valparaiso, Chile                Fax:  +56 32 797513
