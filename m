From: Hans Reiser <reiser@namesys.com>
Subject: Re: Was able to reproduce "cp: cannot stat file.x: Input/output error"
Date: Tue, 10 Aug 2004 01:31:17 -0700
Message-ID: <411887D5.1000202@namesys.com>
References: <20040807065039.5BF4E15CBC@mail03.powweb.com>            <41148997.4070404@namesys.com> <200408100321.i7A3LHxu027087@turing-police.cc.vt.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20117-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200408100321.i7A3LHxu027087@turing-police.cc.vt.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Valdis.Kletnieks@vt.edu
Cc: David Dabbs <david@dabbs.net>, 'ReiserFS List' <reiserfs-list@namesys.com>

Valdis.Kletnieks@vt.edu wrote:

>On Sat, 07 Aug 2004 00:49:43 PDT, Hans Reiser said:
>
>  
>
>>>I think I have discovered the problem - unless there was a reason mongo was
>>>issuing mount/unmount commands at the start/end of a mongo 'run' as well as
>>>before/after _each phase_.
>>>      
>>>
>
>  
>
>>Probably someone wanted to separate the measurement of the phases.  It 
>>has been a while since I read mongo.....
>>    
>>
>
>Note that an unmount/mount pair will force a flush of all dirtied pages in the
>in-memory file cache, and *really* not return until it's really done and really
>out on disk.  In addition, sync() will force stuff to disk, but *not* invalidate
>in-cache pages - more drastic measures are needed if you want to benchmark
>with a cold cache (which is almost a must if you're doing actual filesystem
>benchmarking, as otherwise you're benching the in-core cache instead).
>
>  
>
Yes, but benchmarking the invalidation of the cache is a mistake to avoid.

>As an aside, although the Linux fs/buffer:do_sync() won't return until it's
>all really done, there is no mandate that the sync() syscall wait (and in fact,
>is the source of the old "type 'sync' three times, then 'halt'" - the second
>and third times you typed sync and hit return hopefully gave the I/O scheduled
>by the *first* sync time to complete.  At least one 'Unix for Dummies' book
>proved their lack of depth of understanding when they recommended:
>
># sync;sync;sync;halt
>
>;)
>
>  
>
Thanks for explaining

sync;sync;sync;halt

I always felt I was failing to grok something.

