From: viro@parcelfarce.linux.theplanet.co.uk
Subject: Re: silent semantic changes with reiser4
Date: Thu, 26 Aug 2004 04:13:47 +0100
Sender: linux-fsdevel-owner@vger.kernel.org
Message-ID: <20040826031347.GQ21964@parcelfarce.linux.theplanet.co.uk>
References: <20040824202521.GA26705@lst.de> <412CEE38.1080707@namesys.com> <20040825200859.GA16345@lst.de> <Pine.LNX.4.58.0408251314260.17766@ppc970.osdl.org> <20040825204240.GI21964@parcelfarce.linux.theplanet.co.uk> <Pine.LNX.4.58.0408251348240.17766@ppc970.osdl.org> <20040825212518.GK21964@parcelfarce.linux.theplanet.co.uk> <20040826001152.GB23423@mail.shareable.org> <20040826003055.GO21964@parcelfarce.linux.theplanet.co.uk> <20040826010049.GA24731@mail.shareable.org>
Mime-Version: 1.0
Return-path: <linux-fsdevel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20040826010049.GA24731@mail.shareable.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jamie Lokier <jamie@shareable.org>
Cc: Linus Torvalds <torvalds@osdl.org>, Christoph Hellwig <hch@lst.de>, Hans Reiser <reiser@namesys.com>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

On Thu, Aug 26, 2004 at 02:00:49AM +0100, Jamie Lokier wrote:
> viro@parcelfarce.linux.theplanet.co.uk wrote:
> > > Is this a problem if we treat entering a file-as-directory as crossing
> > > a mount point (i.e. like auto-mounting)?
> > 
> > Yes - mountpoints can't be e.g. unlinked.  Moreover, having directory
> > mounted on non-directory is also an interesting situation.
> 
> Ok, so can we make it so mountpoints can be unlinked? :)

User-visible change of behaviour and IIRC a SuS violation on top of that.
 
> I think the underlying file does not stay locked, and once you've
> entered it as a directory, it can be unlinked.

So why lock it at all in that case?

> I didn't mean locking a chain of mountpoints, I meant the temporary
> state where two dentries and/or inodes are locked, parent and child,
> during a path walk.  However I'm not very familiar with that part of
> the VFS and I see that the current RCU dcache might not lock that much
> during a path walk.

Never had been needed on crossing mountpoints, actually.

> I agree, users shouldn't be able to pin down a file.
> 
> I think unlink() should succeed on a file while something is visiting
> inside its metadata directory.

See above.  Again, the fundamental problem with that is allowing unlink
and friends on a mountpoint.  I would love to do that, but it always
generated -EBUSY on all Unices.  Linux got a bit more users and userland
code than Plan 9 - they can afford such changes, but...

And yes, from the kernel POV it's trivial to do - witness the MNT_DETACH
codepath in umount - it's much simpler than "normal" umount exactly because
it doesn't try to emulate old "it's busy, can't umount" behaviour.

With umount we could introduce "don't bother with that shit" flag.  With
unlink() we would have to make that default behaviour to be useful.
