From: Narcoleptic Electron <narcoleptic_electron@yahoo.co.uk>
Subject: Re: More on Hard Links
Date: Tue, 9 Dec 2003 14:52:40 -0500 (EST)
Message-ID: <20031209195240.19057.qmail@web25006.mail.ukl.yahoo.com>
References: <87vfopyghf.fsf@uhoreg.ca>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-16304-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <87vfopyghf.fsf@uhoreg.ca>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Hubert Chan wrote: 

> "Narcoleptic" == Narcoleptic Electron writes:
> 
> [...]
> 
> Narcoleptic> A. Symlinks:
> Narcoleptic> ============
> 
> [...]
> 
> Narcoleptic> 2. By file (i.e. volume id and file
> id).  File id is a
> Narcoleptic> unique identifier for the file on the
> volume (eg.  inode
> Narcoleptic> number).  Not sure if there is a way to
> uniquely identify a
> Narcoleptic> volume reliably...
> 
> I don't think it's a good idea to classify these as
> symlinks.  For one
> thing, it's called a "symbolic" link, because the
> link contains a
> symbol: a path name.  Also, it works differently
> from regular
> symlinks.  IMHO, it would be better to give it
> another name.  (This is
> what I would call a "firmlink", and I think what Leo
> calls a "weak
> link".)

I see symbolic links as one-way links (there is a
link, and a target), in which the link indicates the
file in a symbolic way, and the target remains
unaffected.  As such, my links qualify, as the volume
ID/file ID combo is just as much a symbol indicating
the file as the path is.  My link simply represents a
superset of current symbolic link functionality.  You
can call it a firm link if you like (I've called it
that on another list!). 

> [...]
> 
> Narcoleptic> 2. Linking to a file on a different
> ReiserX
> Narcoleptic> volume.
> Narcoleptic>
> ---------------------------------------------------
> 
> I believe the plan is to have Reiser5 be a
> distributed filesystem,
> which will basically (AFAICT) solve all our problems
> and eliminates the
> need for cross-ReiserFSx hard links.  IMHO this is
> the better way to do
> things, since a distributed filesystem will already
> take into account a
> lot of problems that we have.
> 
> Not to say that you (or Leo) shouldn't pursue this
> idea.  You may not
> want to use the distributed stuff, or you may want
> to implement it as a
> proof of concept to convince other FS maintainers to
> add it to their
> FS, or etc.

I don't know much about Reiser5's distributed fs
plans... more reading is required for me here.
 
> [...]
> 
> Narcoleptic> My idea: Each volume can contain a
> "synchronized" copy of
> Narcoleptic> the underlying file.
> 
> My first reaction: "Bwaa!  Wasted space! 
> Consistency problems!"
> 
> Wasted space, you're of course aware of.
> 
> [...]

No, I'm not aware of any wasted space in my plan. 
Each volume must have its own copy of the file so that
it is available when the other volume dismounts.

> Consistency problems you've dealt with, sort of. 

What cases have I missed?

> I'm a bit wary of
> preventing the file from being changed if not all
> the involved volumes
> are mounted.  

It is the only way to ensure consistency.

> Also, if one volume dies and needs to
> be reformatted, or
> removed, you need to have some way of recovering. 

You can copy the hard link, then use it as a regular
local file (the sync list doesn't get copied with the
file).  You can also delete the hard link if you want
(thus replacing the actual file with that "NULL"
placeholder if its reference count is 0).

This brings me to another point: under this proposal,
all files would essentially have one of 3 states:
"online", "offline" (meaning that it is hard linked to
unavailable files), or "unknown" (not yet checked). 
Each file could have a pseudo-file attribute (i.e.
"+/Online") derived from the resolvability of the sync
list.  Perhaps a file manager would show offline files
with some sort of icon badge (i.e. a little
ghostbusters-style circle with crossbar).

So when an offline file is copied, the copy is online
(because the sync list doesn't go with it).

> It's hard to
> differentiate that from the volume just being
> unmounted.

Not sure what you mean.

> [...]
> 
> Narcoleptic> The principle of least privilege
> applies: if a file is on a
> Narcoleptic> non-writable volume, no files
> synchronized with it are
> Narcoleptic> modifiable.
> 
> So then you have the case where you have a file
> that's on a read-write
> partition, has all the bits necessary for writing,
> but is read-only.
> I'm not convinced this is the best thing to do.  But
> if you must have
> cross-filesystem hardlinks, I think this is what you
> must do.
> Really, it's a compromise.  I look at this situation
> and say: this is
> why we can't have cross-filesystem hardlinks. 
> Others may look at it
> and say: I really want cross-filesystem hardlinks,
> and so this is what
> I will do, which is reasonable, and doesn't
> completely suck.

Shouldn't all files on a read-only partition
automatically have their permission bits set to
read-only (or at least appear that way)?  If so, then
all files will have the permission bits set
identically, and no problem.

> [...]
> 
> Narcoleptic> 3. Linking to a file on a different
> non-ReiserX
> Narcoleptic> volume.
> Narcoleptic>
>
-------------------------------------------------------
> 
> Narcoleptic> Not possible (because "file
> synchronization" management
> Narcoleptic> code would be unique to ReiserX).  User
> either has to use a
> Narcoleptic> symlink or make a copy.
> 
> Well, if you implement it on ReiserFSx in a
> reasonably portable way,
> you may be able to convince other FS maintainers to
> use it (if they
> aren't completely opposed to the idea of
> cross-filesystem hardlinks).

True.


______________________________________________________________________ 
Post your free ad now! http://personals.yahoo.ca
