From: Alex Zarochentsev <zam@namesys.com>
Subject: Re: A few questions of ReiserFS
Date: Fri, 7 Nov 2003 10:04:11 +0300
Message-ID: <20031107070411.GO11516@backtop.namesys.com>
References: <Pine.GSO.4.58.0311061302240.23244@bingsun2.cc.binghamton.edu> <20031106200657.GN11516@backtop.namesys.com> <Pine.GSO.4.58.0311061712140.29193@bingsun2.cc.binghamton.edu>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-16004-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <Pine.GSO.4.58.0311061712140.29193@bingsun2.cc.binghamton.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Zhihui Zhang <bf20761@binghamton.edu>
Cc: reiserfs-list@namesys.com

On Thu, Nov 06, 2003 at 06:00:42PM -0500, Zhihui Zhang wrote:
> Thanks for your reply, but I am still confused.
> 
> (1) On bitmap handling.  I just noticed that Reiser4 does not start an
> atom write until the previous one is fully committed.  

It does. Atom relocate set is written before atom enters commit stage.  There
is no limit (currently) how many atoms are written in parallel (their relocate
sets).  Commits (and post-commits writes) are serialized by the commit
semaphore.  Usually most of dirty blocks are sorted to relocate set. This has a
benefit of not writing most blocks twice and makes commit faster.

The limit of parallel flushers (or only writers) can be implemented for
performance reasons, it is better to write in one stream to avoid disk head
seeks.

> In other words,
> there will never be more than one atom being written at the same time.

Atoms are procecced by the reiser4 flush in parallel.  There could be more than
one thread which do node squeezing/allocation/writing-of-relocate-set (all it
is the reiser4 flush) even for one atom.

> This should help avoiding premature re-use of space freed by an earlier
> atom. So the commit bitmap is simply the bitmap copy to be written.

Yes, commit bitmap is what we write to disk.  It differs from working bitmap
because it does not contain temporary allocations (wander blocks, log records)
and blocks allocations from open atoms.  That information is hard to calculate
from working bitmap on the fly, it is why commit bitmap is maintained
separately from working one.

> right? If so, is your scheme somehow different/similar to the those used
> in ext3 and IBM JFS.  They also use two bitmaps: one working, one
> permanent.

I repeat that our goal was to not fuse atoms if they alter one bitmap block.
Is it so in JFS? 
 
> (2) On dancing tree.  If the number of nodes is less than 64 (the
> threshold), you make them wander.  Otherwise, you make them relocate. 

It is not so simple. Already allocated dirty node can be relocated if its new
location found in some neighborhood of current optimal position
(flush_pos->preceder.blk). Also, if best position is unknown, the flush code
decides to relocate node.

But, I accept that simple overwrite/relocate policy could be better than
current complex one.  It is tunable part of reiser4.  You can experiment how
changing the policy affects fs performance.

> In the case of relocate, how do you determine if you want to relocate their
> parents as well? I do not understand why the relocation decision of a node
> has anything to do with its being the first child of a parent.

That way we extend slum by one node in the backward direction (in tree order)
and attempt to make relocate set larger or, better to say, overwite set
smaller.  If next parent is dirty (upper levels are modified more frequently)
we may have minimal overwite set and may write all blocks beginning with the
first parent in one write operation. 

> It seems to me that the code tries to write out node in parent-first
> order, not one level at a time.  

yes

> Of course, the write happens after all the squeeze at all levels have been
> done.

No. The flush processes slums and writes nodes even before finishing slum
processing.  There was a variant which wrote all nodes after finishing slum,
but it had problems with overloading of i/o requests queue.

> 
> Thanks,
> 
> -Zhihui

-- 
Alex.
