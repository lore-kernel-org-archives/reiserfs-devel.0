From: David Weinehall <tao@acc.umu.se>
Subject: Re: Desktop Filesystem Benchmarks in 2.6.3
Date: Tue, 2 Mar 2004 23:47:58 +0100
Message-ID: <20040302224758.GK19111@khan.acc.umu.se>
References: <4044119D.6050502@andrew.cmu.edu> <4044366B.3000405@namesys.com> <4044B787.7080301@andrew.cmu.edu> <1078266793.8582.24.camel@mentor.gurulabs.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-17019-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1078266793.8582.24.camel@mentor.gurulabs.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dax Kelson <dax@gurulabs.com>
Cc: Peter Nelson <pnelson@andrew.cmu.edu>, Hans Reiser <reiser@namesys.com>, linux-kernel <linux-kernel@vger.kernel.org>, ext2-devel@lists.sourceforge.net, ext3-users@redhat.com, jfs-discussion@oss.software.ibm.com, reiserfs-list@namesys.com, linux-xfs@oss.sgi.com

On Tue, Mar 02, 2004 at 03:33:13PM -0700, Dax Kelson wrote:
> On Tue, 2004-03-02 at 09:34, Peter Nelson wrote:
> > Hans Reiser wrote:
> > 
> > I'm confused as to why performing a benchmark out of cache as opposed to 
> > on disk would hurt performance?
> 
> My understanding (which could be completely wrong) is that reieserfs v3
> and v4 are algorithmically more complex than ext2 or ext3. Reiserfs
> spends more CPU time to make the eventual ondisk operations more
> efficient/faster.
> 
> When operating purely or mostly out of ram, the higher CPU utilization
> of reiserfs hurts performance compared to ext2 and ext3.
> 
> When your system I/O utilization exceeds cache size and your disks
> starting getting busy, the CPU time previously invested by reiserfs pays
> big dividends and provides large performance gains versus more
> simplistic filesystems.  
> 
> In other words, the CPU penalty paid by reiserfs v3/v4 is more than made
> up for by the resultant more efficient disk operations. Reiserfs trades 
> CPU for disk performance.
> 
> In a nutshell, if you have more memory than you know what do to with,
> stick with ext3. If you spend all your time waiting for disk operations
> to complete, go with reiserfs.

Or rather, if you have more memory than you know what to do with, use
ext3.  If you have more CPU power than you know what to do with, use
ReiserFS[34].

On slower machines, I generally prefer a little slower I/O rather than
having the entire system sluggish because of higher CPU-usage.


Regards: David Weinehall
-- 
 /) David Weinehall <tao@acc.umu.se> /) Northern lights wander      (\
//  Maintainer of the v2.0 kernel   //  Dance across the winter sky //
\)  http://www.acc.umu.se/~tao/    (/   Full colour fire           (/
