From: Alex Zarochentsev <zam@namesys.com>
Subject: Re: A few questions of ReiserFS
Date: Thu, 6 Nov 2003 23:06:57 +0300
Message-ID: <20031106200657.GN11516@backtop.namesys.com>
References: <Pine.GSO.4.58.0311061302240.23244@bingsun2.cc.binghamton.edu>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15994-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <Pine.GSO.4.58.0311061302240.23244@bingsun2.cc.binghamton.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Zhihui Zhang <bf20761@binghamton.edu>
Cc: reiserfs-list@namesys.com

On Thu, Nov 06, 2003 at 01:25:11PM -0500, Zhihui Zhang wrote:
> Hi,
> 
> First, I would like to say I am impressed by ReiserFS. ReiserFS definitely
> handles a file system from a different perspective from other file systems.
> I would appreciate if you can clarify some internals of ReiserFS for me:

Reiser4.

> 
> (1) On disk space leakage.   The comment in wander.c says that the usage
>     information of wander blocks are not written to disk and a special
>     logging of the bitmaps is used to avoid space leakage.  How can you
>     achieve this?  Does it has anything to do with working and permanent
>     bitmap?

we do not count not permanent allocations in on-disk bitmap because otherwise
we have to roll that allocation back after transaction replaying after a system
crash.  It was simple because we have two bitmaps, "working" and "commit" (you
said "persistent").  When working bitmap protects blocks from being allocated
twice we can write to commit bitmap blocks only what we want to see there after
transaction replaying.  We decided not to write that "garbage" of not
persistent allocation to disk.  Probably the comment about space leakage in
wander.c:107 is not correct now, I will remove it soon.

The design of two bitmaps was invented for keeping transactions separate even
they alter one bitmap block.  For other blocks we have a rule that one block
belongs only to one transaction.


> (2) On dancing tree.   Is it true that the parent of a *dirty* node is
>     always relocated even if the child is not the most left child?  If

no. it tries not to break existing good allocation, only if current allocation
is not good, it makes parent node relocatable.  At least it was designed that 
way :)

>     the child is the leftmost one, does it mean we always relocate its
>     parent, grand-parent, and so on?  In addition, I guess that the znode
>     must be ordered in order to write them sequentially.  

if some nodes sequence (in tree order) was marked as "relocate", they get their
new block numbers one after one; only if some bits already busy in bitmap, the
sequencial order of block numbers gets broken.

> When you
>     allocate an ancestor, you must put it in the correct place in the list
>     of znode to be flushed, is this right?
> 
> Thanks for your enlightenment.
> 
> -Zhihui
> 
> -- 

-- 
Alex.
