From: "Dr. Giovanni A. Orlando" <gorlando@futuretg.com>
Subject: Re: AS performance with reiser4 on 2.6.3
Date: Fri, 27 Feb 2004 11:43:42 +0100
Message-ID: <403F1F5E.9000704@futuretg.com>
References: <200402261748.i1QHmJE12429@mail.osdl.org> <16446.13520.5837.193556@laputa.namesys.com> <403EBB87.2070504@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16959-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <403EBB87.2070504@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Cc: markw@osdl.org, Carl Johnson <cjohnson@osdl.org>, Hans Reiser <reiser@namesys.com>, reiserfs-list@namesys.com, linux-kernel@vger.kernel.org

Dear Mark,

    I appreciate the OSDL efforts and graphs you offer for ReiserFS 4, 
but I will
    appreciate a lot more if you adopt a distro that adopt ReiserFS 
like: SuSE, Lindows or our FTOSX.

    For us ReiserFS is important for RedHat really don't.

    So, I don't want to see again the RedHat 9, name here:
       http://developer.osdl.org/markw/fs/dbt2_stp_results.html

Thanks very much,
Giovanni

> Nikita Danilov wrote:
>
>> markw@osdl.org writes:
>> > Hi Nick,
>> > > I started getting some results with dbt-2 on 2.6.3 and saw that 
>> reiser4
>> > is doing a bit worse with the AS elevator.  Although reiser4 wasn't
>> > doing well to begin with, compared to the other filesystems.  I have
>> > links to the STP results on our 4-ways and 8-ways here:
>> >     http://developer.osdl.org/markw/fs/dbt2_stp_results.html
>>
>> There were no changes between 2.6.2 and 2.6.3 that could affect reiser4
>> performance, so it is not clear why numbers are so different. Probably
>> results should be averaged over several runs.
>>
> The differences don't "feel" like testing error, and in any event 
> something is seriously wrong.  That something is either poor fsync 
> performance, or poor scalability.  In any event, please investigate, 
> and please try such things as using capture on copy.  Mark, does this 
> benchmark like to use fsync?
>
> Thanks much mark for bringing this to our attention.
>
>> Also can you run test with
>>
>> http://www.namesys.com/snapshots/2004.02.25/extra/e_05-proc-sleep.patch
>>
>> applied? To use it turn CONFIG_PROC_SLEEP on (depends on
>> CONFIG_FRAME_POINTER), and do "cat /proc/sleep" before and after test
>> run.
>>
>> > > -- > Mark Wong - - markw@osdl.org
>>
>> Nikita.
>> -
>> To unsubscribe from this list: send the line "unsubscribe 
>> linux-kernel" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>> Please read the FAQ at  http://www.tux.org/lkml/
>>
>>
>>  
>>
>
>

