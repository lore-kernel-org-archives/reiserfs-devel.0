From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [RFC] [PATCHv3 7/9] reiser4: batch discard support: actually
 implement the FITRIM ioctl handler.
Date: Tue, 21 Oct 2014 20:01:55 +0200
Message-ID: <54469F93.8000802@gmail.com>
References: <1408312379-1990-1-git-send-email-intelfx100@gmail.com> <44201008.TshRq3mBYC@intelfx-laptop> <54468AC7.3040107@gmail.com> <3623276.DiI5EXUh1u@intelfx-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=Yk1NLtfim6uIgu1M4Ufqoj2gSHnwZe7YdMtJGzERnfM=;
        b=Tk2YKjDdSvCMTD4G9v4FTkmIBfJji3X6ssyAQaoOCBxuxH5FM5XZrdZww6gzgc3Gwm
         LhO3m3HGBnR/NCiW9ZSQGHDy5yLvrGNexgX4L5qp1P6chZZ/qanBzaYg4mZGCJNVF318
         PHhf+7uDVswYY9SmkDS6mWe5bLyphXOGkz+G4GZJaFKGq5pW9GsJ04mV70mq4krEEjhP
         ffUupNV6MOjcddeH46l2sTBwF2j8z/bczEtiwRFhsNxHZQ6C+DWm6R9PFqsJ7hFik3vJ
         MzRPkeAsSJX9Yjl+WeAx5roJ7BhHDz4mDBOjq21O5T6D3OwnZPmeDW3+vuKOiKAjQIrV
         JUyA==
In-Reply-To: <3623276.DiI5EXUh1u@intelfx-laptop>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ivan Shapovalov <intelfx100@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

On 10/21/2014 06:42 PM, Ivan Shapovalov wrote:
> On Tuesday 21 October 2014 at 18:33:11, Edward Shishkin wrote:	
>> On 10/21/2014 06:23 PM, Ivan Shapovalov wrote:
>>> On Tuesday 21 October 2014 at 18:21:56, Edward Shishkin wrote:	
>>>> [...]
>>>>
>>>> Sorry, but I don't see any explanation.
>>> "given a filesystem with (5% + eps) free space left, not using the reserved
>>> space will result in trimming of (eps) blocks at a time."
>>>
>>
>> This is something that I am not able to parse :)
>>
>> Ok, it is clear, why we can not fail with -ENOSPC when trying to delete
>> a file from a full partition, yes?
> Sure. Please note that making reiser4_trim_fs's allocations BA_RESERVED will
> not hinder this: delete_mutex is there for a reason.


Sure, and this is the reason, because when I hear "let's take a mutex",
I start to feel bad :)


>
>> I want to see explanation, why FITRIM ioclt can not finish the work when
>> there is no free space on disk.
> Suppose we do not use reserved space for reiser4_trim_fs's allocations.
> Let's analyze those two cases:
>
> 1. There is <= 5% free space on disk.
> Initial grabbing fails, nothing can be trimmed.
> This is wrong.
>
> 2. There is 5% + X (where X is some small number) free space on disk.
> We can grab only X blocks at a time, so a total of ((SIZE * 5% / X) + 1)
> transactions will be created. BTW, if X < erase unit, nothing can be trimmed.
> This is ineffective.
>
> Hope this makes sense.


This is already much better, thanks!
Then I should say that the whole idea to reserve % of free space is 
incorrect.
Try to reserve 1% of total partition size with BA_CAN_COMMIT for an 
iteration.
If it fails, then try to reserve 1 block with BA_CAN_COMMIT.

Thanks,
Edward.
