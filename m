From: Pavel Machek <pavel@suse.cz>
Subject: Re: Desktop Filesystem Benchmarks in 2.6.3
Date: Fri, 5 Mar 2004 19:46:46 +0100
Message-ID: <20040305184643.GA4758@openzaurus.ucw.cz>
References: <4044119D.6050502@andrew.cmu.edu> <4044366B.3000405@namesys.com> <4044B787.7080301@andrew.cmu.edu> <20040303234104.GD1875@convergence.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-17106-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20040303234104.GD1875@convergence.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Johannes Stezenbach <js@convergence.de>, Peter Nelson <pnelson@andrew.cmu.edu>, Hans Reiser <reiser@namesys.com>, Jens Axboe <axboe@suse.de>, linux-kernel@vger.kernel.org, ext2-devel@lists.sourceforge.net, ext3-users@redhat.com, jfs-discussion@oss.software.ibm.com, reiserfs-list@namesys.com, linux-xfs@oss.sgi.com

Hi!

> It would be nice if someone with more profound knowledge could comment
> on this, but my understanding of the problem is:
> 
> - journaled filesystems can only work when they can enforce that
>   journal data is written to the platters at specifc times wrt
>   normal data writes
> - IDE write caching makes the disk "lie" to the kernel, i.e. it says
>   "I've written the data" when it was only put in the cache
> - now if a *power failure* keeps the disk from writing the cache
>   contents to the platter, the fs and journal are inconsistent
>   (a kernel crash would not cause this problem because the disk can
>   still write the cache contents to the platters)
> - at next mount time the fs will read the journal from the disk
>   and try to use it to bring the fs into a consistent state;
>   however, since the journal on disk is not guaranteed to be up to date
>   this can *fail*  (I have no idea what various fs implementations do
>   to handle this; I suspect they at least refuse to mount and require
>   you to manually run fsck. Or they don't notice and let you work
>   with a corrupt filesystem until they blow up.)
> 
> Right?  Or is this just paranoia?

Twice a year I fsck my reiser drives, and yes there's some corruption there.
So you are right, and its not paranoia.

-- 
64 bytes from 195.113.31.123: icmp_seq=28 ttl=51 time=448769.1 ms         

