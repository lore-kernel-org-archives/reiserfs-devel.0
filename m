From: Hans Reiser <reiser@namesys.com>
Subject: Re: Filesystem Tests
Date: Wed, 06 Aug 2003 18:06:37 +0400
Message-ID: <3F310B6D.6010608@namesys.com>
References: <3F306858.1040202@mrs.umn.edu> <20030805224152.528f2244.akpm@osdl.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15174-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030805224152.528f2244.akpm@osdl.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Andrew Morton <akpm@osdl.org>
Cc: Grant Miner <mine0057@mrs.umn.edu>, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

Andrew Morton wrote:

>But different filesystems will leave different amounts of dirty, unwritten
>data in memory at the end of the test.  On your machine, up to 200MB of
>dirty data could be sitting there in memory at the end of the timing
>interval.  You need to decide how to account for that unwritten data in the
>measurement.  Simply ignoring it as you have done is certainly valid, but
>is only realistic in a couple of scenarios:
>
unless I misunderstand something, he is running sync and not ignoring that.

I don't think ext2 is a serious option for servers of the sort that 
Linux specializes in, which is probably why he didn't measure it.

reiser4 cpu consumption is still dropping rapidly as others and I find 
kruft in the code and remove it.  Major kruft remains still.


-- 
Hans


