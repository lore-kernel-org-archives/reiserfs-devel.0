From: Hans Reiser <reiser@namesys.com>
Subject: Re: 2 Terabyte install
Date: Wed, 12 May 2004 09:59:06 -0700
Message-ID: <40A257DA.2010903@namesys.com>
References: <409AC2FF.7080800@lindows.com> <1083917932.14089.281.camel@tribesman.namesys.com> <409BB690.6030604@namesys.com> <409BBDC9.3030809@lindows.com> <409FB387.8080804@namesys.com> <40A19147.4010703@lindows.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18631-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <40A19147.4010703@lindows.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Clifford Beshers <clifford.beshers@lindows.com>
Cc: Vladimir Saveliev <vs@namesys.com>, Reiserfs mail-list <Reiserfs-List@namesys.com>, Vitaly Fertman <vitaly@namesys.com>

Clifford Beshers wrote:

> Thanks for the help everyone.  In the end, it turned out that sfdisk 
> is indeed the culprit.  We created a 2.1T partition with fdisk, then 
> asked sfdisk for the size and it said: -92,xxx,xxx.  Unfortunately, 
> this means we have to either fix it or find an alternate solution to 
> creating partitions.

We can probably fix it for you if you like....

>   If the word ``parted'' is on the tip of your tongue  I'll bet you 
> haven't actually used the thing...
>
> There were a few bugs of ours that acted as red herrings, but Linspire 
> is now up and running on this system with ReiserFS 3 and kernel 2.6.5.
>
> While I'm here, I have some other questions:
>
>     * What is the time complexity of mounting a ReiserFS partition? 
>       It seems to be proportional to the size of the partition?  Is it
>       different for Reiser4?
>     * Is there a tool to determine the type of file system on a
>       partition without mounting it?
>
is the time a problem in practice, or just a curiousity point?

> Cliff
>
> Hans Reiser wrote:
>
>> Clifford Beshers wrote:
>>
>>> Thanks Hans, but no need.  I found the page in the FAQ about three 
>>> minutes after I posted.  I get so used to google finding me the 
>>> right things, I occasionally forget to just go to the place I know 
>>> should have the answers.
>>>
>>> So far, I know that sfdisk choked on creating the partition, but 
>>> that fdisk succeeded.  After that the install proceeded normally, 
>>> but the system didn't reboot.  I have to go get details on why, but 
>>> my guessis either lilo or a missing module in the initrd.
>>
>>
>> If you want us to research the problem source for you further, let us 
>> know.  Be  suspicious of the device driver....
>>
>>>
>>> Hans Reiser wrote:
>>>
>>>> Vladimir Saveliev wrote:
>>>>
>>>>> Hello
>>>>>
>>>>> On Fri, 2004-05-07 at 02:58, Clifford Beshers wrote:
>>>>>  
>>>>>
>>>>>> What are the current size limitations for 
>>>>>> disks/partitions/filesystems
>>>>>> with the following combinations?  My googling has produced
>>>>>> inconsistent answers.
>>>>>>        { linux 2.4.24, linux 2.6.5 } X { reiserfs3, reiser4 }
>>>>>>   
>>>>>
>>>>>
>>>>>
>>>>>
>>>>> http://namesys.com/faq.html#reiserfsspecs
>>>>>
>>>>>  
>>>>>
>>>>>> We have a new machine with a 3-ware 8 port controller (looks like a
>>>>>> scsi controller to the system, but actually drives 8 ide 
>>>>>> drives).  We
>>>>>> have 8 x 300GB drives attached for a total > 2TB.
>>>>>>
>>>>>> Our IT guy has been unable to install Linspire on it (linux 2.6.5,
>>>>>> reiserfs3).  I'm about to go look in more detail, but I thought I'd
>>>>>> find out what the bounds were for sure.
>>>>>>
>>>>>>   
>>>>>
>>>>>
>>>>>
>>>>>
>>>>> I assume mkreiserfs was not the reason why you guys failed to install
>>>>> linux on your hardware. It works for > 2tb devices.
>>>>>
>>>>>  
>>>>>
>>>>>> Thanks,
>>>>>>
>>>>>> Cliff
>>>>>>
>>>>>> -- 
>>>>>>
>>>>>> This message contains information which may be confidential and 
>>>>>> privileged. Unless you are the addressee (or authorized to 
>>>>>> receive for the addressee), you may not use, copy or disclose to 
>>>>>> anyone the message or any information contained in the message. 
>>>>>> If you have received the message in error, please advise the 
>>>>>> sender and delete the message.  Thank you.
>>>>>>   
>>>>>
>>>>>
>>>>>
>>>>>
>>>>>
>>>>>
>>>>>  
>>>>>
>>>> Please provide exact answer to this question about what are V3 
>>>> limits.  Vitaly, please assist.
>>>
>>>
>>>
>>>
>>>
>>>
>>

