From: Alex Zarochentsev <zam@namesys.com>
Subject: Re: A question about slum and relocate
Date: Wed, 26 Nov 2003 01:56:10 +0300
Message-ID: <20031125225609.GD2144@backtop.namesys.com>
References: <Pine.GSO.4.58.0311241820230.6503@bingsun2.cc.binghamton.edu> <3FC201CA.9090700@namesys.com> <Pine.GSO.4.58.0311251200010.29299@bingsun2.cc.binghamton.edu>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-16164-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <Pine.GSO.4.58.0311251200010.29299@bingsun2.cc.binghamton.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Zhihui Zhang <bf20761@binghamton.edu>
Cc: reiserfs-list@namesys.com

On Tue, Nov 25, 2003 at 12:41:35PM -0500, Zhihui Zhang wrote:
> 
> Thanks for your reply.  According to Alex, the decision to relocation is
> done on a per-node basis.  My limited reading of the code shows that it is
> based on whether a node can be located closer to its preceder in the tree
> order.  I noticed that there is a max_dist hint to limit the region to
> search, but it is not really used (i.e., passed from the flush code to the
> bitmap code). 

There is an attempt to relocate within given region, if it fails reiser4 may
keep original _good_ node location or relocate it to the first free location
after the preceder.

> Therefore, the new location is not guaranteed to be closer
> to its preceder.  This is not necessarily bad though, because Reiser4 can
> have better write performance anyway by relocating a lot of nodes
> together.  

Yes.  I have a feeling that relocating a slum as a whole thing would be better.
But reiser4 write performace is very good for now.  Read speed is acceptable.

However in complex multithread tests the fs fragmentation grows, that means the
flush code does not do its work well (or it is not possible there).  For curing
that we have reiser4 repacker which walks the tree in both directions, dirties
many nodes and creates good conditions for the flush code to do optimal node
allocation.

> Please clarify this for me.
> 
> Overall, Reiser4 is a very complicated file system.  So many details and
> ideas.  

They continue to appear in Hans' mind :-)

> In my humble opinion, you guys are courageous in trying to re-do a
> file system from a different approach - a less travelled route if I put it
> right.
> 
> Thanks,
> 
> -Zhihui

Thanks,

-- 
Alex.
