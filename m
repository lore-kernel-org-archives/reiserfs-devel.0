From: "Matthias Urlichs" <smurf@noris.de>
Subject: Re: fsck mode halfway between --fix-fixable and --rebuild-tree ?
Date: Mon, 30 Sep 2002 13:17:44 +0200
Message-ID: <20020930131744.X32363@noris.de>
References: <H356C4$4F46E50E852BF25DA1E850A48426FCDF@voila.fr> <20020929172335.L32363@noris.de> <20020930101824.A3895@namesys.com> <3D98318B.8000905@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11569-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3D98318B.8000905@namesys.com>; from reiser@namesys.com on Mon, Sep 30, 2002 at 03:12:11PM +0400
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: Oleg Drokin <green@namesys.com>, reiserfs-list@namesys.com

Hans Reiser:
> >
> >>The only way to fix this, at the moment, seems to be --rebuild-tree, which
> >>is overkill since it scans _everything_, and thus reconnected the stuff I
> >>deleted last week back into /lost+found.  It also takes too long.  :-/
> >
> >No, it does not behave like this. It may take long time though, anyway.
> >
> Let's be more clear.  You must use the -S option to get it to behave in 
> the way you do not want.  Don't use -S, and it does what you want it to do.
> 
When I tried this, reiserfsck with -S scanned the whole disk, as expected.

Reiserfsck without -S said it would scan roughly half of my disk. That led
me to conclude that whatever it does, it doesn't just use the blocks which
are actually used for the tree at the moment.

How does reiserfsck determine which blocks contain leaf nodes, anyway?

-- 
Matthias Urlichs     |     noris network AG     |     http://smurf.noris.de/
