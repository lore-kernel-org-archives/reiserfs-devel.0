From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: fsck mode halfway between --fix-fixable and --rebuild-tree ?
Date: Mon, 30 Sep 2002 15:43:44 +0400
Message-ID: <200209301543.44974.vitaly@namesys.com>
References: <H356C4$4F46E50E852BF25DA1E850A48426FCDF@voila.fr> <3D98318B.8000905@namesys.com> <20020930131744.X32363@noris.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-11572-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20020930131744.X32363@noris.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Matthias Urlichs <smurf@noris.de>, Hans Reiser <reiser@namesys.com>
Cc: Oleg Drokin <green@namesys.com>, reiserfs-list@namesys.com

On Monday 30 September 2002 15:17, Matthias Urlichs wrote:
> Hans Reiser:
> > >>The only way to fix this, at the moment, seems to be --rebuild-tree,
> > >> which is overkill since it scans _everything_, and thus reconnected
> > >> the stuff I deleted last week back into /lost+found.  It also takes
> > >> too long.  :-/
> > >
> > >No, it does not behave like this. It may take long time though, anyway.
> >
> > Let's be more clear.  You must use the -S option to get it to behave in
> > the way you do not want.  Don't use -S, and it does what you want it to
> > do.
>
> When I tried this, reiserfsck with -S scanned the whole disk, as expected.
>
> Reiserfsck without -S said it would scan roughly half of my disk. That led
> me to conclude that whatever it does, it doesn't just use the blocks which
> are actually used for the tree at the moment.

It loading the bitmap from the disk and sais how many blocks will be scanned.
Regarding -S option, the man page sais:

--scan-whole-partition, -S
This option causes --rebuild-tree to scan the whole partition, not only
used space on the partition.

So, without -S option only used space is scanned, with -S option all blocks are.

> How does reiserfsck determine which blocks contain leaf nodes, anyway?

By analizing the content on pass0. If a block looks like a leaf (probably 
slightly corrupted) it will be inserted into a new tree on pass1 (or only 
not corrupted or recovered items from it on pass2 in the case of corruption). 
If it does not look like a leaf or there is no way to recover data from it, 
the block is skipped on pass0.

-- 

Thanks,
Vitaly Fertman
