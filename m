From: PFC <lists@boutiquenumerique.com>
Subject: Re: Plugins: Pseudo-fun.
Date: Thu, 10 Nov 2005 13:26:26 +0100
Message-ID: <op.sz0x6cegth1vuj@localhost>
References: <200511090320.33063.pvh@uvic.ca> <200511091105.44523.pvh@uvic.ca> <43724EA7.9010006@namesys.com> <200511101217.54513.Peter.Foldiak@st-andrews.ac.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-26845-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200511101217.54513.Peter.Foldiak@st-andrews.ac.uk>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; format="flowed"; delsp="yes"; charset="us-ascii"
To: Peter Foldiak <Peter.Foldiak@st-andrews.ac.uk>, Hans Reiser <reiser@namesys.com>, Peter van Hardenberg <pvh@uvic.ca>
Cc: reiserfs-list@namesys.com



> book/chapter[3]/paragraph[2]

I'd rather nitpick this to be :

book/chapters/3/paragraphs/2

simply because this makes little things like enumerating chapters,  
paragraphs etc. easier (not having to do some sprintf("chapter%d",n)),  
also all the items in the chapters/ are of the same "type" which is  
cleaner, and you can also have other attributes in book/ or in a chapter  
without having clutter.

ex :

book/author
book/chapters/1
book/chapters/2
book/chapters/3
book/chapters/4
book/chapters/5
book/title

seems better than

book/author
book/chapter1
book/chapter2
book/chapter3
book/chapter4
book/chapter5
book/title



>
> and not anything else. It should NOT matter whether the person who  
> scanned the
> book decided to put each chapter into a separate "file" (whatever that
> concept will become) or into one big "file" with some way (e.g. markup,  
> e.g.
> XML) to indicate the structure within that "file".
> You can read this as "paragraph 2 OF chapter 3 OF the book".
> I think I managed to convince Hans that on the long run, it would be much
> better to be able to
>
> cat /home/peter/book
>
> instead of
>
> cat /home/peter/book/..../childcat
>
> which is neither natural or obvious.
>
> The trouble with this example is just that the person using the naming  
> should
> not be required to know how the book is stored (by chapters or as one big
> object). [The whole point of uniting files and directories into objects  
> is
> that this distinction should eventually vanish anyway. What you have on  
> disk
> is a tree structure, and whether you give different parts of that tree  
> should
> just be a matter of convenience. Which bits have metadata connected to  
> them
> is another matter.]
>
> Similarly, I would argue that if you want to know Robert's hat size, you
> should use
>
> Robert/hat-size
>
> and read it as "hat-size OF Robert".
> This would be analogous to the conventional /etc/passwd read as "the  
> passwd
> file OF the etc directory".
>
> Another reading of the "/" operator would be "the value of", as in
>
> subject/strike  to/elves  from/Santa
>
> which would read as "the subject IS strike, the sender IS Santa, ..."
> (It remains to be seem whether the "IS" and "OF" interpretation of "/"  
> clash
> at some point. I can't see it at the moment.)
>
> Anyway, my point is that if we can implement
>
> Robert/size
>
> for Robert's size then it is much preferable to anything more
> complicated-looking.
> Also, possibly
>
> Robert/..../size
>
> should refer to the size of the Robert file (or object), rather than  
> Robert's
> own size. This would be a very useful distinction to be able to make.
>
>  Peter (Foldiak)
>


