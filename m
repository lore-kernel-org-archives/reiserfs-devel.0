From: Hans Reiser <reiser@namesys.com>
Subject: Re: kernel go-slow
Date: Thu, 06 Feb 2003 21:58:00 +0300
Message-ID: <3E42B038.3050808@namesys.com>
References: <200302030027.40936.russell@coker.com.au> <20030206142649.A27228@t-raenon.nmd.msu.ru> <20030206193247.A29026@t-raenon.nmd.msu.ru> <200302061741.46153.russell@coker.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12666-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200302061741.46153.russell@coker.com.au>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Russell Coker <russell@coker.com.au>
Cc: flx@msu.ru, ReiserFS <reiserfs-list@namesys.com>

Russell Coker wrote:

>On Thu, 6 Feb 2003 17:32, Alexander Lyamin wrote:
>  
>
>>>>One problem that has started occuring is that periodically some of the
>>>>machines will go really slow for a while.  It's as if the CPU speed has
>>>>just dropped to 1% of it's regular speed.  Then after 10 minutes or so
>>>>it will continue as normal.
>>>>        
>>>>
>>>when its slows down, please check with vmstat for IO or with your
>>>      
>>>
>>i think i wasnt clear enough.
>>so - first , if you "go-slow" on a disk activity, chances are good
>>that it caused by FS or VM or their misunderstandings.
>>    
>>
>
>vmstat doesn't work properly.  CPU time is 99% system which suggests that one 
>CPU is spending all it's time in kernel space (for both threads of a 
>hyper-threaded CPU) or that both CPUs have each got one thread locked in 
>kernel space.
>
>  
>
I propose that you try reversing the datalogging patch for long enough 
to know whether it is our new code that is buggy.

If it is not our code, and it matters enough to justify the cost, we can 
remote login kernel analyze for you for an hourly fee.  Probably the fee 
you charge them is good enough for us too.;-)

-- 
Hans


