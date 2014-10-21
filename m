From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [RFC] [PATCHv3 7/9] reiser4: batch discard support: actually
 implement the FITRIM ioctl handler.
Date: Tue, 21 Oct 2014 20:48:59 +0200
Message-ID: <5446AA9B.1080401@gmail.com>
References: <1408312379-1990-1-git-send-email-intelfx100@gmail.com> <3623276.DiI5EXUh1u@intelfx-laptop> <54469F93.8000802@gmail.com> <1599695.kol3gtzCnm@intelfx-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=ukTq1WIUH0P80MoL+GfHqw13KG/cQb4prKrNNkLRZEY=;
        b=LDjYF1rel6Zlu0ZUxa1mwjHkn/3UfgZA0ZKy4Uhsg27DR+gJgRa7UtmmdnO9qBFpSf
         LOLOrokLo6wBuNEnrwf66zqVCVwEZgswij02VuQJkfXOna8tL3sQl/T++Wy9otZq4Bgb
         fWeDXc5o1tQlF2wUjzr40/2gQ5FmrcAm1+sTD8jPxez/Luxtdu7o3lZWYkwEEI0Lic0F
         pDPg/7Q5+pKr8DeGcWW14+bqAoYrqrsEJajmwotjvqwvWSmy3o4GzGPkU6rS7xp3Kqic
         V85ATlsMM3pSVAhfYVR0KoH77hP1qJmniqrHzPwoJ0et15GAHC4qLMTwO+nlXwqzizKo
         fzog==
In-Reply-To: <1599695.kol3gtzCnm@intelfx-laptop>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ivan Shapovalov <intelfx100@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

On 10/21/2014 08:11 PM, Ivan Shapovalov wrote:
> On Tuesday 21 October 2014 at 20:01:55, Edward Shishkin wrote:	
>> On 10/21/2014 06:42 PM, Ivan Shapovalov wrote:
>>> On Tuesday 21 October 2014 at 18:33:11, Edward Shishkin wrote:	
>>>> On 10/21/2014 06:23 PM, Ivan Shapovalov wrote:
>>>>> On Tuesday 21 October 2014 at 18:21:56, Edward Shishkin wrote:	
>>>>>> [...]
>>>>>>
>>>>>> Sorry, but I don't see any explanation.
>>>>> "given a filesystem with (5% + eps) free space left, not using the reserved
>>>>> space will result in trimming of (eps) blocks at a time."
>>>>>
>>>> This is something that I am not able to parse :)
>>>>
>>>> Ok, it is clear, why we can not fail with -ENOSPC when trying to delete
>>>> a file from a full partition, yes?
>>> Sure. Please note that making reiser4_trim_fs's allocations BA_RESERVED will
>>> not hinder this: delete_mutex is there for a reason.
>>
>> Sure, and this is the reason, because when I hear "let's take a mutex",
>> I start to feel bad :)
>>
>>
>>>> I want to see explanation, why FITRIM ioclt can not finish the work when
>>>> there is no free space on disk.
>>> Suppose we do not use reserved space for reiser4_trim_fs's allocations.
>>> Let's analyze those two cases:
>>>
>>> 1. There is <= 5% free space on disk.
>>> Initial grabbing fails, nothing can be trimmed.
>>> This is wrong.
>>>
>>> 2. There is 5% + X (where X is some small number) free space on disk.
>>> We can grab only X blocks at a time, so a total of ((SIZE * 5% / X) + 1)
>>> transactions will be created. BTW, if X < erase unit, nothing can be trimmed.
>>> This is ineffective.
>>>
>>> Hope this makes sense.
>>
>> This is already much better, thanks!
>> Then I should say that the whole idea to reserve % of free space is
>> incorrect.
>> Try to reserve 1% of total partition size with BA_CAN_COMMIT for an
>> iteration.
>> If it fails, then try to reserve 1 block with BA_CAN_COMMIT.
> Hm? Both described cases are still broken.
>
> In #1 (free space <= 5%) nothing changes; reiser4_trim_fs will never be able
> to do its task without using reserved space.
>
> In updated #2 (5% < free space < 6%), a transaction per every block (!)
> will be created, and none of them will trim anything (1 block < erase unit).


If (5% < free_space < 5% + erase_unit), then fail with ENOSPC.
Why not? This is not the unlink case...
