From: Hans Reiser <reiser@namesys.com>
Subject: early flushing of data
Date: Mon, 12 Aug 2002 17:52:35 +0400
Message-ID: <3D57BDA3.2010903@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11166-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

I just thought that discussion of this might interest the list.

It is interesting to consider whether one should flush dirty nodes to 
disk with only a small delay after they are modified, or keep them in 
cache for a longer time.

A small delay has an advantage for the typical small benchmark, and for 
medium length tasks.  If there is poor utilization of the write cache, 
then the sooner one gets started on flushing something to disk, the 
 more megabytes the disk can write before the benchmark ends.

On the other hand, for a loaded server with a reasonably stable load 
with real users not benchmarks, the longer data stays in cache the more 
likely the write won't be needed at all.  One can argue that real users 
don't create stable loads.....

Your thoughts are welcome.

-- 
Hans


