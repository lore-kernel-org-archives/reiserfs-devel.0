From: Jamie Lokier <jamie@shareable.org>
Subject: Re: silent semantic changes with reiser4
Date: Thu, 26 Aug 2004 16:02:02 +0100
Message-ID: <20040826150202.GE5733@mail.shareable.org>
References: <20040825200859.GA16345@lst.de> <Pine.LNX.4.58.0408251314260.17766@ppc970.osdl.org> <20040825204240.GI21964@parcelfarce.linux.theplanet.co.uk> <Pine.LNX.4.58.0408251348240.17766@ppc970.osdl.org> <20040825212518.GK21964@parcelfarce.linux.theplanet.co.uk> <20040826001152.GB23423@mail.shareable.org> <20040826003055.GO21964@parcelfarce.linux.theplanet.co.uk> <20040826010049.GA24731@mail.shareable.org> <412DA40B.5040806@namesys.com> <20040826140500.GA29965@fs.tum.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20695-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20040826140500.GA29965@fs.tum.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Adrian Bunk <bunk@fs.tum.de>
Cc: Hans Reiser <reiser@namesys.com>, viro@parcelfarce.linux.theplanet.co.uk, Linus Torvalds <torvalds@osdl.org>, Christoph Hellwig <hch@lst.de>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

Adrian Bunk wrote:
> What is the technical reason why a tar plugin should be reiser4 
> specific, instead of a generic VFS or userspace solution that would 
> allow the same also on other fs like e.g. iso9660?

It should be a generic VFS plugin, not reiser4 or userspace.  The VFS
plugin should call out to userspace for most actions (except handling
cached data), and it should take advantage of special reiser4 features
for storage and performance optimisations.  But it should still work
over a standard filesystem, when those special features aren't
available.  I guess FUSE and many earlier projects are heading in this
direction.

A generic userspace solution doesn't let you "cd" into a tar file from
all programs like you can inside Midnight Commander.

Gnome and KDE take the approach that every userspace system call
should be intercepted and filtered, to create the illusion of virtual
data.  As a result, different programs see different virtual data: you
can't just cut and paste a path from Gnome or KDE into any other
program.  It's not just a "social problem of libraries" thing:
sometimes I have programs which don't link to libc.  Sometimes I have
programs which mustn't link with anything that calls malloc().  It'd
be silly for them to have a different view of the filesystem just
because they can't link with some userspace library.

The Gnome/KDE/Midnight Commander pure userspace solution is silly: if
_every_ program in the system should get the same view, it makes much
more sense for the kernel to filter the system calls and redirect the
virtual accesses to a userspace daemon, while keeping the real
accesses at full speed.

Furthermore is makes much more sense for the kernel's page cache to
hold those uncompressed pages, than for every userspace application to
try and cooperatively manage a cache of uncompressed fragments in the
most inefficient way.

There's another problem with the Midnight Commander approach.  If I
"cd" into a tar file, and then a program writes to the tar file, I
don't always see the changes straight away. The two views aren't
coherent.  This isn't an easy problem to solve, but it should be
solved.

When a simple "cd" into .tar.gz or .iso is implemented properly, it
will have _no_ performance penalty after you have first looked in the
file, so long as it remains in the on-disk cache.  And, the filesystem
will manage that cache intelligently.

Imagine: for looking at source files and such, you probably won't
bother untarring in future, and you won't bother keeping untarred
source trees in your home directory for easy access to things you look
at often.  Why waste the space?  You could install whole applications
as a .tar and run them from within it, with no performance penalty.

Similarly, the filesystem will be able to archive directories
automatically that haven't been touched in a long time, with no
visible change except increased storage space.  "grep" will be a bit
slower, but you'll have a useful search tool by then (using coherent
indexes) which will be more useful than grep, and much faster.

-- Jamie
