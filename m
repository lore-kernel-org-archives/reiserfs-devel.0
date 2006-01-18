From: "Giovanni A. Orlando" <gorlando@futuretg.com>
Subject: Re: A question: May Reiser4 be equivalent to Reiser3 with some flag/plugin
 ...
Date: Wed, 18 Jan 2006 18:43:50 +0000
Message-ID: <43CE8C66.3090200@futuretg.com>
References: <e50d039c0601061010k51b103e4qb799090d52e7b744@mail.gmail.com> <13dbb67f0601070441q559b156ep@mail.gmail.com> <43C2A9D8.80103@namesys.com> <200601092001.17684.marcel@hilzinger.hu> <43CDFC25.90401@futuretg.com> <43CE7D93.7090304@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27786-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <43CE7D93.7090304@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Hans Reiser <reiser@namesys.com>
Cc: reiserfs-list@namesys.com

Hans Reiser wrote:

>Giovanni A. Orlando wrote:
>
>  
>
>>Hi,
>>
>>   Looking the http://linuxgazette.net/122/TWDT.html#piszcz article, I
>>see that
>>   in some cases ReiserFS 3.X is better than Reiser4.
>>
>>   Correct me if I am wrong. High numbers means poor, more delay.
>>
>>   Now, because we plan to support both: Reiser3 and Reiser4 in our OS,
>>   we plan to know if there are some system the Reiser3 performance
>>   may become available for Reiser4.
>>
>>   Reiser4 is superior but seems that with full security enabled
>>logically
>>   the system may delay.
>>
>>   Basically, my question may be re-posted like: "I know Reiser4 is
>>   different than Reiser3, but may the Reiser4 performance may be
>>superior
>>   all the time, doing some update?
>>
>>Thanks,
>>Giovanni.
>> 
>>    
>>
>
>Please understand that that benchmark was so poorly done that it will
>have to be repeated by us and fixed before it can have any diagnostic
>meaning at all.  We may indeed learn things from it, but what we will
>learn we still have no idea of at this time.
>
>V3 is faster for highly synchronous workloads.  V4 smokes it in pretty
>much all other measures.  Given time, V4 will become fast at synchronous
>workloads.
>
>Hans
>
>  
>
Good!

Thanks, Giovanni


-- 
-- 

Check FT Websites ... http://www.futuretg.com  - ftp://ftp.futuretg.com
http://www.FTLinuxCourse.com
    http://www.FTLinuxCourse.com/Certification
http://www.RPMParadaise.org
http://www.GiovanniOrlando.com


Fixed Europe:  +39 0824 314 007.
Global Mobile: +39 393 665 4239  (does not work if I am in Caracas).
Global Venezuelan Mobile: +58 412 55 41 338.


-- 

