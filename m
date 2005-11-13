From: Ming Zhang <mingz@ele.uri.edu>
Subject: Re: Versioning Plugin
Date: Sat, 12 Nov 2005 21:13:09 -0500
Message-ID: <1131847989.21584.31.camel@localhost.localdomain>
References: <200511111359.39715.jgilmore@glycou.com>
	 <200511111656.04891.pvh@uvic.ca>
	 <1131804415.8550.14.camel@localhost.localdomain>
	 <437662CC.9010307@slaphack.com> <43767289.1000402@namesys.com>
	 <1131843477.21584.3.camel@localhost.localdomain>
	 <b14e81f00511121755r64647fcaj864d1a2b21d73804@mail.gmail.com>
Reply-To: mingz@ele.uri.edu
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26895-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <b14e81f00511121755r64647fcaj864d1a2b21d73804@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: michael chang <thenewme91@gmail.com>
Cc: Hans Reiser <reiser@namesys.com>, David Masover <ninja@slaphack.com>, Peter van Hardenberg <pvh@uvic.ca>, reiserfs-list@namesys.com

On Sat, 2005-11-12 at 20:55 -0500, michael chang wrote:
> On 11/12/05, Ming Zhang <mingz@ele.uri.edu> wrote:
> > On Sat, 2005-11-12 at 14:54 -0800, Hans Reiser wrote:
> > > David Masover wrote:
> > >
> > > >Ming Zhang wrote:
> > > >
> > > >
> > > >>On Fri, 2005-11-11 at 16:56 -0800, Peter van Hardenberg wrote:
> > > >>
> > > >>
> > > >>
> > > >>>On November 11, 2005 05:59 am, John Gilmore wrote:
> > > >>>
> > > >>>
> > > >>>
> > > >>>>Does anybody remember GoBack? It was a versioning
> > > >>>>system for windows 95/98 that was incredibly flexible and useful. Tracked
> > > >>>>all changes to the whole disk. Old versions of a file? no problem. grab an
> > > >>>>old version of a directory for referance temporarily? easy. Got a virus?
> > > >>>>revert the whole HD, and then grab the newer copies of your documents and
> > > >>>>saved games as needed.
> > > >>>>
> > > >>>>
> > > >>>My thoughts on this:
> > > >>>
> > > >>>The versioning would be an audit plugin. When the file is modified, tag the
> > > >>>current version, copy it into a sub-directory (oh, I don't know, say
> > > >>>file/.revisions/<number/date>), and disable write access to it. You might not
> > > >>>even need extended filesystem attributes for this, but they would be handy
> > > >>>for tagging particular versions.
> > > >>>
> > > >>>
> > > >>if a file is opened, modified 2 times, then closed. u will only generate
> > > >>1 version right? so "When the file is modified" is inaccurate.
> > > >>
> > > >>
> > > one could do it for every file close, and that could be a state option
> > > for the versioning plugin, but most users will want to do it everytime
> > > they touch filename/..../checkin
> >
> > what u mean touch filename? is "ls" a touch? i think close, unlink,
> > create, is likely to be good candidate.
> 
> What happens if I open, truncate, append, close?  You have to consider
> that... in fact, what about just "open, append, close"?  Not every app
> acts the same.

yes, of course, i think we need to balance between these. anyway i think
each write a version is a bad idea with high overhead.

> 
> > >
> > > >
> > > >How about "When the transaction was completed?"  Why does it matter?
> > > >
> > > >
> > > >
> > > >>>Copy-on-write would make this action extremely cheap, only adding a couple of
> > > >>>extra writes to make it work.
> > > >>>
> > > >>>
> > > >>add 1 line at the beginning of a 100MB text file will make this uncheap.
> > > >>
> > > >>
> > > >
> > > >Who has to work with 100 meg text files?  And why has this person not
> > > >broken them down into 100 kilobyte text files?  Storage efficiency isn't
> > > >really an issue there...
> > > >
> > > >
> > > you need cross-version compression for this case.
> >
> > what u mean cross-version compression? interesting name. :P
> 
> Compression of the files' different versions together; see one of
> Hans' previous posts in this thread (in the archive or otherwise). 
> -.-'
> 
> That way, if there is version X which is a file, and verison Y is just
> a line at the top, the compression eliminates the duplication, so
> instead of
> 
> (old version + new version)
> ABCDEF + XABCDEF
>  on disk
> it becomes something like
> Y=ABCDEF
> X + XY
>  on disk  [note, I don't know squat about this, so an expert might
> tell differently -- if so, believe him, because he'll probably be the
> guy implementing this, when it/if gets implemented]
> 
> [not literally... hopefully you get what i mean by that]
> 
> > >
> > > >Anyway, I think the main win is from copy-on-write for the whole file.
> > > >
> > > >
> > > >
> > > >
> > > >
> > >
> >
> >
> 
> 
> --
> ~Mike
>  - Just my two cents
>  - No man is an island, and no man is unable.

