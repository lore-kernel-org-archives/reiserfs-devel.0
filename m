From: viro@parcelfarce.linux.theplanet.co.uk
Subject: Re: silent semantic changes with reiser4
Date: Thu, 26 Aug 2004 01:30:55 +0100
Sender: <viro@www.linux.org.uk>
Message-ID: <20040826003055.GO21964@parcelfarce.linux.theplanet.co.uk>
References: <20040824202521.GA26705@lst.de> <412CEE38.1080707@namesys.com> <20040825200859.GA16345@lst.de> <Pine.LNX.4.58.0408251314260.17766@ppc970.osdl.org> <20040825204240.GI21964@parcelfarce.linux.theplanet.co.uk> <Pine.LNX.4.58.0408251348240.17766@ppc970.osdl.org> <20040825212518.GK21964@parcelfarce.linux.theplanet.co.uk> <20040826001152.GB23423@mail.shareable.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20550-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20040826001152.GB23423@mail.shareable.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jamie Lokier <jamie@shareable.org>
Cc: Linus Torvalds <torvalds@osdl.org>, Christoph Hellwig <hch@lst.de>, Hans Reiser <reiser@namesys.com>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

On Thu, Aug 26, 2004 at 01:11:52AM +0100, Jamie Lokier wrote:
> Is this a problem if we treat entering a file-as-directory as crossing
> a mount point (i.e. like auto-mounting)?

Yes - mountpoints can't be e.g. unlinked.  Moreover, having directory
mounted on non-directory is also an interesting situation.

> Simply doing a path walk would lock the file and then cross the mount
> point to a directory.

*Ugh*

What would happen if you open that directory or chdir there?  If it's
"underlying file stays locked" - we are in even more obvious deadlocks.

> A way to ensure that preserves the lock order is to require that the
> metadata is in a different filesystem to its file (i.e. not crossing a
> bind mount to the same filesystem).
> 
> That has the side effect of preventing hard links between metadata
> files and non-metadata, which in my opinion is fine.

We don't actually need a different fs - different vfsmount will do just fine.

> The strict order is ensured by preventing bind mounts which create a
> path cycle containing a file->metadata edge.  One way to ensure that
> is to prevent mounts on the metadata filesystems, but the rule doesn't
> have to be that strict.  This condition only needs to be checked in
> the mount() syscall.

You really don't want to lock mountpoint on path lookup, so I don't see
how that would be relevant - it's a hell to clean up, for one thing
(I've crossed ten mountpoints on the way, when do I unlock them and
how do I prevent deadlocks from that?)  Besides, different namespaces
can have completely different mount trees, so tracking down all that
stuff would be hell in its own right.

The main issue I see with all schemes in that direction (and something
like that could be made workable) is the semantics of unlink() on
mountpoints.  *Especially* with users being able to see attributes of
files they do not own (e.g. reiser4 mode/uid/gid stuff).  Ability to
pin down any damn file on the system and make it impossible to replace
is not something you want to give to any user.
