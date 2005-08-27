From: Christian Iversen <chrivers@iversen-net.dk>
Subject: Re: reiser fs slow on mksf and mount
Date: Sat, 27 Aug 2005 23:45:09 +0200
Message-ID: <200508272345.09417.chrivers@iversen-net.dk>
References: <1125074717.5549.44.camel@localhost.localdomain> <1125080213.5549.100.camel@localhost.localdomain> <4310BF35.3060603@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25669-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4310BF35.3060603@suse.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Saturday 27 August 2005 21:29, Jeff Mahoney wrote:
> Ming Zhang wrote:
> > On Fri, 2005-08-26 at 21:32 +0400, Vladimir V. Saveliev wrote:
> >
> >
> > one more question about this bitmap blocks
> >
> > are this bitmap data is pinned into system thus will not be swapped out?
>
> Yes, any buffers/pages with active reference counts are kept in memory.
> Since the current reiserfs bitmap implementation keeps a reference until
> filesystem umount, the bitmaps are pinned.
>
> My dynamic bitmap patch fixes both of the problems you've posed so far.
> Mount time is reduced to O(1) time, since only the superblock and root
> node are read at mount time. On my system, it's something along the
> lines of 0.2s. Memory consumption is reduced also, because the bitmap
> block is released after the allocation/free that required it is complete.

I've been reading about this patch with quite some interest. Would you say 
it's stable enough for daily use? I have a terabyte array that takes forever 
to mount, and probably uses quite a bit of memory too.

Another thing is that it can easily take several seconds to do "ls -l" on a 
directory with a 0-10 GB data in it. Is that normal? There's usually less 
than 50 files of test data, ranging in size from 200MB to 900MB. I've 
disabled atime updates, but that didn't help much. The controller and disks 
are plenty fast, so I feel something is amiss. 

-- 
Regards,
Christian Iversen
