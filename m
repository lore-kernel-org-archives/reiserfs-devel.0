From: berthiaume_wayne@emc.com
Subject: RE: beta reiserfs data logging patches
Date: Wed, 29 May 2002 09:01:54 -0400
Message-ID: <93F527C91A6ED411AFE10050040665D0049BFAC7@corpusmx1.us.dg.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10429-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mason@suse.com
Cc: reiserfs-list@namesys.com

	I'll definitely run them through the benchmark. 

	BTW: I have finished the tests and am assembling the data. The
patches caused rather interesting results. ReiserFS now performs on the same
level as Ext3FS in 2.4.19-pre7 when write cache is not used. When using
barrier writes, performance outshined Ext3FS. I'll forward the data.

Wayne.

-----Original Message-----
From: Chris Mason [mailto:mason@suse.com]
Sent: Tuesday, May 28, 2002 4:44 PM
To: reiserfs-list@namesys.com
Cc: berthiaume_wayne@emc.com
Subject: beta reiserfs data logging patches


Hello everyone,

The very daring among you can try:

ftp.suse.com/pub/people/mason/patches/data-logging

To help me benchmark and test the new data logging code.  This is all
experimental, and should not be tried on production machines, or
anything other than a pure test box right now.

data logging helps for fsync and O_SYNC heavy applications, like mail
servers, and databases.  Without the patches, using O_SYNC writes with
iozone to make a 10MB file results in ~600K per second.  With the
patches, it goes up to around 900K/s and in data=journal mode it goes to
2300K/s.

In addition to the data logging code, there are a number of speedups for
tiny transactions.  Wayne, you are cc'd because I believe this code is
faster than the first data-logging patch, you might want to run through
the benchmarks again.

The rest of the message details the changes:

01_commit_super-8.diff -- my patch to make write_super not be used by
sync().  This has been floating around for a while and is unchanged.

02_beta-data-logging-3.diff

Adds the data=journal option, logging data blocks whenever it is one. 
This is an extension of the nesting patch used by the reiserfs quota
code.

Gets rid of the static array of struct reiserfs_journal_list.  The
structs are now allocated on demand and stored in a time ordered
per-super list.  The old code was O(N) on the size of the array in a
bunch of places, and made it very difficult to quickly find lists in
need of flushing.

The new lists allow me to quickly find transactions that haven't been
touched by kreiserfsd yet, which makes it easy to send more than one
transaction worth of metadata to disk at once.  For tiny transactions,
this makes a huge performance difference.

Since the lists are time ordered, it is also easier to figure out which
transactions the next transaction might overlap, and which ones are very
old, which cuts down on CPU time spent in do_journal_end.

-chris

