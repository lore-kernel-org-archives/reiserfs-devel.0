From: Hans Reiser <reiser@namesys.com>
Subject: Re: resizer?
Date: Fri, 15 Apr 2005 10:20:43 -0700
Message-ID: <425FF7EB.80505@namesys.com>
References: <4250BAA0.6000708@slaphack.com> <20050404085301.GA6211@backtop.namesys.com> <4251EFB3.8070803@slaphack.com> <425D50FE.20501@namesys.com> <425DF0AA.9020804@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23884-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <425DF0AA.9020804@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Masover <ninja@slaphack.com>
Cc: Alex Zarochentsev <zam@namesys.com>, reiserfs-list@namesys.com

The current repacker code uses the allocate on flush code and the
transaction code, and walks through the tree sorting it, walking in both
directions.

Hans

David Masover wrote:

> Hans Reiser wrote:
>
> >David Masover wrote:
>
>
> >>I realize that this may not be quite the industrial-strength repacker
> >>that you wanted, but it should be immediately useful, which is a lot
> >>better than "We might do it if you pay us."
>
>
> >Just wait a little, and shortly after we go into the kernel we will work
> >on the repacker.
>
> >Hans
>
>
> Disclaimer:  I've hardly read any of the Reiser4 code, and I'm not
> really an authority on this subject.  I just like to pretend that I am.
>  I would take this off-list, but I'm curious about whether I'm wrong.
>
> The repacker (and the resizer) doesn't seem like a hugely complicated
> concept, unless you're trying to streamline the user experience during
> the process.  "On-line" means that I don't have to use a bootdisk and
> stop all my servers.  It doesn't mean that I would do it at any time
> other than 2 AM, when I do backups, when I generally expect almost 0
> traffic.
>
> Basically, I'm saying that an off-line or a slow on-line shrinker should
> have been done by now.  In fact, it should have been done before the
> meta-files, because meta-files benefit from a repacker, but not the
> other way around.
>
> Since you've told me to wait, I'm going to write this, because it's
> easier for me to write documentation than to read code.  This is
> probably the fault of school, and will likely disappear this summer.
>
> Anyway, this is how I think the resizer should be done:
>
> If we are growing the FS, we should lock everything necessary, then
> change the size value for the FS and make the new blocks available.
> Unless we're actually storing something in unused nodes, this should be
> an instantaneous operation which requires very little hacking to add.  I
> seem to remember that there was even an offline resizer (growing only)
> awhile ago.
>
> If we are shrinking the FS, we first set the new size of the FS in RAM,
> so that nothing will try to write to the "chopped-off" portion until
> we're done.
>
> Next, we turn off the "write-in-the-middle" feature for large
> database-like files (where a block in the middle of a huge file may be
> written twice to avoid fragmentation), so that absolutely no new writes
> will go to the chopped-off portion.
>
> Basically, the filesystem should already think it's shrunken by now, we
> just need to make sure it doesn't freak out when it _reads_ blocks past
> the end of the FS.  We should capture warnings about this and dirty
> those nodes on the spot (nodes which are being read and which are in the
> chopped section) -- they are already in RAM, so it'll be faster that way.
>
> Next, we start walking the tree (as you described), dirtying all the
> blocks we find which are in the chopped portion and leaving the rest
> alone.  We need to be careful about locking here, but that should just
> mean "Lock the block we're dealing with, or if locks aren't that
> granularity, lock the whole file."  Locking should block, and userland
> shouldn't have to know about it except to notice that the FS seems a
> little slow right then.
>
> This isn't as dangerous as it seems.  If there is a crash, we just go
> back to the old size -- automatically, since the new size hasn't been
> written to disk anywhere yet -- with the only difference being that most
> of the files will be already moved to where we want them.
>
> Locking isn't as hard as it seems.  If this were a VFS-level operation,
> we'd have to worry about a new directory being created, a file being
> moved, or our current path being deleted out from under us, but we
> aren't working on the semantic layer, we're working on the key/object
> layer.  If I'm right, that means that all the things that we'd have to
> worry about are merely seen as new writes, and would thus go to the new
> places.
>
> Metadata blocks may need a tiny bit of special treatment, since it may
> be some small amount of data changing in-place.  All we do here is, when
> we notice any attempted write outside the new FS size, but inside the
> old FS size, we relocate before we flush it out to disk.  If this means
> there's some parent metadata block we need to move, we do it afterwards,
> as part of the same transaction.  When we finally get to a parent block
> that does not need to be moved, we close the transaction.  This isn't as
> elegant as the method for moving data blocks, but it works.  I think.
>
> The nice thing about this is that for the most part, the net impact on
> normal FS operation is about the same as that of doing a large "cp -a".
>
> Thoughts?  How close to right is this?  Do you already have another
> document on the same thing that I should be reading?
>
