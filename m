From: Chris Mason <mason@suse.com>
Subject: Re: Desktop Filesystem Benchmarks in 2.6.3
Date: Fri, 05 Mar 2004 19:16:22 -0500
Sender: ext3-users-admin@redhat.com
Message-ID: <1078532181.25062.144.camel@watt.suse.com>
References: <4044119D.6050502@andrew.cmu.edu> <4044366B.3000405@namesys.com>
	 <4044B787.7080301@andrew.cmu.edu>  <20040303234104.GD1875@convergence.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <ext3-users-admin@redhat.com>
In-Reply-To: <20040303234104.GD1875@convergence.de>
Errors-To: ext3-users-admin@redhat.com
List-Help: <mailto:ext3-users-request@redhat.com?subject=help>
List-Post: <mailto:ext3-users@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/ext3-users>,
	<mailto:ext3-users-request@redhat.com?subject=subscribe>
List-Id: <reiserfs-devel.vger.kernel.org>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/ext3-users>,
	<mailto:ext3-users-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/ext3-users/>
Content-Type: text/plain; charset="us-ascii"
To: Johannes Stezenbach <js@convergence.de>
Cc: Peter Nelson <pnelson@andrew.cmu.edu>, Hans Reiser <reiser@namesys.com>, Jens Axboe <axboe@suse.de>, linux-kernel@vger.kernel.org, ext2-devel@lists.sourceforge.net, ext3-users@redhat.com, jfs-discussion@www-124.southbury.usf.ibm.com, reiserfs-list@namesys.com, linux-xfs@oss.sgi.com

On Wed, 2004-03-03 at 18:41, Johannes Stezenbach wrote:
> Peter Nelson wrote:
> > Hans Reiser wrote:
> > 
> > >Are you sure your benchmark is large enough to not fit into memory, 
> > >particularly the first stages of it?  It looks like not.  reiser4 is 
> > >much faster on tasks like untarring enough files to not fit into ram, 
> > >but (despite your words) your results seem to show us as slower unless 
> > >I misread them....
> > 
> > I'm pretty sure most of the benchmarking I am doing fits into ram, 
> > particularly because my system has 1GB of it, but I see this as 
> > realistic.  When I download a bunch of debs (or rpms or the kernel) I'm 
> > probably going to install them directly with them still in the file 
> > cache.  Same with rebuilding the kernel after working on it.
> 
> OK, that test is not very interesting for the FS gurus because it
> doesn't stress the disk enough.
> 
> Anyway, I have some related questions concerning disk/fs performance:
> 
> o I see you are using and IDE disk with a large (8MB) write cache.
> 
>   My understanding is that enabling write cache is a risky
>   thing for journaled file systems, so for a fair comparison you
>   would have to enable the write cache for ext2 and disable it
>   for all journaled file systems.
> 
> It would be nice if someone with more profound knowledge could comment
> on this, but my understanding of the problem is:
> 
Jens just sent me an updated version of his IDE barrier code, and I'm
adding support for reiserfs and ext3 to it this weekend.  It's fairly
trivial to add support for each FS, I just don't know the critical
sections of the others as well.

The SUSE 2.4 kernels have had various forms of the patch, it took us a
while to get things right.  It does impact performance slightly, since
we are forcing cache flushes that otherwise would not have been done.

The common workloads don't slow down with the patch, fsync heavy
workloads typically lose around 10%.

-chris
