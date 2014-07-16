From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [PATCHv6 3/5] reiser4: discard support: initial implementation
 using linked lists.
Date: Wed, 16 Jul 2014 12:26:52 +0200
Message-ID: <53C6536C.4030507@gmail.com>
References: <1403434126-6390-1-git-send-email-intelfx100@gmail.com> <2160912.yche19jEn0@intelfx-laptop> <53C338DB.7070603@gmail.com> <1467759.jhr2SzDkiE@intelfx-laptop> <53C652BE.4010203@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=iiZjqLm/V5GmpKEreW6wCWh18qYXKqist/fO4U4jYjw=;
        b=qcDDaTkfhzvmD67CG/TW9kgzF6pnmb6/pxdT6ZAyPlQnItDQoEOg+QAVFzi+RGtjyc
         6gBgkBX7XQ0fnd+nFrQQl8G5yw2/GST+lG5VUYU0bFN8try78w2P8+cfyk67kX/oX0sm
         nOoi2A0wuoCeWcB3PaPrDQLDy1GmEGuSo+RdApQlwkjTcpFSKzHNhPqCKCXlJ7M2as62
         ZG5DmEyEemeXzITPc5vMI7jm6+51ML/ghoZ47IPjdUM7/bSTjhFjwYgvKhRRnIOVbsO/
         RtVvPIyX3qIOOxgcikipCowAEaOV1rNas/F7SXAZunW9eXSmhrDadUe2K7CGNRCtCNOe
         YBiw==
In-Reply-To: <53C652BE.4010203@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ivan Shapovalov <intelfx100@gmail.com>
Cc: reiserfs-devel@vger.kernel.org


On 07/16/2014 12:23 PM, Edward Shishkin wrote:
>
> On 07/15/2014 01:42 PM, Ivan Shapovalov wrote:
>> On Monday 14 July 2014 at 03:56:43, Edward Shishkin wrote:
[...]
>>>
>>> Why not to delay the actual deallocation (in the working bitmap)?
>>> Anyway, in the situations of disk space pressure (on the first "soft
>>> ENOSPC")
>>> everyone waits for commit-everything completion. Let's think in this
>>> direction...
>> That's a good idea, actually. Let's outline what is needed for this:
>>
>> - move reiser4_post_commit_hook() after the call to discard;
>
>
> To be precise, not the post_commit_hook itself, only its current content.
>
> Those hooks are undocumented, but I think that
> - pre_commit_hook is something that should be called before journal
>   writes;
> - post_commit_hook is something that should be called after journal
>   writes completion and before overwrites;
> - post_write_back_hook is something that should be called after issuing
>   the overwrites.
>
> I suggest to use the post_write_back_hook for discard with the following
> cleaning working bitmap. Move this hook to suitable place (make sure 
> it is
> after write_tx_back() and journal's "immediate" dealocations).
>
>
>> This will also move it outside of reiser4_write_logs(), after
>> reiser4_post_write_back_hook() and various immediate deallocations 
>> done by the
>> journal code. I suppose this is OK for we're under commit mutex anyway.
>>
>> - defer journal's immediate deallocations until discard.
>>
>> This is more interesting. Inside of the journal code, blocks are 
>> deallocated
>> in four places:
>> * dealloc_tx_list()
>> * dealloc_wmap() -> dealloc_wmap_actor()
>> * add_region_to_wmap() /* in error path */
>> * alloc_tx() /* seems like in error path, len == 0 in case of normal 
>> exit */
>>
>> That is, blocks are deallocated after all meaningful work
>
>
> We want those 4 deallocations to be after pre_commit_hook. In this
> case they won't affect commit bitmap if we make them deferred.
>
>
>>   and so relative
>> order of these deallocations seems to not matter.
>>
>> Given that point 1 is done, i. e. delete_set is applied to WORKING 
>> BITMAP
>> after reiser4_write_logs(), we can simply make these deallocations 
>> deferred
>> (BA_DEFER flag). This way, we also get rid of aux_delete_set.
>
>
> Yes, make reiser4_block_alloc() jump to "defer" branch if discard mode

^reiser4_block_alloc^reiser4_dealloc_blocks

> is on.
>
>
>> The only thing to check is deallocation attributes. All journal's 
>> deallocations
>> are done with target_stage == BLOCK_NOT_COUNTED. This happily 
>> coincides with
>> what's done in apply_dset(), so no problems here.
>>
>> Is this correct?
>
> Looks OK.
>
> Thanks,
> Edward.

