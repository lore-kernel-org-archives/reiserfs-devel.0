From: Horst von Brand <vonbrand@inf.utfsm.cl>
Subject: Re: silent semantic changes with reiser4
Date: Tue, 07 Sep 2004 20:15:36 -0400
Message-ID: <200409080015.i880Fald003078@localhost.localdomain>
References: <david.lang@digitalinsight.com>
Return-path: <reiserfs-list-return-21612-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Message from David Lang <david.lang@digitalinsight.com> 
   of "Tue, 07 Sep 2004 15:56:08 MST." <Pine.LNX.4.60.0409071552070.10789@dlang.diginsite.com> 
List-Id: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Lang <david.lang@digitalinsight.com>
Cc: Christer Weinigel <christer@weinigel.se>, Hans Reiser <reiser@namesys.com>, David Masover <ninja@slaphack.com>, Spam <spam@tnonline.net>, Tonnerre <tonnerre@thundrix.ch>, Linus Torvalds <torvalds@osdl.org>, Pavel Machek <pavel@ucw.cz>, Jamie Lokier <jamie@shareable.org>, Chris Wedgwood <cw@f00f.org>, viro@parcelfarce.linux.theplanet.co.uk, Christoph Hellwig <hch@lst.de>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

David Lang <david.lang@digitalinsight.com> said:
> On Tue, 8 Sep 2004, Christer Weinigel wrote:
> > David Lang <david.lang@digitalinsight.com> writes:

[...]

> > So what happens if I have a text file foo.txt and add an author
> > attribute to it?  When I read foo.txt the next time it's supposed to
> > give me a serialized version with both the contents of foo.txt _and_
> > the author attribute?
> >
> > That would definitely confuse me.
> >
> > Or did I misunderstand something?

> good point. under my scheme you would need to access foo.txt/foo.txt or 
> foo.txt/. instead of just foo.txt

> I guess my way would work if there is a way to know that a file has been 
> extended

Out of the question if you want to use legacy tools.

>          (or if you just make it a habit of opening the file/file instead 
> of just file) but not for random additions of streams to otherwise normal 
> files.

And then a file called foo inside directory foo will have to be refered to
as foo/foo/foo...

> Oh well, it seemed like a easy fix (and turned out to be to easy to be 
> practical)

My gut feeling is that this whole concept is too messed up to be sorted
out. That something can easily be done given whatever underlying structure
there is doesn't make it worthwhile to do it. Just as it is absurdly easy
to allow hard links to directories if you look at how they are implemented,
but the consecuences aren't that easy to live with.
-- 
Dr. Horst H. von Brand                   User #22616 counter.li.org
Departamento de Informatica                     Fono: +56 32 654431
Universidad Tecnica Federico Santa Maria              +56 32 654239
Casilla 110-V, Valparaiso, Chile                Fax:  +56 32 797513
