From: Rogier Wolff <R.E.Wolff@harddisk-recovery.nl>
Subject: Re: ReiserFS problems
Date: Wed, 6 Aug 2003 19:49:42 +0200
Message-ID: <20030806194942.A32577@bitwizard.nl>
References: <20030806182055.A28562@bitwizard.nl> <20030806164852.GA14719@namesys.com> <20030806191806.A31496@bitwizard.nl> <20030806172834.GA15024@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15185-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20030806172834.GA15024@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleg Drokin <green@namesys.com>
Cc: Rogier Wolff <R.E.Wolff@harddisk-recovery.nl>, reiserfs-list@namesys.com, copy@harddisk-recovery.nl

On Wed, Aug 06, 2003 at 09:28:34PM +0400, Oleg Drokin wrote:
> On Wed, Aug 06, 2003 at 07:18:06PM +0200, Rogier Wolff wrote:
> > Linux version 2.4.20-rmap15i (root@obelix) (gcc version 2.95.3 20010315 (SuSE)) #1 SMP Fri May 23 15:08:55 CEST 2003
> > Dual athlon 2000. 
 
> Hm, there was a bug fixed after 2.4.20 was out, that might have lead
> to directory entries pointing to nowhere (visible to you as I/O
> error when trying to access some file).

We saw "permission denied" when trying to remove a file, even as
"root" wether we saw an IO error in the logs I don't remember.

> > > > A "surface scan" needs to read all the datablocks. But an fsck
> > > > doesn't. At least that's the normal case.
> > > reiserfsck --rebuild-tree is special, it actually reads in all the
> > > blocks on the device that are marked as used, to find metadata
> > > blocks and connect them to the tree (even if they were previously
> > > unconnected).  Unlike many other filesystems out there, reiserfs
> > > does not have fixed metadata locations, hence we absolutely need
> > > this scan.

> > I'm working on an XFS recovery. It's got it's inodes all over the
> > place as well. 
 
> And how do they find all of them when they are not sure that all of
> the inodes are properly referenced? Do they have separete bitmaps
> for metadata or something else?

Well, something went wrong. That's for sure. The mess I'm seeing has
required the help of an "repair_xfs" tool. (i.e. it's now more
properly messed up than it was before running that tool).

I'm not currently interested in how things happened. I have found the
directory that my client is looking for, and I'm going to find the
inodes that are referenced there. I'm going to recover those files,
and be done with it.
 
> > WOW it's documented. So it's not a bug. OK. Fine. 
> 
> This does not make it less annoying, though.
> But we cannot do much about it. Really.

If I think about it for 5 seconds I can find a solution. When mkfs-ing
a new partition, make up a random FS-ID. Store that ID in every block
that rebuild-tree needs to find.

If you use 32 bits out of every 4k block (0.1%) for this and if we
happen to have 4 different reiserfs images on our disk, then we'll
have a one in a billion chance of messing up our filesystem by running
--rebuild tree. 

> > > > We've noticed horrible slowdowns when the filesystem is > 90% full. It
> > > > turns out that when a block group is more than 90% full reiserfs will
> > > > prefer a different block group. i.e. it is ALWAYS switching block
> > > > groups when the whole disk is > 90% full. Something like that. When we
> > > > report something like that it's always: Ah, yes, that's an old bug
> > > > we've fixed it. Use patch.....
> > > In fact this is not exactly true, it only switches to other "block
> > > group" if you are creating new file. Why do you think this is a
> > > problem?  (of course I am speaking of 2.4.20+ kernels).

> > Well we were recovering data into 1G files, but performance of
> adding > a new block was horrible. It was doing this for every
> block. Either it

> This is really strange. Unless you are having horrible
> fragmentation, that should not happen.

It was happening. It was a bug. We reported it, and it was a known bug
by then. it had been fixed. We just needed to do a kernel-rebuild on
our main fileserver. We'd rather not. We might have eventually. Don't
worry about this. It got fixed. Apparently. For us we now consider
this a "known bug" and when we see the fill-percentage go above 90% we
know we have to clean up again. It's a shame we can't use the last
60Gb of our disk, but what the heck...

currently 80% done of reading the 0.98 million leaf nodes.....

See http://www.bitwizard.nl/io_throughput.gif for the plot of the IO
throughput that is achieved during this fsck. (red, green = read, blue
= write).  The peaks (near 1800s) are when I tried reading from our
other 600G partition (which got counted as well). The important drops
are not caused by other activity on the system. Probably some areas on
the disk that are less populated than the rest of the disk.  (I
removed 120G of data (in about 5 million files, 1 million directories)
this morning).

			Roger. 

-- 
+-- Rogier Wolff -- www.harddisk-recovery.nl -- 0800 220 20 20 --
| Files foetsie, bestanden kwijt, alle data weg?!
| Blijf kalm en neem contact op met Harddisk-recovery.nl!
