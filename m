From: Jamie Lokier <jamie@shareable.org>
Subject: Re: The argument for fs assistance in handling archives (was: silent semantic changes with reiser4)
Date: Thu, 2 Sep 2004 01:24:31 +0100
Message-ID: <20040902002431.GN31934@mail.shareable.org>
References: <20040826150202.GE5733@mail.shareable.org> <200408282314.i7SNErYv003270@localhost.localdomain> <20040901200806.GC31934@mail.shareable.org> <Pine.LNX.4.58.0409011311150.2295@ppc970.osdl.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-21239-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.58.0409011311150.2295@ppc970.osdl.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Torvalds <torvalds@osdl.org>
Cc: Horst von Brand <vonbrand@inf.utfsm.cl>, Adrian Bunk <bunk@fs.tum.de>, Hans Reiser <reiser@namesys.com>, viro@parcelfarce.linux.theplanet.co.uk, Christoph Hellwig <hch@lst.de>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

Linus Torvalds wrote:
> > I'm going to explain why filesystem support for .tar.gz or other
> > "document container"-like formats is useful.  This does _not_ mean tar
> > in the kernel (I know someone who can't read will think that if I
> > don't say it isn't); it does mean hooks in the kernel for maintaining
> > coherency between different views and filesystem support for cacheing.

Thanks for your reply.

> I think that's a valid thing, but there are some fundamental problems with 
> it if you expect it to work on a normal filesystem (ie something that 
> isn't fundamentally designed as a database).
> 
> For example, _what_ kind of coherency do you think is acceptable? Quite
> frankly, using standard UNIX interfaces, absolute coherency just isn't an
> option, because it's just not possible to try to atomically update a view
> at the same time somebody else is writing to the "main file". "mmap()" is
> the most obvious example of this, but even the _basic_ notion of multiple
> "read" calls is not atomic without locking that is _way_ too expensive.
>
> A "read()" on a file is not atomic even on the _plain_ file: if somebody 
> does a concurrent "write()", the reader may see a partial update. This 
> becomes a million times more confusing if the reader is seeing a 
> structured view of the file the writer is modifying.

I agree.  Coherency should be about equivalent to what writing flat
files offers.

(For now.  Eventually I think we'll see transactional I/O in Linux, to
solve the sort of updater-to-server glitches which are currently
solved by putting even trivial data behind clunky database servers).

The coherency I'd like would also ensure that you'll never see an
invalid file structure in the long term, even if during writing
operations you might see temporarily invalid structure.

That is easy if you only have read-only views.

> Also, it's likely impossible to write() to the view-file, again unless you 
> expect all the underlying filesystems to be something really special.

Right.  I wonder if you read the part of my message which deals with
lazy updates of container files.

The idea is that write() to a view-file doesn't repack the container
file until the container file is read.

Practically, that means the view-file's write handler, which is
probably in userspace, grabs a kind of mandatory lock (similar to
F_SETLEASE) on the container file and then truncates it.  After a
time, or when a program tries to read the container (whichever comes
first), the view-file's handler is notified, it regenerates the
container file, and releases the lock.

This is the form of coherency needed to make writes work properly.

(You can take it more fine grained, locking at the page level, but
that's just to improve performance some more.  It's not fundamental.)

Notice that it doesn't need a special filesystem.  View-file writes
will work with any ordinary filesystem.  A special filesystem would
make it perform better (much better), by allowing the truncated state
to persist across reboots, with an xattr to say what's needed to
recreate the data -- but it's not fundamentally necessary.

It does need kernel support for that kind of lock, which F_SETLEASE
isn't, and notifications of mount events, and notifications of
file writes.

> So from a _practical_ standpoint, I suspect that the best you can really 
> do pretty cheaply (and which gets you 90% of what you probably want) is:
> 
>  - open-close consistency: the "validity" of the cache is checked at 
>    _open_ time, and no guarantees are given about the cache being 
>    updated afterwards.
>  - read-only access to the cache (ie you can only read the view, not write 
>    to it).

I think that gets 90% of the useful features, but leaves out some
applications which would raise eyebrows when they actually work --
i.e. the component editing applications.

> and quite frankly, I think you can do the above pretty much totally in
> user space with a small library and a daemon (in fact, ignoring security
> issues you probably don't even need the daemon). And if you can prototype
> it like that, and people actually find it useful, I suspect kernel support
> for better performance might be possible.

Right now it's stupidly impossible for a daemon to monitor a file for
changes and not be tricked by mtime faults, because someone can link
to the file and modify it on another path.  That's obviously a bug in
dnotify which I keep meaning to fix.  There are other dnotify
problems, some of which are fundamental when it's over a network.

I do care about security issues, for things like an "md5" or
"compiled" attribute especially, but for a prototype that's just
something to live with.

> Suggested interface:
> 
> 	int open_cached_view(int base_fd, char *type, char *subname);

Something userspace is useful anyway, so that a fully userspace
alternative is available, so that people writing apps will take up the
approach and take advantage of fs-level support where available while
still being portable elsewhere.

> see what I'm aiming at? You start out with a generic "attribute cache" 
> library that does some hacky things (like depending on "mtime" for 
> coherency) and then if that works out you can see if it's useful.

Ok but I don't think that form of it is useful!  It's the sort of
interface that specific attribute-using programs will have to use if
they're to be portable, but it doesn't provide any special advantages
to any other programs.

Gnome VFS, KDE etc. provide much of that kind of interface already.
Evidently some people find that useful.  But I don't, precisely
because it's so tied into one set of programs or another.

This is where the file-as-directory metadata stuff is so potentially
interesting.  It's actually a nice interface that every program can see.

It's the nice interface when running on Linux that'll make it deliciously
worthwhile for portable applications, such as MP3 retaggers and PDF
image extractors, to be written in the form of a tool plus a plugin
for a common view-file library, instead of all in the tool as they are now.

Without the feature of a nice interface on Linux, there's no reason
why application writers would bother to learn and use a view-file library.

To be fair, the whole thing could be prototyped (with glitches, but
enough to demonstrate) in userspace, running everything through
something like uservfs or even NFS, especially with file-as-directory
being blessed at the VFS level.

That is exactly the right way to go about it.  I started some work on
that back in '99, around the same time Pavel was exerimenting with
podfuk (which become uservfs), but haven't and don't have the time or
money(*) to take it further.

-- Jamie

(*) That's a hint to potential employers who want to support this work,
by the way.
