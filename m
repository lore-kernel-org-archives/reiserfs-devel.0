From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [PATCHv6 3/5] reiser4: discard support: initial implementation
 using linked lists.
Date: Mon, 14 Jul 2014 03:56:43 +0200
Message-ID: <53C338DB.7070603@gmail.com>
References: <1403434126-6390-1-git-send-email-intelfx100@gmail.com> <2333335.ugWK4TrHUo@intelfx-laptop> <53C2D82B.7030201@gmail.com> <2160912.yche19jEn0@intelfx-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=jULbUgq/O9WdSS0KZpmbtdqmYMsBx/AIgo57nGFmrCc=;
        b=OQPnksNsw+ni3/6hT/O4/p2LlFb683pTQQ1bZbmqOjqOEfOKqb4yoxcWD/mAoNQDD2
         Wrh9B9v1PZ4M6IvabS/meRJxuYnWFl4Bhh/8REq3vUOAnwHvbV7dswq0c0n23Jr8dkNG
         UQMbL7qLf6CtH3lIGGQPYVclvvoL1X6NMZo28IPMDyTwaz/FfKSHYO467hNh57OYOM61
         SOa/HIjrW/dPyBHIgiUOCEpU3TeEu3mqMjx9onV0Kqr4VzuF5ZICJ2gpor4Xg3am5MNK
         e8w4D2GAPXNVs1BANsvzlz/fvyXDFaR4GA4nEmjmIT+hn8RN2Hczzqs+M1g7ZOy8zALR
         Q+Kg==
In-Reply-To: <2160912.yche19jEn0@intelfx-laptop>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ivan Shapovalov <intelfx100@gmail.com>
Cc: reiserfs-devel@vger.kernel.org


On 07/13/2014 09:18 PM, Ivan Shapovalov wrote:
> On Sunday 13 July 2014 at 21:04:11, Edward Shishkin wrote:	
>> On 07/13/2014 02:47 PM, Ivan Shapovalov wrote:
>>> On Sunday 13 July 2014 at 03:33:57, Edward Shishkin wrote:	
>>>> On 07/09/2014 02:40 PM, Ivan Shapovalov wrote:
>>>>> On Monday 07 July 2014 at 01:47:41, Edward Shishkin wrote:	
>>>>>> On 06/22/2014 12:48 PM, Ivan Shapovalov wrote:
>>>>>> [...]
>>>> [...]
>>>>>>> + * - if a single extent is smaller than the erase unit, then this particular
>>>>>>> + *   extent won't be discarded even if it is surrounded by enough free blocks
>>>>>>> + *   to constitute a whole erase unit;
>>>>>> Why not to discard the aligned and padded extent, which coincides
>>>>>> with the whole erase unit?
>>>>> With a number of whole erase units.
>>>>>
>>>>>>> + * - we won't be able to merge small adjacent extents forming an extent long
>>>>>>> + *   enough to be discarded.
>>>>>> At this point we have already sorted and merged everything.
>>>>>> So may be it makes sense just to check the head and tail of every resulted
>>>>>> extent and discard the aligned and padded one?
>>>>> "Head and tail" is not sufficient. We may check the whole extent with a single
>>>>> bitmap request, but such algorithm will be very inefficient: it will miss many
>>>>> possibilities for discarding.
>>>>>
>>>>> Consider many-block extent, from which one block has been allocated again.
>>>>> In this case we miss (all-1) blocks to be discarded (if granularity = 1 block).
>>>>>
>>>>>> Please, consider such possibility. Iterating over erase units in
>>>>>> discard_extent()
>>>>>> looks suboptimal.
>>>>> Yes, it's costly... but I don't see any other ways to do the task efficiently.
>>>> How about this function?  (the attached patch is against v6-series).
>>>> Total number of bitmap checks is in [N+1, 2N], where N is number of
>>>> extents  in the list. At the same time we don't leave any non-discarded
>>>> "garbage"...
>>>>
>>>> Edward.
>>>> P.S. I tested it, but not enough.
>>> Hm. I'm probably a dumbass, but...
>>>
>>> I don't see where the [start; start+len) region is checked for being free.
>>
>> check_free_blocks() is called for this purpose.
>>
>> Firstly when checking head padding. Secondly in the gluing loop
>> (to glue 2 extents in particular means to make sure that region
>> between them is free). Finally we check if the tail padding is free.
> There are three calls to check_free_blocks():
>
> line 197, check_free_blocks(start - headp, headp)
> This checks first extent's head padding.
>
> line 247, check_free_blocks(end, next_start - end)
> This checks blocks between end of first extent and start of second extent
> (including possible tail padding of first extent and possible head padding
> of second extent).
>
> line 284, check_free_blocks(end, tailp)
> This checks first extent's tail padding.
>
> Nothing seems to call at least check_free_blocks(begin, end)...


Oh, bad... I thought all this time that extents of the delete sets are 
still dirty
in the working bitmap at the moment of discard.
Hmm, I definitely don't want to check the whole extents for discard...

Why not to delay the actual deallocation (in the working bitmap)?
Anyway, in the situations of disk space pressure (on the first "soft 
ENOSPC")
everyone waits for commit-everything completion. Let's think in this 
direction...


>
> BTW, what's the purpose of headp_is_known_dirty?

To avoid unneeded checks.

(end + tailp > next_start) means that the head padding of the next extent
includes the region [end, next_start), which was found dirty (when trying
to glue this next extent).


>   All uses of this variable
> can be compile-time resolved to 0. It is never read after assigned 1.


Yup. Its declaration with the first assignment are at wrong place.
It should be above (near the @pos). I definitely needed to work more
on this function.


>
>>
>>> Also, btw, do we need to cut the head (lines 155-163 of the patch) if headp
>>> is empty? It seems that it would reduce extent by one whole erase unit
>>> without any justification.
>>
>> Yes, this is definitely a leak of not discarded erase units.
>> Is the attached version better?
> Yes.. and lines 290-295, seems that tail padding handling has the same problem.
> If tailp == 0 (i. e. division remainder is 0 so that end is already aligned),

OK, will be fixed in the same way.

Thanks,
Edward.
