From: Szakacsits Szabolcs <szaka@sienet.hu>
Subject: Re: Filesystem Tests
Date: Sat, 9 Aug 2003 07:12:07 +0200 (MEST)
Message-ID: <Pine.LNX.4.30.0308090609370.19108-100000@divine.city.tvnet.hu>
References: <20030809010950.GD26375@mail.jlokier.co.uk>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15258-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030809010950.GD26375@mail.jlokier.co.uk>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jamie Lokier <jamie@shareable.org>
Cc: Andrew Morton <akpm@osdl.org>, Grant Miner <mine0057@mrs.umn.edu>, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com


On Sat, 9 Aug 2003, Jamie Lokier wrote:
> Szakacsits Szabolcs wrote:
> > I run the results through some scripts to make it more readable.
>
> I think that instead of giving the CPU percentage, you should give the
> CPU time used:
>
> 	CPU time used = CPU percentage * total time

In that case, the next time one could complain similarly, "instead of
giving the CPU time used, you should give the CPU percentage". Probably
that's the reason usually both is given, CPU time used in user and system
space as well.

> This would give a more accurate measure of how much CPU is used by the
> different filesystems.

The CPU percentages were given as integers in Grant's original numbers and
in same cases as 0. Doing mindless math with those would have given (even
more) bogus and misleading results.

> As someone said, if certain operations are faster with reiser4, you
> expect a greater percentage of CPU time to be spent in the disk driver
> etc. - if the amount of I/O is the same, that is.

I just can't believe reiser4 is so fast on an unloaded system (from the
numbers one could also expect it's the slowest on loaded systems and JFS
seems to be the winner on those). Disks have a speed/seek limits. To be
faster, one must ignore 'sync', do less IO (file/tail packing, compression,
etc) and/or optimise seek times.

> Another interesting statistic would be the number of blocks read and
> written during the test.

Yes, but I would collect those stats after these short term tests for an
additional X seconds to make sure no additional "optimization" is involved
(aka data is indeed on the disk).

	Szaka

