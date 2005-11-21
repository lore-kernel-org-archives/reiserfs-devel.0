From: "E.Gryaznova" <grev@namesys.com>
Subject: Re: More Slowdown or reiser4 update for 2.6.14-mm2
Date: Mon, 21 Nov 2005 21:06:37 +0300
Message-ID: <43820CAD.3090605@namesys.com>
References: <200511171447.41362.mail@earthworm.de> <437CBC63.3050202@namesys.com> <200511172040.39955.mail@earthworm.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27047-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200511172040.39955.mail@earthworm.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Hesse, Christian" <mail@earthworm.de>
Cc: "Vladimir V. Saveliev" <vs@namesys.com>, reiserfs-list@namesys.com

Hello.

Hesse, Christian wrote:

>On Thursday 17 November 2005 18:22, Vladimir V. Saveliev wrote:
>  
>
>>Hello
>>
>>Hesse, Christian wrote:
>>    
>>
>>>Vladimir V. Saveliev wrote:
>>>      
>>>
>>>>Please try whether the attached patch improves anything. It simplifies
>>>>fsync by avoid commiting of transactions which do not modify file being
>>>>fsync-ed.
>>>>
>>>>The patch applied to 2.6.14-mm2 with warnings, but that can be ignored.
>>>>        
>>>>
>>>Hi everybody,
>>>
>>>I'm suffering the same problem, sync and fsync are horribly slow. I've
>>>written a small test program:
>>>
>>>http://www.earthworm.de/tmp/reiser4-fsync.c
>>>
>>>with 2.6.13:
>>>sync()                                  = 0 <0.000198>
>>>fsync(3)                                = 0 <0.003353>
>>>
>>>with 2.6.14 (with and without patch):
>>>sync()                                  = 0 <2.092873>
>>>fsync(3)                                = 0 <0.132579>
>>>      
>>>
>>I tried your test on a box with reiser4 root fs:
>>2.6.13:
>>strace -T -e sync,fsync ./eworm xx
>>fsync(3)                                = 0 <0.158808>
>>
>>2.6.14-mm2 +
>>ftp://ftp.namesys.com/pub/reiser4-for-2.6/2.6.14-mm2/reiser4-for-2.6.14-mm2
>>-1.patch.gz
>>
>>strace -T -e sync,fsync ./eworm xx
>>fsync(3)                                = 0 <0.005373>
>>
>>Would you please try whether 2.6.14-mm2 with fresh reiser4 update fsyncs
>>better?
>>    
>>
>
>No change, still bad performance: up to 2 seconds in sync(), up to 0.2 seconds 
>in fsync().
>  
>
Unfortunately we are not able to reproduce this slowdown. Would you 
please provide more info?:
Is this 2.6.14-mm2 bad sync/fsync performance reproducible on fresh 
created reiser4 too?
Are these values stable reproducible? If you run this test several time 
-- do you have the same results?
Would you please send df -T output and 2.6.14-mm2 config file?
Did you try this test on ext2? If no -- would you please try it on ext2 
for the same kernels and send us the results?

Thanks,
Lena
 

