From: Mike Fedyk <mfedyk@matchmail.com>
Subject: Re: Status of fsync() wrt mail servers
Date: Wed, 10 Sep 2003 16:49:27 -0700
Message-ID: <20030910234927.GE1461@matchmail.com>
References: <20030910002953.C14172@unbeatenpath.net> <20030910105102.GA535@rahul.net> <1063192474.18154.355.camel@tiny.suse.com> <20030910114103.GA26767@rahul.net> <1063197048.18155.357.camel@tiny.suse.com> <20030910101821.A15923@unbeatenpath.net> <20030910213244.GD1461@matchmail.com> <20030910173343.A16677@unbeatenpath.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15625-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20030910173343.A16677@unbeatenpath.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

On Wed, Sep 10, 2003 at 05:33:43PM -0500, Cameron Moore wrote:
> * mfedyk@matchmail.com (Mike Fedyk) [2003.09.10 16:32]:
> > On Wed, Sep 10, 2003 at 10:18:21AM -0500, Cameron Moore wrote:
> > > * mason@suse.com (Chris Mason) [2003.09.10 07:31]:
> > > > On Wed, 2003-09-10 at 07:41, Bennett Todd wrote:
> > > > > Metadata, yes, I've got that. How about the data? Does return from
> > > > > fsync guarantee that the data will be intact as well?
> > > > 
> > > > Yes
> > > 
> > > Thanks for hashing this out while I was asleep.  :-)  Guess I'll go
> > > morph into a die-hard Reiser fan now.  Thanks again
> > 
> > The whole perpose of fsync, is to flush the data to the disk.  That works
> > even with ext2, but it has the possibility of not flushing the meta-data.
> > 
> > With a journaled filesystem and fsync, you will have the data and meta-data
> > on the disk after the call returns.
> > 
> > Isn't that part of Posix or sus?
> 
> I'm not an expert on this, but my reading of the linux-kernel discussion
> I cited was that ext3 (at least at that revision point) only guaranteed
> that metadata would be written to disk when you fsync()'d a file.  You
> had to do a second fsync() on the parent directory to guarantee that the
> file's data was written to disk.

Ok, I've read through part of the thread, but I remember reading it before,
so...

What Matthias is asking for is to have any directory operation within the
same filesystem to be on the disk when the directory operation call has
completed.  At the time, the only way to get that was to mount the
filesystem in sync mode.  That meant that any operation on that filesystem
wouldn't return until it was on the disk, including data writes.

The drawback of that is that each write() (typically 4k) call would wait
until it was on the disk, and that's very slow.  What Matthias wanted was a
combination of sync mode, but only for directory operations.  That's where
ext3's dirsync mount option came from.

With fsync() you write the file like normal (it's not guaranteed
to be on the disk yet) where the call is buffered in memory, and it can be
written out or not yet depending on memory pressure (virtual memory terms).
Basically at this point it is in memory.  When fsync() is called, all of the
buffered data is sent to the disk, and the call doesn't return until the
disk signals that it has received the data.  You get that with or without
dirsync.

During the processing of a message the MTA will do several renames, moves,
and other calls that manipulate its directory entry.  Without dirsync, it is
up to the filesystem and memory pressure to determine when the meta-data
from those calls actually makes it to the disk.  (5 seconds with ext3 and 30
seconds with reiserfs3).  With dirsync, once the directory operation call is
made, it will not return to the userspace program until the meta-data has
made it the disk (because during the rename and directory operation calls,
there is no data only meta-data which is filesystem accounting data
(directory entries and etc.))  Or more likely made it to the journal in a
journaling filesystem, which is all that is needed to make the gurantee that
all state will be kept intact after the journal recovery (which is automatic
at boot time)

I don't know if reiserfs has a similar option (and are there modes for the
other posix filesystems that this could be moved up to the vfs level?)

So nothing about the effect of fsync() was mentioned, only that with -o sync
it was pointless, since each write() call was already syncronous, and
without -o sync, you would have the data, but not nessicarily know what its
delivery state is (if the crash is at the wrong time).

Anyone please point out any errors I may have made...

Thanks,

Mike
