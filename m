From: Hans Reiser <reiser@namesys.com>
Subject: Re: what do you do that stresses your filesystem?
Date: Sun, 05 Jan 2003 11:17:05 +0300
Message-ID: <3E17EA01.1080309@namesys.com>
References: <3E06F360.7000708@namesys.com> <3E0D364F.1010008@emageon.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12264-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3E0D364F.1010008@emageon.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Brian Tinsley <btinsley@emageon.com>
Cc: ReiserFS <reiserfs-list@namesys.com>

Brian Tinsley wrote:

> I'm late replying to this one, but I've been on vacation :)
>
> Any possible optimizations for the following would be beneficial:
>  * interaction with the Linux NFS server 

Yes, agreed, especially 0 copy stuff.

>
>  * SMP machines 

already addressed by reiser4 (but not tested and benchmarked yet)

>
>  * apps like grep, awk, and sed 

reasonable.

>
>
> Any optimizations for the following application characteristics would 
> be beneficial:
>
>  * Our applications perform multi-threaded streaming I/O 
> (network-to-disk and vice versa) with read/write block sizes varying 
> from 16KB to 64KB; we have files ranging in size from 32KB to 500MB+ 
> (this top end will likely grow into several GB in the near future). 

hopefully allocate on flush will optimize that well enough.  how many 
threads?

>
>  * Our directory structure is very broad, but not very deep and files 
> are stored in leaf nodes only. 

hopefully reiserfs already does this one well.

>
>  * When a file is created and completely written to disk, it is often 
> re-read in its entirety at least two times within a couple of minutes. 

Hopefully current lru algorithms handle this.

>
>  * Our database app performs lots of block-based random I/O and fsyncs 
> within a dozen or so large files. 

This we have not given a lot of attention to, and probably some serious 
study of it is desirable.  I hope that we do reasonably well at this, 
but I can't say that I know that we do.

Thanks Brian, this was a good list.

>
>
>
>
> Hans Reiser wrote:
>
>> We were discussing how to optimize reiser4 best, and came to realize 
>> that us developers did not have a good enough intuition for what 
>> users do that stresses their filesystem enough that they care about 
>> its performance.
>>
>> If you just do edits of files it probably does not matter too much 
>> what fs you use.
>>
>> Booting the machine seems like one activity that many users end up 
>> waiting on the FS for.  Yes?
>>
>> Starting up complex and big applications like xemacs and mozilla 
>> would be another.  Yes?
>>
>> Others?
>>
>> Hans
>>
>> PS
>>
>> reiser4 performance is up a lot recently, and within two weeks I 
>> think cp -r will have been optimized as much as is worth doing.  cp 
>> -r accesses files in readdir order, and that does indeed seem worth 
>> optimizing, but soon we will need to optimize more sophisticated 
>> access patterns than that.....
>>
>> Hans
>
>
>


-- 
Hans


