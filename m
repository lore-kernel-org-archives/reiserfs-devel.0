From: Hans Reiser <reiser@namesys.com>
Subject: Re: what do you do that stresses your filesystem?
Date: Mon, 06 Jan 2003 10:10:46 +0300
Message-ID: <3E192BF6.8090902@namesys.com>
References: <3E06F360.7000708@namesys.com> <3E0D364F.1010008@emageon.com> <3E17EA01.1080309@namesys.com> <3E18629A.60208@emageon.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12271-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3E18629A.60208@emageon.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Brian Tinsley <btinsley@emageon.com>
Cc: ReiserFS <reiserfs-list@namesys.com>

Brian Tinsley wrote:

>>
>>
>>>
>>>  * SMP machines 
>>
>>
>>
>> already addressed by reiser4 (but not tested and benchmarked yet) 
>
>
>
> I'm working on getting set up to do just this. I've got Mongo and both 
> standard SCSI and fibre channel storage, but haven't had enough free 
> time to cobble together a full 2.5.x system. 

Ok, but be aware that reiser4 is several weeks away from being ready for 
prime time.  Our performance needs more tweaks, and bugs remain.

>
>
>>>
>>>  * Our applications perform multi-threaded streaming I/O 
>>> (network-to-disk and vice versa) with read/write block sizes varying 
>>> from 16KB to 64KB; we have files ranging in size from 32KB to 500MB+ 
>>> (this top end will likely grow into several GB in the near future). 
>>
>>
>>
>> hopefully allocate on flush will optimize that well enough.  how many 
>> threads? 
>
>
> Given a "normal" system load, I would say 10 to 20 concurrent threads 
> performing disk I/O would be a reasonable number. 

Divide the amount of ram flushed by the number of threads, and you'll 
get the size of each threads batch that gets optimized all together at 
flush time.  Probably you could benefit from some special purpose 
tweaking of the FS (to monitor and adjust the size of the batches), but 
hopefully it does not perform too bad as it is.


-- 
Hans


