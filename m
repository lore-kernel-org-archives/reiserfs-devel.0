From: Jamie Lokier <jamie@shareable.org>
Subject: Re: Filesystem Tests
Date: Sat, 9 Aug 2003 02:09:50 +0100
Message-ID: <20030809010950.GD26375@mail.jlokier.co.uk>
References: <20030805224152.528f2244.akpm@osdl.org> <Pine.LNX.4.30.0308061222360.8473-100000@divine.city.tvnet.hu>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15257-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.30.0308061222360.8473-100000@divine.city.tvnet.hu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Szakacsits Szabolcs <szaka@sienet.hu>
Cc: Andrew Morton <akpm@osdl.org>, Grant Miner <mine0057@mrs.umn.edu>, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

Szakacsits Szabolcs wrote:
> I run the results through some scripts to make it more readable.

I think that instead of giving the CPU percentage, you should give the
CPU time used:

	CPU time used = CPU percentage * total time

This would give a more accurate measure of how much CPU is used by the
different filesystems.  As someone said, if certain operations are
faster with reiser4, you expect a greater percentage of CPU time to be
spent in the disk driver etc. - if the amount of I/O is the same, that is.

Another interesting statistic would be the number of blocks read and
written during the test.

-- Jamie
