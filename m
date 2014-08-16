From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: reiser4: FITRIM ioctl -- how to grab the space?
Date: Sat, 16 Aug 2014 22:13:32 +0200
Message-ID: <53EFBB6C.6010703@gmail.com>
References: <3405506.BC0S4TX54B@intelfx-laptop> <2295734.UIR3OjHuyC@intelfx-laptop> <53EF5E2E.6000109@gmail.com> <2229007.oN40ML3YOA@intelfx-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=SHdorKR3MJjtP5IlC0Tc5HocBCnQK82q3+LjlryrrNQ=;
        b=RyfjOazgQ0g9VqhNjweX2drDESaiQ1gNCBNim6L3glKjce1i1nrETR8UzpKwl78UOn
         7pvL4yxVtXgiK2uB5Su+o+jvNloEfcg7fF9Jnyf+jUmC+XsDG6j3lo9dtlGlX/KXJuOb
         lihlEcrq3pJwX9dZWnfbhpkI9iBUZDu+VoLLZ1g68ms2hhStNaj6A31u7Opff9HW+bgz
         WsMFbYqODaiGV0jzbbeWbhLnsNU1ircvl4v3gT/+Z00C+zLytbRASQ0lags7ucyMEHWP
         OxYiJLXmT2NyLqQMZa1VZUU3txBiYS30Gi2Zn10FAcbexdsJRLhMzp24BBjpHCPZlbZd
         xryA==
In-Reply-To: <2229007.oN40ML3YOA@intelfx-laptop>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ivan Shapovalov <intelfx100@gmail.com>
Cc: reiserfs-devel@vger.kernel.org


On 08/16/2014 07:05 PM, Ivan Shapovalov wrote:
> On Saturday 16 August 2014 at 15:35:42, Edward Shishkin wrote:	
>> On 08/16/2014 01:27 PM, Ivan Shapovalov wrote:
>>> On Saturday 16 August 2014 at 10:23:08, Edward Shishkin wrote:	
>>>> [...]
>>>>>> So I need to find a way to take rwsem in a read-biased mode... Any
>>>>>> advice is
>>>>>> accepted, including "give up with adding of yet another lock and go with
>>>>>> multiple transactions" :)
>>>>> IMHO this is too complicated.
>>>>>
>>>>> Why don't you want to grab, say, 20M per iteration?
>>>>> It should work without any problems, just maintain a
>>>>> counter of blocks allocated in the iteration..
>>> I see it mostly like a "good to have" thing.
>>
>> Nop, we discuss the reasonable implementation of the "must have" -
>> space reservation by the fitrim process..
>>
>>
>>>    When the system is under load,
>>> FITRIM implemented in this "simple" way will be ineffective: it will miss
>>> some blocks that are temporarily allocated (journal, etc.)
>>
>> It will be perfectly discarded by the realtime discard
>>
>>
>>>    even though it is
>>> theoretically possible to stop accepting new transactions, commit all existing
>>> ones and perform discard while the system is artificially made idle, then
>>> resume everything.
>>
>> IMHO complicated and not need.
>> Anyway, missing 2 blocks per device is not critical.
> OK. Giving up then. Let's go the multiple transaction approach.
>
>>
>>> So I've been trying to check if this is feasible. Looks like it isn't.
>>>
>>>> add the counter to the struct reiser4_context and
>>>> set it to zero at the beginning of every iteration.
>>>> use get_current_context() to access the counter.
>>> Is it needed? The simple way is just a loop consisting of
>>> - grab space
>>> - allocate blocks forward from start position (initially 0) until end of
>>>     partition or limit reached
>>> - update start position to `last allocated block + 1`
>>> - put allocated space to the delete set
>>> - mark for force-committing
>>> - reiser4_txn_restart_current()
>>> - if we've reached end of partition earlier, break, otherwise loop
>>>
>>
>> Ok, it will also work (with more iterations, though),
>> well, let's do so..
> More iterations? It seems like I don't really understand your idea
> with the counter.
> Could you please elaborate a bit?


Everything is OK with the number of iterations.
I misunderstood your design in the first reading..

Thanks,
Edward.
