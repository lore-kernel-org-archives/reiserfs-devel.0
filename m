From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: reiser4: FITRIM ioctl -- how to grab the space?
Date: Sat, 16 Aug 2014 14:15:29 +0200
Message-ID: <53EF4B61.4080906@gmail.com>
References: <3405506.BC0S4TX54B@intelfx-laptop> <2026408.Yl74NqGZKK@intelfx-laptop> <53EF11C8.20209@gmail.com> <1651199.WS1bpHXlZS@intelfx-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=WUGmCbtvo6iP6yM9KdU8Zc8mQI/vQ2hJmdD9E1Q0GAc=;
        b=pGNbUK7F71Y9Inij8A6gDfUpeFGxg/WMRnwsh+jqs+kBi3ONNRW+xA7IEIB4GkZFdY
         PkPbWrc3MGLi2YK69KZS5s6UGrO/5xpx9fbJIJUfnM8XWWOg43081+T6AtUFIWdsUx7o
         ITdDfy58On1yuR9yEYaq4OiULL2WCVbjmmwZ33FEwfg67Dpo64YTGudI2hfndL0IxZlC
         B4qi/ETnQXwGNbAW8iyjvLhTm6NoF9Cf+EN8xhhPCxxyq5md2ieyOqkovPPy5PtZr/d6
         mjo8UB4vBoAx6p2GWqYM0uARAaBqmyWwh8i9o63UF6PNkjq6JzasrpQH30q0fW1v5ZDq
         8VaA==
In-Reply-To: <1651199.WS1bpHXlZS@intelfx-laptop>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ivan Shapovalov <intelfx100@gmail.com>
Cc: reiserfs-devel@vger.kernel.org


On 08/16/2014 01:17 PM, Ivan Shapovalov wrote:
> On Saturday 16 August 2014 at 10:09:44, Edward Shishkin wrote:	
>> On 08/16/2014 02:44 AM, Ivan Shapovalov wrote:
>>> On Monday 11 August 2014 at 13:39:12, Ivan Shapovalov wrote:	
>>>> [...]
>>>>>> I've meant "grabbing all space and then allocating all space" -- so there won't
>>>>>> be multiple grabs or multiple atoms.
>>>>>>
>>>>>> Then all processes grabbing space with BA_CAN_COMMIT will wait for the discard
>>>>>> atom to commit.
>>>>> It seems such waiting will screw up the system. No?
>>>> I was afraid of such situations, but how would that happen? The discard atom's
>>>> commit will always be able to proceed as it doesn't grab space at all.
>>>>
>>>>>>     (Actually, there is a small race window between grabbing space
>>>>>> and creating an atom...)
>>>>> Which one?
>>>> BA_CAN_COMMIT machinery does wait only for atoms, not for contexts. If
>>>> process X happens to grab space between us grabbing space and creating an atom,
>>>> it will get -ENOSPC even with BA_CAN_COMMIT.
>>
>> I still don't see any "races" here. How atom creation is related to grabbing
>> space? Are we talking about races in the existing code? f so, please show
>> the racing paths..
> Well, this is not a race per se - it does not involve locking. But it is
> a race-like behavior.
>
> taskA                                 taskB
> --------------------------------------------------------------------------
> grab very much space

Ok, assume A wants X blocks.

>                                          grab some space with BA_CAN_COMMIT

Assume B wants Y blocks.

> create an atom using the grabbed space


Please, specify which code is executing at this point.

Anyway, we don't need any reservation to _create_ an atom.
Reservation is expended when allocating blocks on the low level
(bitmaps). Reservation (grabbing space) is needed to avoid hard
ENOSPC (=no free bits in bitmaps) in situation, when we can not
fail (e.g. flush, commit, etc..,)


>
> In this case, the taskB's grab will fail though it could wait for taskA's
> not yet created atom.


I still don't see why somebody should fail if X+Y < free-space-on-disk.
If X+Y > free-space, then yes, someone will fail, and it is correct.
