From: Alex Zarochentsev <zam@namesys.com>
Subject: Re: A few questions of ReiserFS
Date: Sat, 8 Nov 2003 12:12:19 +0300
Message-ID: <20031108091219.GR11516@backtop.namesys.com>
References: <Pine.GSO.4.58.0311061302240.23244@bingsun2.cc.binghamton.edu> <20031106200657.GN11516@backtop.namesys.com> <Pine.GSO.4.58.0311061712140.29193@bingsun2.cc.binghamton.edu> <20031107070411.GO11516@backtop.namesys.com> <Pine.GSO.4.58.0311071423410.10326@bingsun2.cc.binghamton.edu>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-16014-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <Pine.GSO.4.58.0311071423410.10326@bingsun2.cc.binghamton.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Zhihui Zhang <bf20761@binghamton.edu>
Cc: reiserfs-list@namesys.com

On Fri, Nov 07, 2003 at 03:14:12PM -0500, Zhihui Zhang wrote:
> 
> Thanks again.  I read more code and have a better understanding.
> 
> (1) On bitmap handling:  Due to the separation of working and commit
> bitmap, crash replay *only* needs to move wandered blocks to their real
> locations.  These wandered records can be found through journal footer,
> which is always written at a fixed location. But Reiser4 never allocates
> space for the wandered records and blocks in the commit bitmap.  Am I
> right?  This is a cool solution - minimize the work done by replay.

you right. 

but, IMHO, only replay optimisation is not enough to accept an overhead of
having two bitmaps.  
 
> (2) On dancing tree.  Let me guess:  Each squeeze can create more than one
> slum. the larger the slums, the better the performance.  

In our terminology squeeze is a part of slum processing, it is done together
with node (re)allocation in flush.c::squalloc() routine, "squalloc" is "squeeze
and allocate".

even modification of one file may create two slums because stat data item is
located far of file body (items).

> The nodes in
> slums are arranged in parent-first order, and hopefully will be allocated
> contiguous space on the disk.  Reiser4 favors relocation to overwrite.
> But it is possible that it will have to write nodes individually sometimes
> (fail to form a slum) and at least bitmap blocks are always overwritten.
> Each node in a slum could be written early somehow due to rapid flush or
> emergency write (what are these really?).  

rapid flush is not a key optimization, I think it is not compiled on now. 

emergency flush is a reuser4 feature for solving out of memory problems.
all that slum processing is too heavy to satisfy emerency memory needs.

there call path for jnode_flush() is the following:
balance_dirty_pages()/reiser4_sync_inodes()/flush_some_atom/flush_current_atom/jnode_flush() 

It is called number of dirty pages in the system grows over the limit,
and, hopefully, gives enough clean pages for memory allocations.  

But there are emergency cases when try_to_free_pages() scans invactive page
list and finds dirty page on it.  It calls fs specific (or address space
specific) writepage method.  We have to responce to it by submiting the page to
disk to satisfy memory allocation request.  That memory allocation may happen
under some reiser4 and vfs locks held it is why calling jnode_flush() will lead
to deadlock.

The emergency_flush() (reiser4 implementation of writepage() method) routine
works with individual pages rather than with slums, it is fast, it does not
take long-term locks, it can write locked node to disk.

rapid_flush() is a spacial mode for jnode_flush() to submit pages to disk more
frequently in a situation close to OOM.

> After all the nodes of an atom
> are written, the atom commits by writing wandered records and blocks.
 
> Now suppose one leaf node is dirty and it is the first child of its
> parent, which is in turn the first child of its parent and so on.  Does
> Reiser4 actually puts all these nodes into relocate set even if only one
> node is dirty initially?

Current alloc_one_ancestor() stops if parent is clean,
reverse_relocate_check_dirty_parent() is called only at next iteration.  I am
not sure that is right.  I think some clean-up should be done there.  


> I also notice that the default age of an atom is 600 seconds.  The delay
> time is only 30 seconds in traditional Unix file systems.  As a result,
> Reiser4 has a much larger window of vulnerability.  Is it true?

Ask Hans Reiser.  He set that constant.  However, you can set
tmgr.atom_max_age option at mount time.
 
-- 
Alex.
