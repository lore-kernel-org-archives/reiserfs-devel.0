From: Ming Zhang <mingz@ele.uri.edu>
Subject: Re: Versioning Plugin
Date: Sat, 12 Nov 2005 22:05:49 -0500
Message-ID: <1131851150.21584.54.camel@localhost.localdomain>
References: <200511111359.39715.jgilmore@glycou.com>
	 <200511111656.04891.pvh@uvic.ca>
	 <1131804415.8550.14.camel@localhost.localdomain>
	 <437662CC.9010307@slaphack.com>
	 <1131833125.8550.27.camel@localhost.localdomain>
	 <4376AB51.5080607@slaphack.com>
Reply-To: mingz@ele.uri.edu
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26906-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4376AB51.5080607@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Masover <ninja@slaphack.com>
Cc: Peter van Hardenberg <pvh@uvic.ca>, reiserfs-list@namesys.com

On Sat, 2005-11-12 at 20:56 -0600, David Masover wrote:
> Ming Zhang wrote:
> > On Sat, 2005-11-12 at 15:46 -0600, David Masover wrote:
> > 
> >>Ming Zhang wrote:
> >>
> >>>On Fri, 2005-11-11 at 16:56 -0800, Peter van Hardenberg wrote:
> >>>
> >>>
> >>>>On November 11, 2005 05:59 am, John Gilmore wrote:
> >>>>
> >>>>
> >>>>>Does anybody remember GoBack? It was a versioning
> >>>>>system for windows 95/98 that was incredibly flexible and useful. Tracked
> >>>>>all changes to the whole disk. Old versions of a file? no problem. grab an
> >>>>>old version of a directory for referance temporarily? easy. Got a virus?
> >>>>>revert the whole HD, and then grab the newer copies of your documents and
> >>>>>saved games as needed.
> >>>>
> >>>>My thoughts on this:
> >>>>
> >>>>The versioning would be an audit plugin. When the file is modified, tag the 
> >>>>current version, copy it into a sub-directory (oh, I don't know, say 
> >>>>file/.revisions/<number/date>), and disable write access to it. You might not 
> >>>>even need extended filesystem attributes for this, but they would be handy 
> >>>>for tagging particular versions.
> >>>
> >>>
> >>>if a file is opened, modified 2 times, then closed. u will only generate
> >>>1 version right? so "When the file is modified" is inaccurate.
> >>
> >>How about "When the transaction was completed?"  Why does it matter?
> > 
> > 
> > then how u define a transaction? i mean we first need to choose a good
> > event/period to define what is a good meaningful version.
> > 
> > 
> > 
> >>>>Copy-on-write would make this action extremely cheap, only adding a couple of 
> >>>>extra writes to make it work.
> >>>
> >>>
> >>>add 1 line at the beginning of a 100MB text file will make this uncheap.
> >>
> >>Who has to work with 100 meg text files?  And why has this person not
> >>broken them down into 100 kilobyte text files?  Storage efficiency isn't
> >>really an issue there...
> > 
> > 
> > yes, 100MB/s text file is an extreme example, but a common case can be u
> > delete 1 frame in a streaming media file.
> 
> What do you mean by "streaming"?  (To me, "streaming media" usually
> means "over the Internet", which makes no sense here.)

what i mean is frame is independent from each other, so when u delete
one frame, other frame data keep unchanged, like change ABCDEFG from
ACDEFG.


> 
> > basically, a cow is not good
> > for a data shift situation. u have >99% data unchanged, just their
> > offset in file is changed. this lead to all blocks changed, then COW
> > will need to copy a lot.
> 
> When do you have a data shift situation where this is significant enough
> to impact COW, but not significant enough to affect normal performance?
> 
> As far as I know, *nix has no way to append to the beginning of a file,
> so if you're editing a large video file, say several gigs of DVD, you
> have to write out several gigs worth of data all over again because you
> want it shifted.

yes, this is also what i know. thanks for u analysis, i now agree that
COW should be ok for this case, considering the overhead.

but another issue about COW is that when u have lots of versions, any
write to original data will lead a lot of new writings to these COW
storage.

any place i can find document about how to write a plugin for reiser?
sounds like interesting. :P

ming

> 
> The filesystem may eventually provide more intelligent ways of messing
> with a file, and the COW system should be able to handle when a program
> appends to or chops off the beginning of a file.
> 
> Until then, we can rely somewhat on programs optimizing for speed --
> rather than rewrite several gigs, it could split the file into smaller
> files (thus, only the file which was changed is copied), or make it a
> sort of mini-FS in that it fragments the logical structure of the file
> so that it writes as little as possible -- for instance, inserting a
> clip in the middle might write to the end of a "project" file, instead
> of shifting half of that file over first.  You'd keep versions of the
> project file, not the stream (properly defragmented) you'd export when
> you're done.
> 
> For cases where developers didn't have to deal with the speed issues, we
> don't have to worry about it.  In the case of audio editing, if it's
> actually messing with the sound itself, no COW in the world will catch
> that.  If it's a mixing/sequencing program, that's usually stored as a
> "project", accompanied by lots of little WAV files, which don't change,
> and a tiny "project" file describing how they go together, which does
> change.
> 
> And for text files and office documents, the sizes just aren't usually
> enough for us to care.  My biggest OpenOffice.org document probably
> isn't a hundred kilobytes, and my disk space is measured in gigabytes.
> It'd take over ten thousand revisions to fill a gig with copies of one
> of those files.  Sure, we could make an Oasis plugin for OO.o to use, so
> all the contents of the document are stored as individual files, turned
> into a zipfile on demand to match the current standard -- but that's not
> worth it in the short term, and only really helps with presentations in
> the long term.
> 
> Actually, while I think it'd be nice to be able to more advanced
> splicing in a file (append or delete from the beginning or middle), I
> think it's more important to come up with a sane way for a program to
> access a file as a lot of little pieces, and to have a standard way of
> serializing them for transport (email or otherwise).  Kind of like XML,
> only it could be more efficient than the old model, instead of less.
> 
> Like XML in that XML allows programmers to dump internal structures to a
> human-readable file without writing parsers and serializers.  Move the
> serializing logic out to the FS, let it handle the performance, version
> control, and export issues.

