From: Zhihui Zhang <bf20761@binghamton.edu>
Subject: Re: A few questions of ReiserFS
Date: Mon, 10 Nov 2003 17:31:09 -0500 (EST)
Message-ID: <Pine.GSO.4.58.0311101651570.24569@bingsun2.cc.binghamton.edu>
References: <Pine.GSO.4.58.0311061302240.23244@bingsun2.cc.binghamton.edu>
 <20031106200657.GN11516@backtop.namesys.com>
 <Pine.GSO.4.58.0311061712140.29193@bingsun2.cc.binghamton.edu>
 <20031107070411.GO11516@backtop.namesys.com>
 <Pine.GSO.4.58.0311071423410.10326@bingsun2.cc.binghamton.edu>
 <20031108091219.GR11516@backtop.namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-16045-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20031108091219.GR11516@backtop.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Zarochentsev <zam@namesys.com>
Cc: reiserfs-list@namesys.com

On Sat, 8 Nov 2003, Alex Zarochentsev wrote:

> emergency flush is a reuser4 feature for solving out of memory problems.
> all that slum processing is too heavy to satisfy emerency memory needs.
>
> there call path for jnode_flush() is the following:
> balance_dirty_pages()/reiser4_sync_inodes()/flush_some_atom/flush_current_atom/jnode_flush()
>
> It is called number of dirty pages in the system grows over the limit,
> and, hopefully, gives enough clean pages for memory allocations.
>
> But there are emergency cases when try_to_free_pages() scans invactive page
> list and finds dirty page on it.  It calls fs specific (or address space
> specific) writepage method.  We have to responce to it by submiting the page to
> disk to satisfy memory allocation request.  That memory allocation may happen
> under some reiser4 and vfs locks held it is why calling jnode_flush() will lead
> to deadlock.
>
> The emergency_flush() (reiser4 implementation of writepage() method) routine
> works with individual pages rather than with slums, it is fast, it does not
> take long-term locks, it can write locked node to disk.
                                     ===========

Thanks.  After reading more source code, I find out that a node can be
written to a temporary location whose address is saved in a hash table.
This I/O is done solely to relieve memory pressure - its parent does not
record the node's new location.  However, if a node selected for emergency
flush is a relocate one (JNODE_RELOC, see needs_allocation()), then it
will be written in-place individually.  This seems to me will violate
atomic guarantee -- all dirty data are committed at the same time (all or
nothing).  Did I misread some code here?

I also find out that the overwrite nodes are written back to their real
positions *immediately* after the corresponding atom commits.  I am
wondering that maybe by keeping the nodes longer without writing
immediately, we can save some I/O if the nodes are dirtied again.  But
this will require extra mechanism to track if the overwrite nodes have
been all written home yet.

I also try to figure out when Reiser4 locks and unlocks a node in general
but without much luck. In Reiser4, a short-term lock is a spin lock and a
long-term lock is what called lock elsewhere.  Am I right? Can you explain
a little bit about Reiser4 locking convention here? I know concurrent
search and updates of a tree is complicated.  So one example will suffice.
Thanks.

-Zhihui
