From: Zhihui Zhang <bf20761@binghamton.edu>
Subject: Re: A question about slum and relocate
Date: Tue, 25 Nov 2003 12:41:35 -0500 (EST)
Message-ID: <Pine.GSO.4.58.0311251200010.29299@bingsun2.cc.binghamton.edu>
References: <Pine.GSO.4.58.0311241820230.6503@bingsun2.cc.binghamton.edu>
 <3FC201CA.9090700@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-16162-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3FC201CA.9090700@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: reiserfs-list@namesys.com, zam@thebsh.namesys.com


Thanks for your reply.  According to Alex, the decision to relocation is
done on a per-node basis.  My limited reading of the code shows that it is
based on whether a node can be located closer to its preceder in the tree
order.  I noticed that there is a max_dist hint to limit the region to
search, but it is not really used (i.e., passed from the flush code to the
bitmap code).  Therefore, the new location is not guaranteed to be closer
to its preceder.  This is not necessarily bad though, because Reiser4 can
have better write performance anyway by relocating a lot of nodes
together.  Please clarify this for me.

Overall, Reiser4 is a very complicated file system.  So many details and
ideas.  In my humble opinion, you guys are courageous in trying to re-do a
file system from a different approach - a less travelled route if I put it
right.

Thanks,

-Zhihui

On Mon, 24 Nov 2003, Hans Reiser wrote:

> Zhihui Zhang wrote:
>
> >Hi,
> >
> >After reading some code, it seems to me that a slum does not have to be
> >relocated.  If a slum is small , it will use the overwrite strategy.  Is
> >this understanding correct?  Also, at the leaf level, if the number of
> >dirty nodes exceeds FLUSH_RELOCATE_THRESHOLD (64), they are always
> >relocated.  Is there any similar threshold for an internal level?  Does
> >Reiser4 relocate internal nodes separately (i.e. not as part of the slum
> >involving leaf nodes.
> >
> zam will answer the above.
>
> >Note a slum can grow backwards if a dirty node is
> >the leftmost child of a parent at an internal level)?
> >
> Can you say more on this point, I don't quite understand you?
>
> > Thanks for your
> >enlightenment.
> >
> >-Zhihui
> >
> >
> >
> thanks for reading our code in such depth.
>
>

-- 
