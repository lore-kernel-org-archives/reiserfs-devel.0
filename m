From: Rogier Wolff <R.E.Wolff@harddisk-recovery.nl>
Subject: Re: ReiserFS problems
Date: Wed, 6 Aug 2003 19:18:06 +0200
Message-ID: <20030806191806.A31496@bitwizard.nl>
References: <20030806182055.A28562@bitwizard.nl> <20030806164852.GA14719@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15181-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20030806164852.GA14719@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleg Drokin <green@namesys.com>
Cc: Rogier Wolff <R.E.Wolff@harddisk-recovery.nl>, reiserfs-list@namesys.com, copy@harddisk-recovery.nl

On Wed, Aug 06, 2003 at 08:48:52PM +0400, Oleg Drokin wrote:
> Hello!
> 
> On Wed, Aug 06, 2003 at 06:20:55PM +0200, Rogier Wolff wrote:
> 
> > Reiserfs messed up our filesystem again (one file gives us "permission
> 
> And you use what kernel with what patches on what hardware?

Linux version 2.4.20-rmap15i (root@obelix) (gcc version 2.95.3 20010315 (SuSE)) #1 SMP Fri May 23 15:08:55 CEST 2003

Dual athlon 2000. 

> > A "surface scan" needs to read all the datablocks. But an fsck
> > doesn't. At least that's the normal case.
 
> reiserfsck --rebuild-tree is special, it actually reads in all the
> blocks on the device that are marked as used, to find metadata
> blocks and connect them to the tree (even if they were previously
> unconnected).  Unlike many other filesystems out there, reiserfs
> does not have fixed metadata locations, hence we absolutely need
> this scan.

I'm working on an XFS recovery. It's got it's inodes all over the
place as well. 

> > later. So we hit control-C on the fsck.
> 
> That was big mistake.

It was only a couple of percent done. All we have to do now is run it
again, and let it continue.

> > But now mounting the filesystem gives us: 
> > ReiserFS version 3.6.25
> > reiserfs: checking transaction log (device 09:00) ...
> > is_tree_node: node level 0 does not match to the expected one 65534
> > vs-5150: search_by_key: invalid format found in block 0. Fsck?
> > vs-13070: reiserfs_read_inode2: i/o failure occurred trying to find stat data of [1 2 0x0 SD]
> > Using r5 hash to sort names
> > is_tree_node: node level 0 does not match to the expected one 65534
> > vs-5150: search_by_key: invalid format found in block 0. Fsck?
> > vs-2140: finish_unfinished: search_by_key returned -2
> > and fsck without --rebuild-tree gives us that an unfinished
> > --rebuild-tree was in progress. So we've restarted the tree-rebuild.
> 
> Yes. Once you run tree-rebuild, you must wait until it is completed.
> (Documentation update is scheduled just now. But in fact we mention this in our FAQ).
> 
> > Question: If it is reading all datablocks, I'm guessing that it is
> 
> All one that are marked as occupied in the bitmaps.

Well, we cleared the old 240G partition by copying over the data to
our reiserfs partition. That's filled her up to almost 90%..... 

> > looking for the magics that build up the filesystem. We're a
> 
> Yes.
> 
> > datarecovery company. We probably don't have any current
> > datarecoveries of people with Reiserfs on their disk. But if we had a
> > disk-image with a valid (or not) Reiserfs on it, would it link that
> > into our filesytem?
> 
> yes it will.
> So basically speaking you do not want to run rebuild-tree operation on the 
> FS that contains files with reiserfs metadata embedded in them in clear.
> This is also explained in our FAQ.

Oh, great. It provably corrupts our filesystem which is only fixed by
running a rebuilt-tree, but if we have certain data (which we actually
are likely to have!) then we simply can't. 

WOW it's documented. So it's not a bug. OK. Fine. 

> > Anyway, when I first started out with Reiserfs, it didn't support > 2G
> > files (or was it 4G?) I had to patch the kernel and (irreversably!) 
> > upgrade the on-disk format. 
 
> Yes. Linux by itself was not supporting 2G some time ago and people
> used patches an changed their on disk formats even for other
> filesystems out there.

> > We've noticed horrible slowdowns when the filesystem is > 90% full. It
> > turns out that when a block group is more than 90% full reiserfs will
> > prefer a different block group. i.e. it is ALWAYS switching block
> > groups when the whole disk is > 90% full. Something like that. When we
> > report something like that it's always: Ah, yes, that's an old bug
> > we've fixed it. Use patch.....
 
> In fact this is not exactly true, it only switches to other "block
> group" if you are creating new file. Why do you think this is a
> problem?  (of course I am speaking of 2.4.20+ kernels).

Well we were recovering data into 1G files, but performance of adding
a new block was horrible. It was doing this for every block. Either it
was doing a fruitless search on every block-add or it was actually
adding the block to another block group. Anyway, performance dropped
-=*A LOT*=- when this happened.

I think you're describing the way it should be, or "is now", but there
was a bug that caused it to behave differently.

	Roger. 


-- 
+-- Rogier Wolff -- www.harddisk-recovery.nl -- 0800 220 20 20 --
| Files foetsie, bestanden kwijt, alle data weg?!
| Blijf kalm en neem contact op met Harddisk-recovery.nl!
