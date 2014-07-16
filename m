From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [PATCHv6 3/5] reiser4: discard support: initial implementation
 using linked lists.
Date: Wed, 16 Jul 2014 12:23:58 +0200
Message-ID: <53C652BE.4010203@gmail.com>
References: <1403434126-6390-1-git-send-email-intelfx100@gmail.com> <2160912.yche19jEn0@intelfx-laptop> <53C338DB.7070603@gmail.com> <1467759.jhr2SzDkiE@intelfx-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=HaXzS83vNuDueffJyeI1LCATYbGyKb4UhV8hiYRrP6c=;
        b=KgwwGiJR8aPi+XECkCQbLBB2YJUPGLAkXu+zzcnVdBPOmzoPehS0fCmS74kmxJy7NN
         cr19fABuiPgkfikgH4knkk6z0uI6Ap5AdWJIG9NSZmbPa1/zjsL4MTU2FenzzzAwLZHK
         RNS2eJ7WREPKfZEj9JFfzbdyvG4XgQuO4lCdVEBsRb6Djzq05FI/UDEWxHlvGE2S3QfS
         rGE1qBBY+oIrbgaEvA83Ag13W0JVK/gcg038RLIV4uXXlrziooTWIH+sWSYiqMRWKVh8
         n0x1QnicssxW1AZpPJLQkxrkeOQ5Ely08wIPsaDUPUgBXXmqX/hXtaE70CS58LoVMrQF
         /8gw==
In-Reply-To: <1467759.jhr2SzDkiE@intelfx-laptop>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ivan Shapovalov <intelfx100@gmail.com>
Cc: reiserfs-devel@vger.kernel.org


On 07/15/2014 01:42 PM, Ivan Shapovalov wrote:
> On Monday 14 July 2014 at 03:56:43, Edward Shishkin wrote:	
>> On 07/13/2014 09:18 PM, Ivan Shapovalov wrote:
>>> On Sunday 13 July 2014 at 21:04:11, Edward Shishkin wrote:	
>>>> On 07/13/2014 02:47 PM, Ivan Shapovalov wrote:
>>>>> On Sunday 13 July 2014 at 03:33:57, Edward Shishkin wrote:	
>>>>>> On 07/09/2014 02:40 PM, Ivan Shapovalov wrote:
>>>>>>> On Monday 07 July 2014 at 01:47:41, Edward Shishkin wrote:	
>>>>>>>> On 06/22/2014 12:48 PM, Ivan Shapovalov wrote:
>>>>>>>> [...]
>>>>>> [...]
>>>>>>>>> + * - if a single extent is smaller than the erase unit, then this particular
>>>>>>>>> + *   extent won't be discarded even if it is surrounded by enough free blocks
>>>>>>>>> + *   to constitute a whole erase unit;
>>>>>>>> Why not to discard the aligned and padded extent, which coincides
>>>>>>>> with the whole erase unit?
>>>>>>> With a number of whole erase units.
>>>>>>>
>>>>>>>>> + * - we won't be able to merge small adjacent extents forming an extent long
>>>>>>>>> + *   enough to be discarded.
>>>>>>>> At this point we have already sorted and merged everything.
>>>>>>>> So may be it makes sense just to check the head and tail of every resulted
>>>>>>>> extent and discard the aligned and padded one?
>>>>>>> "Head and tail" is not sufficient. We may check the whole extent with a single
>>>>>>> bitmap request, but such algorithm will be very inefficient: it will miss many
>>>>>>> possibilities for discarding.
>>>>>>>
>>>>>>> Consider many-block extent, from which one block has been allocated again.
>>>>>>> In this case we miss (all-1) blocks to be discarded (if granularity = 1 block).
>>>>>>>
>>>>>>>> Please, consider such possibility. Iterating over erase units in
>>>>>>>> discard_extent()
>>>>>>>> looks suboptimal.
>>>>>>> Yes, it's costly... but I don't see any other ways to do the task efficiently.
>>>>>> How about this function?  (the attached patch is against v6-series).
>>>>>> Total number of bitmap checks is in [N+1, 2N], where N is number of
>>>>>> extents  in the list. At the same time we don't leave any non-discarded
>>>>>> "garbage"...
>>>>>>
>>>>>> Edward.
>>>>>> P.S. I tested it, but not enough.
>>>>> Hm. I'm probably a dumbass, but...
>>>>>
>>>>> I don't see where the [start; start+len) region is checked for being free.
>>>> check_free_blocks() is called for this purpose.
>>>>
>>>> Firstly when checking head padding. Secondly in the gluing loop
>>>> (to glue 2 extents in particular means to make sure that region
>>>> between them is free). Finally we check if the tail padding is free.
>>> There are three calls to check_free_blocks():
>>>
>>> line 197, check_free_blocks(start - headp, headp)
>>> This checks first extent's head padding.
>>>
>>> line 247, check_free_blocks(end, next_start - end)
>>> This checks blocks between end of first extent and start of second extent
>>> (including possible tail padding of first extent and possible head padding
>>> of second extent).
>>>
>>> line 284, check_free_blocks(end, tailp)
>>> This checks first extent's tail padding.
>>>
>>> Nothing seems to call at least check_free_blocks(begin, end)...
>> Oh, bad... I thought all this time that extents of the delete sets are
>> still dirty
>> in the working bitmap at the moment of discard.
>> Hmm, I definitely don't want to check the whole extents for discard...
>>
>> Why not to delay the actual deallocation (in the working bitmap)?
>> Anyway, in the situations of disk space pressure (on the first "soft
>> ENOSPC")
>> everyone waits for commit-everything completion. Let's think in this
>> direction...
> That's a good idea, actually. Let's outline what is needed for this:
>
> - move reiser4_post_commit_hook() after the call to discard;


To be precise, not the post_commit_hook itself, only its current content.

Those hooks are undocumented, but I think that
- pre_commit_hook is something that should be called before journal
   writes;
- post_commit_hook is something that should be called after journal
   writes completion and before overwrites;
- post_write_back_hook is something that should be called after issuing
   the overwrites.

I suggest to use the post_write_back_hook for discard with the following
cleaning working bitmap. Move this hook to suitable place (make sure it is
after write_tx_back() and journal's "immediate" dealocations).


> This will also move it outside of reiser4_write_logs(), after
> reiser4_post_write_back_hook() and various immediate deallocations done by the
> journal code. I suppose this is OK for we're under commit mutex anyway.
>
> - defer journal's immediate deallocations until discard.
>
> This is more interesting. Inside of the journal code, blocks are deallocated
> in four places:
> * dealloc_tx_list()
> * dealloc_wmap() -> dealloc_wmap_actor()
> * add_region_to_wmap() /* in error path */
> * alloc_tx() /* seems like in error path, len == 0 in case of normal exit */
>
> That is, blocks are deallocated after all meaningful work


We want those 4 deallocations to be after pre_commit_hook. In this
case they won't affect commit bitmap if we make them deferred.


>   and so relative
> order of these deallocations seems to not matter.
>
> Given that point 1 is done, i. e. delete_set is applied to WORKING BITMAP
> after reiser4_write_logs(), we can simply make these deallocations deferred
> (BA_DEFER flag). This way, we also get rid of aux_delete_set.


Yes, make reiser4_block_alloc() jump to "defer" branch if discard mode
is on.


> The only thing to check is deallocation attributes. All journal's deallocations
> are done with target_stage == BLOCK_NOT_COUNTED. This happily coincides with
> what's done in apply_dset(), so no problems here.
>
> Is this correct?

Looks OK.

Thanks,
Edward.
