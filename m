From: rwhron@earthlink.net
Subject: Re: best reiserfs mount options for generic benchmarking
Date: Sat, 14 Sep 2002 12:47:55 -0400
Message-ID: <20020914164755.GA12387@rushmore>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11446-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: russell@coker.com.au
Cc: reiserfs-list@namesys.com

> Why?

Mainly for the reiserfs developers benefit.  Hans expressed some
interest in the numbers.  Also, if the tests take less time,
I can run more of them. :)

I've changed the partition reiserfs runs on.  That means comparison
with earlier runs is less valid.  Hans got me thinking the
benchmarks may be helpful for reiserfs developers, so I want
to cater to what is most useful for them.  

> the best thing to benchmark is the way you really use a system.

The mount options I typically use are noatime,notail,nodev,nosuid.

> If you have files that grow by small chunks but which are on average quite
> large then you will probably want to mount notails as it won't save any
> significant amount of space but can cost performance.  If you have any
> typical disk usage for home directories or maildir's then you'll want tails.

Thanks!

A "real world" workload I'm interested in is:
* 100k - 2mb files typically created by copy or parsed into existence.   
* Thousands of files in a directory, multiple big directories.
* files are typically accessed somewhat randomly and read in their entirety.
and
* I/O to large statically sized files (database reads/writes).

The benchmarks are meant to be a community contribution, rather 
than an evaluation of what's best for a workload I have.

-- 
Randy Hron
http://home.earthlink.net/~rwhron/kernel/bigbox.html

