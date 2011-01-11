From: sh@keff.org
Subject: Re: Negative blocks in rebuild-tree
Date: Tue, 11 Jan 2011 20:42:17 +0100
Message-ID: <4D2CB299.60703@keff.org>
References: <4D28674A.60603@keff.org> <4D290828.8050304@gmail.com> <4D2A2B4D.9010906@suse.com> <4D2CAF0F.5070806@keff.org> <4D2CAFEF.8060309@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <4D2CAFEF.8060309@suse.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jeff Mahoney <jeffm@suse.com>
Cc: Edward Shishkin <edward.shishkin@gmail.com>, reiserfs-devel@vger.kernel.org

Hmm. I don't think this is the same error I got the first time. Then it
was something like '("pass_2: Reading of the block (%lu) failed on the
device 0x%x\n"' (pass2.c).

Then I didn't run the fsck with -S.


On 01/11/11 20:30, Jeff Mahoney wrote:
> On 01/11/2011 02:27 PM, sh@keff.org wrote:
>> Hi
> 
>> On 01/09/11 22:40, Jeff Mahoney wrote:
>>> On 01/08/2011 07:58 PM, Edward Shishkin wrote:
>>>> On 01/08/2011 02:31 PM, Sebastian Hyrwall wrote:
>>>>> Hi
>>>
>>>> Hello.
>>>
>>>>>
>>>>> I am getting a negative block-number with reiserfsck when doing
>>>>> --rebuild-tree -S (or without -S). This causes a segmentation fault
>>>>> later (pass 2) in the check because it tries to read a "non-existant
>>>>> block". My rebuild takes 3 days and i didn't copy the stdout-info the
>>>>> first time so I will post some more info as soon as it becomes available.
>>>>>
>>>>> Pass 0:
>>>>> ####### Pass 0 #######
>>>>> The whole partition (-710934672 blocks) is to be scanned
>>>>> Skipping 117586 blocks (super block, journal, bitmaps)
>>>
>>>
>>>> So you do have a ~16T partition. Correct?
>>>
>>>
>>>>  -711052258 blocks
>>>
>>> This bit isn't bad typing - it's bad printf formatting. The actual bad
>>> typing is going to be harder to track down. A quick look showed me some
>>> signed block count variables in the debugreiserfs code but the fsck code
>>> may be better off. I'll dig into it.
>>>
>>> Since you're trying to reproduce, it would be great if you capture the
>>> core dump that should happen when you seg fault. Exact output would be
>>> useful as well.
>>>
>>> -Jeff
>>>
>> Pass 1 (will try to insert 3472246 leaves):
>> ####### Pass 1 #######
>> Looking for allocable blocks .. finished
>> 0%....20%^[[A....40%....60%..bc ..80%....100%
>> left 0, 62 /sec
>> Flushing..finished
>>         3472246 leaves read
>>                 3457984 inserted
>>                         - pointers in indirect items pointing to
>> metadata 77 (zeroed)
>>                 14262 not inserted
>>         non-unique pointers in indirect items (zeroed) 71213
>> ####### Pass 2 #######
> 
>> Pass 2:
>> 0%bread: Cannot read the block (18446744072169358012): (Invalid
>> argument). /sec
>> bread: Cannot read the block (18446744072169358012): (Invalid argument).
> 
>> gdb
> 
>> Program received signal SIGSEGV, Segmentation fault.
>> 0x000000000042008b in ?? ()
> 
>> ---
>> 18446744072169358012 is pretty close to an unsigned int64.
> 
> This looks like a signed int got sign extended to a long.
> 
>> The coredmp is 1.7GB so I will upload that somewhere soon.. :)
> 
> I don't need the whole core dump for now. Can you load up gdb and do:
> 
> gdb reiserfsck core
> 
> (gdb) bt -full
> 
> .. and send the results?
> 
> Thanks.
> 
> -Jeff
> 
> 
> 
> 
>>>
>>>>> will be read
>>>>>
>>>>> Does anyone have any idea on how to fix this?
>>>>>
>>>>> On a 64-bit system.
>>>
>>>
>>>> It looks like you have encountered an overflow/truncation fsck bug
>>>> specific to giant volumes.
>>>
>>>> I would first ask Jeff: AFAIK he is planning to enable 16T files
>>>> in reiserfs.
>>>> Jeff, do you have any non-published fixups for such problems?
>>>
>>>> Thanks,
>>>> Edward.
>>>
>>>
>>>>>
>>>>> Sincerely,
>>>>> Sebastian H
>>>>> -- 
>>>>> To unsubscribe from this list: send the line "unsubscribe
>>>>> reiserfs-devel" in
>>>>> the body of a message to majordomo@vger.kernel.org
>>>>> More majordomo info at http://vger.kernel.org/majordomo-info.html
>>>
>>>
>>>
> 
> 
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-devel" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

