From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: fsck mode halfway between --fix-fixable and --rebuild-tree ?
Date: Mon, 30 Sep 2002 19:15:55 +0400
Message-ID: <200209301915.55137.vitaly@namesys.com>
References: <H356C4$4F46E50E852BF25DA1E850A48426FCDF@voila.fr> <20020930152204.A26742@namesys.com> <20020930150854.Z32363@noris.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-11578-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20020930150854.Z32363@noris.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Matthias Urlichs <smurf@noris.de>, Oleg Drokin <green@namesys.com>
Cc: reiserfs-list@namesys.com

On Monday 30 September 2002 17:08, Matthias Urlichs wrote:
> Hi,
>
> Oleg Drokin:
> > > When I tried this, reiserfsck with -S scanned the whole disk, as
> > > expected. Reiserfsck without -S said it would scan roughly half of my
> > > disk. That led
> >
> > Yes. It scans all the blocks that are marked as "used" in bitmap.
>
> That's not what I meant when I proposed this new option. The method
> which I proposed would walk the existing tree, both "downwards" and
> "sideways", to find all reachable blocks with nodes, and then do the
> existing rebuild-tree algorithm on the result.

There are more internal nodes in the tree than bitmap blocks. Internal 
nodes could be corrupted also. So we won't get the proper set of used 
blocks by walking the existing tree. And a wrong pointer may connect 
some of your old data back also. 

If corruptions could be fixed without rebuilding the tree, fix-fixable 
does it and it also extends the existing set of used blocks even if 
rebuild-tree will be required later by those blocks which were reachable. 
If rebuild-tree is required, bitmap will be used. 

> > > me to conclude that whatever it does, it doesn't just use the blocks
> > > which are actually used for the tree at the moment.
> >
> > How can it know? It must find all the lost blocks too.
>
> ... and how can it know that the bitmap represents reality?
>
> Blocks have three pointers which point to them (left neighbour, right
> neighbour, and parent).  (That's my understanding of the way people
> usually lay out their B-trees, anyway; apologies if yours is radically
> different.) I'd like to assume that blocks don't easily get lost when
> there are so many ways to find them. Three pointers look safer than a
> single bit, anyway.
>
> This method would be a nice compromise between not fixing a problem,
> depending on suspect information, and/or reconnecting every file which
> I've deleted during the last year.

-- 

Thanks,
Vitaly Fertman
