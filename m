From: Oleg Drokin <green@namesys.com>
Subject: Re: rsync and memory leak on linux 2.2?
Date: Thu, 13 Feb 2003 22:15:21 +0300
Message-ID: <20030213221521.A7329@namesys.com>
References: <1045156304.11405.149.camel@barnes>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12743-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1045156304.11405.149.camel@barnes>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Patrick O'Rourke <porourke@egenera.com>
Cc: reiserfs-list@namesys.com

Hello!

On Thu, Feb 13, 2003 at 12:11:44PM -0500, Patrick O'Rourke wrote:
> What happens is that we put both systems under a fixed work load and after
> many hours system B will start consuming lots of swap and suffer degraded
> performance.  Through some kernel debugging we discovered that the 4K kmalloc
> slab is slowly growing to the point where there is enough memory pressure to
> start swapping.  We observe that one of the heaviest users of the 4K slab is
> reiserfs_kmalloc(), and in particular, the calls issued from
> get_mem_for_virtual_node() and reiserfs_file_write().  As an experiment we
> ran the same work load, but this time disabled the rsync'ing of the log files
> and we no longer see the growth in the 4k slab.
> This leads us to believe that we have a memory leak somewhere in the reiserfs
> and was wondering if anyone else has seen this, and if so, if a patch exists.
> One question I have is that get_mem_for_virtual_node() will first attempt to
> allocate memory atomically, and if this fails, will re-try non atomically.
> In this case we return SCHEDULE_OCCURRED which results in fix_nodes()
> will also return to its caller.  Is it possible for buffer allocated by
> get_mem_for_virtual_node() to be lost in this case?  I did not see any
> path out of reiserfs_file_write() in which we could return w/o freeing
> the buffer.  Perhaps this problem is triggered via memory pressure?

Thanks for the report. I will investigate it tomorrow, when it is day again
in Russia.
Meanwile there is easy way to find if there is some memory leaked through
reiserfs_kmalloc. If you enable CONFIG_REISERFS_CHECK kernel option,
then there is code in reiserfs_kmalloc, that cheks if we alloc, but not free
the memory.
It will print a warning once in a while.
But please note that CONFIG_REISERFS_CHECK will impose some (substantial?)
slowdown to reiserfs operations, so you might just unconditionally
enable the check for memleak in there if you cannot afford the slowdown.

Bye,
    Oleg
