From: Patrick O'Rourke <porourke@egenera.com>
Subject: rsync and memory leak on linux 2.2?
Date: 13 Feb 2003 12:11:44 -0500
Message-ID: <1045156304.11405.149.camel@barnes>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12741-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

We have two machines running Linux 2.2 with ReiserFS v3.5.32 and we're
seeing a memory leak which we feel is related to reiser and some interaction
with rsync.

The configuration is such that system A maintains a set of log files and
these files are mirrored via rsync on system B for redundancy.

What happens is that we put both systems under a fixed work load and after
many hours system B will start consuming lots of swap and suffer degraded
performance.  Through some kernel debugging we discovered that the 4K kmalloc
slab is slowly growing to the point where there is enough memory pressure to
start swapping.  We observe that one of the heaviest users of the 4K slab is
reiserfs_kmalloc(), and in particular, the calls issued from
get_mem_for_virtual_node() and reiserfs_file_write().  As an experiment we
ran the same work load, but this time disabled the rsync'ing of the log files
and we no longer see the growth in the 4k slab.

This leads us to believe that we have a memory leak somewhere in the reiserfs
and was wondering if anyone else has seen this, and if so, if a patch exists.

One question I have is that get_mem_for_virtual_node() will first attempt to
allocate memory atomically, and if this fails, will re-try non atomically.
In this case we return SCHEDULE_OCCURRED which results in fix_nodes()
will also return to its caller.  Is it possible for buffer allocated by
get_mem_for_virtual_node() to be lost in this case?  I did not see any
path out of reiserfs_file_write() in which we could return w/o freeing
the buffer.  Perhaps this problem is triggered via memory pressure?

I scanned the 2.2.20 reiser patch and did not see any fix that was apparent
to me.  Any suggestions / recommendations would be appreciated.

Thanks,

Pat

p.s. Please CC me on any reply, I am not subscribed to this list.

-- 
Patrick O'Rourke
porourke@egenera.com

