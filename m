From: Alex Zarochentsev <zam@namesys.com>
Subject: Re: A few questions of ReiserFS
Date: Tue, 11 Nov 2003 16:22:22 +0300
Message-ID: <20031111132222.GB1323@backtop.namesys.com>
References: <Pine.GSO.4.58.0311061302240.23244@bingsun2.cc.binghamton.edu> <20031106200657.GN11516@backtop.namesys.com> <Pine.GSO.4.58.0311061712140.29193@bingsun2.cc.binghamton.edu> <20031107070411.GO11516@backtop.namesys.com> <Pine.GSO.4.58.0311071423410.10326@bingsun2.cc.binghamton.edu> <20031108091219.GR11516@backtop.namesys.com> <Pine.GSO.4.58.0311101651570.24569@bingsun2.cc.binghamton.edu>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-16048-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <Pine.GSO.4.58.0311101651570.24569@bingsun2.cc.binghamton.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Zhihui Zhang <bf20761@binghamton.edu>
Cc: reiserfs-list@namesys.com

On Mon, Nov 10, 2003 at 05:31:09PM -0500, Zhihui Zhang wrote:
> On Sat, 8 Nov 2003, Alex Zarochentsev wrote:
> 
> > emergency flush is a reuser4 feature for solving out of memory problems.
> > all that slum processing is too heavy to satisfy emerency memory needs.
> >
> > there call path for jnode_flush() is the following:
> > balance_dirty_pages()/reiser4_sync_inodes()/flush_some_atom/flush_current_atom/jnode_flush()
> >
> > It is called number of dirty pages in the system grows over the limit, and,
> > hopefully, gives enough clean pages for memory allocations.
> >
> > But there are emergency cases when try_to_free_pages() scans invactive page
> > list and finds dirty page on it.  It calls fs specific (or address space
> > specific) writepage method.  We have to responce to it by submiting the
> > page to disk to satisfy memory allocation request.  That memory allocation
> > may happen under some reiser4 and vfs locks held it is why calling
> > jnode_flush() will lead to deadlock.
> >
> > The emergency_flush() (reiser4 implementation of writepage() method)
> > routine works with individual pages rather than with slums, it is fast, it
> > does not take long-term locks, it can write locked node to disk.
> 				     ===========
> 
> Thanks.  After reading more source code, I find out that a node can be
> written to a temporary location whose address is saved in a hash table.  This
> I/O is done solely to relieve memory pressure - its parent does not record
> the node's new location.  However, if a node selected for emergency flush is
> a relocate one (JNODE_RELOC, see needs_allocation()), then it will be written
> in-place individually.  
>
> This seems to me will violate atomic guarantee -- all
> dirty data are committed at the same time (all or nothing).  Did I misread
> some code here?

we assume that n (n > 1) nodes cannot be written at same time, however, it 
does not break fs journalling.

commit (and post-commit writes) in reiser4 is done in three stages:  

1) all dirty nodes (of one atom) are written to new locations, it has no matter
what time takes this process. no one write operation touches previously
committed data, it guarantees that fs will be consistent after a system crash.
in reiser4, some transaction service data (log records) are written to disk
also.

2) after all writes specified in #1 completed, reiser4 updates journal header
block with makes just written transaction recovery possible.  it is only a disk
write which requires atomicity.  I think it is so while valuable part of
journal header block is less than one disk sector (512 bytes). 

3) "overwrite" nodes should be written again to thir real locations.  then
journal footer is updated, wandered blocks and log records are freed. 

You can check that if system crash happens at any stage , after reboot 
we get all or nothing from a transaction:

a) old consistent fs data 
b) or inconsistent data but we can recover committed transaction
c) or new consistent data because transaction was completed including
post-commit writes (stage #3),

> I also find out that the overwrite nodes are written back to their real
> positions *immediately* after the corresponding atom commits.  I am wondering
> that maybe by keeping the nodes longer without writing immediately, we can
> save some I/O if the nodes are dirtied again.  But this will require extra
> mechanism to track if the overwrite nodes have been all written home yet.

It is a missing feature, it will be implemented after reiser4 gets stability.

> 
> I also try to figure out when Reiser4 locks and unlocks a node in general but
> without much luck. In Reiser4, a short-term lock is a spin lock and a
> long-term lock is what called lock elsewhere.  Am I right? 

yes.

> Can you explain a little bit about Reiser4 locking convention here?  I know
> concurrent search and updates of a tree is complicated.  

Formatted node content modification requires "write" (long-term) lock,  reading
its content requires "read" (long-term) lock.  block number assigment is
protected by node long-term lock. 

Unformatted nodes have no individual lock objects. they are protected by a
long-term nock on the twig node.  It should be so, but in some cases inode
semaphores and reiser4 per-inode locks are used instead of per-node locking
locking. 

> So one example will
> suffice.  

coord_by_key() is a simple example.  It operates on two nodes: "parent" and
"child". Lock (long-term) on the parent node is used to perform key search
within seach and it is kept while locking the child we have found that key is i
the parent node.  There we find node pointer to the next level down of target
item.  If we find a node pointer, we keep parent lock until child node is
successflully locked.  Then repeat taking this child node as a new "parent"
one.

Coord_by_key() begins with taking read lock (long-term) on "uber" node which
protects the tree root location.

So, coord_by_key() takes more than one lock a time.  Other tree operations like
insert or delete also may take more than one locks.  To prevent deadlocks we
use priorities, coord_by_key() have low priority and tree modifications have
hight priority.  Indeed the schema of assigning priorities a bit more
comlecated.  There is a head comment in fs/reiser4/lock.c which describes
locking in more detail. 

> Thanks.
> 
> -Zhihui
> 

-- 
Alex.
