From: Oleg Drokin <green@namesys.com>
Subject: Re: ReiserFS problems
Date: Wed, 6 Aug 2003 21:28:34 +0400
Message-ID: <20030806172834.GA15024@namesys.com>
References: <20030806182055.A28562@bitwizard.nl> <20030806164852.GA14719@namesys.com> <20030806191806.A31496@bitwizard.nl>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15183-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20030806191806.A31496@bitwizard.nl>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rogier Wolff <R.E.Wolff@harddisk-recovery.nl>
Cc: reiserfs-list@namesys.com, copy@harddisk-recovery.nl

Hello!

On Wed, Aug 06, 2003 at 07:18:06PM +0200, Rogier Wolff wrote:
> > > Reiserfs messed up our filesystem again (one file gives us "permission
> > And you use what kernel with what patches on what hardware?
> Linux version 2.4.20-rmap15i (root@obelix) (gcc version 2.95.3 20010315 (SuSE)) #1 SMP Fri May 23 15:08:55 CEST 2003
> Dual athlon 2000. 

Hm, there was a bug fixed after 2.4.20 was out, that might have lead to directory entries pointing to nowhere
(visible to you as I/O error when trying to access some file).

> > > A "surface scan" needs to read all the datablocks. But an fsck
> > > doesn't. At least that's the normal case.
> > reiserfsck --rebuild-tree is special, it actually reads in all the
> > blocks on the device that are marked as used, to find metadata
> > blocks and connect them to the tree (even if they were previously
> > unconnected).  Unlike many other filesystems out there, reiserfs
> > does not have fixed metadata locations, hence we absolutely need
> > this scan.
> I'm working on an XFS recovery. It's got it's inodes all over the
> place as well. 

And how do they find all of them when they are not sure that all of the inodes are
properly referenced? Do they have separete bitmaps for metadata or something else?

> > > later. So we hit control-C on the fsck.
> > That was big mistake.
> It was only a couple of percent done. All we have to do now is run it
> again, and let it continue.

Yes, you need to wait for it to finish.

> > > Question: If it is reading all datablocks, I'm guessing that it is
> > All one that are marked as occupied in the bitmaps.
> Well, we cleared the old 240G partition by copying over the data to
> our reiserfs partition. That's filled her up to almost 90%..... 

Well. As of now we do not have any better way of finding all of our metadata other than
reading all occupied blocks.

> > > datarecovery company. We probably don't have any current
> > > datarecoveries of people with Reiserfs on their disk. But if we had a
> > > disk-image with a valid (or not) Reiserfs on it, would it link that
> > > into our filesytem?
> > yes it will.
> > So basically speaking you do not want to run rebuild-tree operation on the 
> > FS that contains files with reiserfs metadata embedded in them in clear.
> > This is also explained in our FAQ.
> Oh, great. It provably corrupts our filesystem which is only fixed by
> running a rebuilt-tree, but if we have certain data (which we actually
> are likely to have!) then we simply can't. 

Well. This is actually unfortunate, I agree. In such a case you'd better
move your reiserfs images to some other place for the time of reiserfsck --rebuild-tree run.

> WOW it's documented. So it's not a bug. OK. Fine. 

This does not make it less annoying, though.
But we cannot do much about it. Really.

> > > We've noticed horrible slowdowns when the filesystem is > 90% full. It
> > > turns out that when a block group is more than 90% full reiserfs will
> > > prefer a different block group. i.e. it is ALWAYS switching block
> > > groups when the whole disk is > 90% full. Something like that. When we
> > > report something like that it's always: Ah, yes, that's an old bug
> > > we've fixed it. Use patch.....
> > In fact this is not exactly true, it only switches to other "block
> > group" if you are creating new file. Why do you think this is a
> > problem?  (of course I am speaking of 2.4.20+ kernels).
> Well we were recovering data into 1G files, but performance of adding
> a new block was horrible. It was doing this for every block. Either it

This is really strange. Unless you are having horrible fragmentation, that should
not happen.

> was doing a fruitless search on every block-add or it was actually
> adding the block to another block group. Anyway, performance dropped
> -=*A LOT*=- when this happened.

Can we ask for a metadata snapshot?
(debugreiserfs -d /dev/whatever_is_your_device | bzip2 -9c >metadata.bz2)
If you still have that FS, of course. It should not even be fully correct
for this to work.

> I think you're describing the way it should be, or "is now", but there
> was a bug that caused it to behave differently.

Or may be you just have some horrible fragmentation (for unknown reason).
I cannot tell without seeing what's on your fs.

Bye,
    Oleg
