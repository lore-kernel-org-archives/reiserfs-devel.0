From: Hans Reiser <reiser@namesys.com>
Subject: Re: r4 v. ext3, quick speed vs. cpu experiments
Date: Wed, 06 Aug 2003 03:46:28 +0400
Message-ID: <3F3041D4.9050709@namesys.com>
References: <Pine.LNX.4.30.0308052251530.6739-100000@divine.city.tvnet.hu> <3F303DA4.306@mrs.umn.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15167-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3F303DA4.306@mrs.umn.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Grant Miner <mine0057@mrs.umn.edu>
Cc: reiserfs-list@namesys.com

Grant Miner wrote:

> Szakacsits Szabolcs wrote:
>
>> How much memory you have? How big is mozilla-1.5a.tar? Did you include
>> 'sync' in the tests? It seems reiser4 numbers are mostly in-memory
>> operations and not all data flushed to disk while this is apparently not
>> true for ext3. BTW, XFS numbers would be also/more interesting, 
>> ext[23] is
>> pretty outdated.
>>
>> BTW, from your numbers it seems ext3 gives better overall performance.
>>
>>     Szaka
>>
> Good suggestion.  With ext3, 'sync' adds 10.2 seconds average to total
> time (others about 1.6 sec).  Here is a list of averages, including sync
> time.  Each fs was run 3 times.  Note that I did not count sync's cpu %
> in cpu %.
>
> xfs: average 44.3 seconds, 32% cpu
> ext3: average 44.0 seconds, 27% cpu
> r4: average 30.2 seconds, 39% cpu
>
> I have 512MB memory.  File tree is about 295 MB.  This was just a "for
> fun" test, and it probably not accurate.  I may try better ones later.
>
>
>
>
Expect the CPU time to drop a lot, because we first got rid of the IO 
consuming kruft, now we are getting rid of the CPU consuming kruft.

That is, expect it to drop up until we ship a compression plugin.....

Can you post your numbers on lkml also?

-- 
Hans


