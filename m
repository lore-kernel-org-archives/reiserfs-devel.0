From: Peter Nelson <pnelson@andrew.cmu.edu>
Subject: Re: Desktop Filesystem Benchmarks in 2.6.3
Date: Tue, 02 Mar 2004 11:34:15 -0500
Message-ID: <4044B787.7080301@andrew.cmu.edu>
References: <4044119D.6050502@andrew.cmu.edu> <4044366B.3000405@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17006-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4044366B.3000405@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Hans Reiser <reiser@namesys.com>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, ext2-devel@lists.sourceforge.net, ext3-users@redhat.com, jfs-discussion@oss.software.ibm.com, reiserfs-list@namesys.com, linux-xfs@oss.sgi.com

Hans Reiser wrote:

> Are you sure your benchmark is large enough to not fit into memory, 
> particularly the first stages of it?  It looks like not.  reiser4 is 
> much faster on tasks like untarring enough files to not fit into ram, 
> but (despite your words) your results seem to show us as slower unless 
> I misread them....

I'm pretty sure most of the benchmarking I am doing fits into ram, 
particularly because my system has 1GB of it, but I see this as 
realistic.  When I download a bunch of debs (or rpms or the kernel) I'm 
probably going to install them directly with them still in the file 
cache.  Same with rebuilding the kernel after working on it.

For untarring reiser4 is the fastest other than ext2.  A somewhat less 
ambiguous conclusion:

    * Reiser4 is exceptionally fast at copying the system and the
      fastest other than Ext2 at untaring, but is very slow at the
      real-world debootstrap and kernel compiles.

> Reiser4 performs best on benchmarks that use the disk drive, and we 
> usually only run benchmarks that use the disk drive.

I'm confused as to why performing a benchmark out of cache as opposed to 
on disk would hurt performance?

> Here is summary of the results based upon what I am calling "dead" 
> time calculated as `total time - user time`.
>
> You should be able to script out the user time.

I'm working with a friend of mine here at CMU doing hard drive research 
to create a execution trace and test that directly instead of performing 
all of the script actions.

-Peter Nelson
