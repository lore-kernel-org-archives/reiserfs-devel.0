From: Peter Foldiak <Peter.Foldiak@st-andrews.ac.uk>
Subject: Re: Plugins: Pseudo-fun.
Date: Thu, 10 Nov 2005 12:17:53 +0000
Message-ID: <200511101217.54513.Peter.Foldiak@st-andrews.ac.uk>
References: <200511090320.33063.pvh@uvic.ca> <200511091105.44523.pvh@uvic.ca> <43724EA7.9010006@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26843-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <43724EA7.9010006@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>, Peter van Hardenberg <pvh@uvic.ca>
Cc: reiserfs-list@namesys.com

On Wednesday 09 November 2005 19:31, Hans Reiser wrote:
> Peter van Hardenberg wrote:
> >On November 9, 2005 10:02 am, Hans Reiser wrote:
> >>>Although the overall goal remains elusive, we think we should be able to
> >>>implement a new Reiser4 pseudo directory in 4dot (/..../). This
> >>> directory, called "user" will contain per-file user-defined attributes.
> >>
> >>Why would these go into the pseudo directory instead of into the
> >> directory?
>
> I think ..../user/hat-size is too long, and ..../hat-size is just fine
> if they go into "....".   The interesting question though is should they
> go into .... or into "."  Alternatively, they should go into ".....",
> and that way it can be known whether they were created by users and are
> things that are not contained by the object but are instead meta data
> about the object.
>
> so, we can either call it robert/hat-size or robert/..../hat-size or
> robert/...../hat-size or robert/..../user/hat-size, or, perhaps best of
> all, call it BOTH robert/...../hat-size and robert/hat-size and also
> have a contained-by/ for distinguishing the objects that are contained
> in a directory rather than describe the directory, as in
> robert/contained-by/stomach
>
> I think I really prefer the last.  Note that it requires 0 lines of code
> beyond allowing files to be directories.  Peter Foldiak (it seems we
> have two Peters now so I will be forced into formality.....), please
> comment on this, as I value your intuition in semantic matters.

Thanks. I think it is most important to have naming conventions (at least on 
the long run) that reflect the logical structure and relationships between 
objects AND NOTHING ELSE.
The reason for wanting nothing other than the logical structure is that 
everything else must be arbitrary and must be memorised. I think one of Hans' 
main points in his future vision white paper is that we should not have to 
learn the particular form of organisation that the people who stored an 
object decided to make up, as everything about naming should be "natural" and 
obvious from the logical structure of the objects. (Hans gives examples as 
how bad it is when you have to guess what fields are used in a database.)

So on this list (in connection with part-whole hierarchies) I argued 
previously that paragraph 2 of chapter 3 of a book should be named

book/chapter[3]/paragraph[2]

and not anything else. It should NOT matter whether the person who scanned the 
book decided to put each chapter into a separate "file" (whatever that 
concept will become) or into one big "file" with some way (e.g. markup, e.g. 
XML) to indicate the structure within that "file".
You can read this as "paragraph 2 OF chapter 3 OF the book".
I think I managed to convince Hans that on the long run, it would be much 
better to be able to

cat /home/peter/book

instead of

cat /home/peter/book/..../childcat

which is neither natural or obvious.

The trouble with this example is just that the person using the naming should 
not be required to know how the book is stored (by chapters or as one big 
object). [The whole point of uniting files and directories into objects is 
that this distinction should eventually vanish anyway. What you have on disk 
is a tree structure, and whether you give different parts of that tree should 
just be a matter of convenience. Which bits have metadata connected to them 
is another matter.]

Similarly, I would argue that if you want to know Robert's hat size, you 
should use

Robert/hat-size

and read it as "hat-size OF Robert".
This would be analogous to the conventional /etc/passwd read as "the passwd 
file OF the etc directory".

Another reading of the "/" operator would be "the value of", as in

subject/strike  to/elves  from/Santa

which would read as "the subject IS strike, the sender IS Santa, ..."
(It remains to be seem whether the "IS" and "OF" interpretation of "/" clash 
at some point. I can't see it at the moment.)

Anyway, my point is that if we can implement

Robert/size

for Robert's size then it is much preferable to anything more 
complicated-looking.
Also, possibly

Robert/..../size

should refer to the size of the Robert file (or object), rather than Robert's 
own size. This would be a very useful distinction to be able to make.

 Peter (Foldiak)
