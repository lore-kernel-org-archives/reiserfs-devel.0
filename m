From: Brian Tinsley <btinsley@emageon.com>
Subject: Re: what do you do that stresses your filesystem?
Date: Sun, 05 Jan 2003 10:51:38 -0600
Message-ID: <3E18629A.60208@emageon.com>
References: <3E06F360.7000708@namesys.com> <3E0D364F.1010008@emageon.com> <3E17EA01.1080309@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12267-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Hans Reiser <reiser@namesys.com>
Cc: ReiserFS <reiserfs-list@namesys.com>

>
>
>>
>>  * SMP machines 
>
>
> already addressed by reiser4 (but not tested and benchmarked yet) 


I'm working on getting set up to do just this. I've got Mongo and both 
standard SCSI and fibre channel storage, but haven't had enough free 
time to cobble together a full 2.5.x system.

>>
>>  * Our applications perform multi-threaded streaming I/O 
>> (network-to-disk and vice versa) with read/write block sizes varying 
>> from 16KB to 64KB; we have files ranging in size from 32KB to 500MB+ 
>> (this top end will likely grow into several GB in the near future). 
>
>
> hopefully allocate on flush will optimize that well enough.  how many 
> threads? 

Given a "normal" system load, I would say 10 to 20 concurrent threads 
performing disk I/O would be a reasonable number.

>>
>>  * Our directory structure is very broad, but not very deep and files 
>> are stored in leaf nodes only. 
>
>
> hopefully reiserfs already does this one well. 

Definitely! This is one of the reasons I chose to use it :)

>>
>>  * Our database app performs lots of block-based random I/O and 
>> fsyncs within a dozen or so large files. 
>
>
> This we have not given a lot of attention to, and probably some 
> serious study of it is desirable.  I hope that we do reasonably well 
> at this, but I can't say that I know that we do.

Our database transaction times are consistently very good, but I've 
never performed any hardcore analysis either.



-- 

-[========================]-
-[      Brian Tinsley     ]-
-[ Chief Systems Engineer ]-
-[        Emageon         ]-
-[========================]-



