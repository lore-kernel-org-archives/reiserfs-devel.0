From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [PATCH 2/2] reiser4: block_alloc: get rid of discard-related
 hack in reiser4_dealloc_blocks().,
Date: Sun, 07 Sep 2014 14:06:21 +0200
Message-ID: <540C4A3D.6090404@gmail.com>
References: <1408361471-1488-1-git-send-email-intelfx100@gmail.com> <1408361471-1488-3-git-send-email-intelfx100@gmail.com> <5403914E.2050605@gmail.com> <2475166.I97gbrPMvH@intelfx-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=eXP5qIj+IZekxzzvhbxQwTufpnrc8QGFpHtMGQnhyCI=;
        b=0oES6Z2geHZuI1TReIWcF/vnNZrKMDolohAQkRvtBmIP5TYxFvzGcniEa1dbofsL47
         RekgOwJY2OrRYNRGSVBygV+EskQgq1IWDR4lcTECNfoVaRHVFcZAS9k+v0q66fNaIFNC
         G65UZ4lM7nT14U0AJ1nZUBGoIbtgrNoJKUKnsZ3OPU4Yz/vRuWv8+94rj9HpDv3ulMyv
         giYUE1mXv/z+BRWbznFyCtfp2uJ8GnGzUqq65jAIF2k6npwBUkj/qbaqTPcshSIlJ2sP
         EKuS2haxTCc4hARMLQq6CX2GhRtqaZrVOKdQ1Ayk+BQ35PPgeOCFV3tzhy5N1eFuIJTD
         xxtA==
In-Reply-To: <2475166.I97gbrPMvH@intelfx-laptop>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ivan Shapovalov <intelfx100@gmail.com>
Cc: reiserfs-devel@vger.kernel.org


On 09/06/2014 12:33 PM, Ivan Shapovalov wrote:
> On Sunday 31 August 2014 at 23:19:10, Edward Shishkin wrote:	
>> On 08/18/2014 01:31 PM, Ivan Shapovalov wrote:
>>> When discard was enabled, immediate deallocations were made deferred in order
>>> to record these extents in the atom's delete set and, consequently, allow
>>> their discarding.
>>>
>>> However, this is wrong in the following way. Immediate deallocations make use
>>> of target allocation stage and ancillary flags like BA_PERMANENT and BA_FORMATTED.
>>> By converting immediate deallocations to deferred, these flags are essentially
>>> dropped, and application of deferred deallocations in reiser4_post_write_back_hook()
>>> uses an equivalent of BLOCK_NOT_COUNTED stage and BA_FORMATTED flag.
>>>
>>> Dropping this hack does not hinder efficiency of the discard procedure, because
>>> immediate deallocations are now used only to deallocate "just allocated" and not
>>> yet written blocks, which actually do not need to be discarded.
>>
>> The idea to defer every "successful" deallocation regardless of discard
>> support status looks OK, but I don't like the first patch (1/2), so
>> let's try
>> to improve it..
>>
>> So, we want to defer also deallocations in the following 2 places:
>> 1) in  dealloc_tx_list();
>> 2) in dealloc_wmap_actor().
>>
>> Here we should take care about block stages.
>> Let's take a look where and how they were allocated. There are exactly
>> 2 places:
>>
>> a) in get_more_wandered_blocks() with block_stage = BLOCK_GRABBED;
>> b) in alloc_tx() with block_stage = BLOCK_GRABBED.
>>
>> Note, that alloc_blocks() with the stage BLOCK_GRABBED calls
>> grabbed2used(). This is exactly what we want in apply_dset() called by
>> post_write_back_hook.
>>
>> That is, just adding BA_DEFER to (1) and (2) with the patch 2/2 should work.
>> Please, make sure..
> This patchset does it exactly this way.
>
> The first patch does two things:
> - adds BA_DEFER to deallocations in dealloc_tx_list() and dealloc_wmap_actor()
>    (because we really want them deferred);
> - removes BA_FORMATTED from where BA_DEFER is used
>    (this is the thing you don't like).
>
> Let me explain why I've done the second thing. When BA_DEFER is specified,
> BA_FORMATTED is not checked for (there are even no assertions). While it may be
> semantically correct to specify BA_FORMATTED as well in these cases, it is not
> checked for and thus sooner or later we'll get a case when BA_FORMATTED flag is
> missing, and no one will notice that (because it does not influence the system
> behavior). So I've decided to force-expire that moment and preemptively remove
> the flags :)
>
> Of course, you are the maintainer. If you opt for keeping BA_DEFER | BA_FORMATTED
> combination, let's do it this way (but then it would sense to add an assertion).


It can happen, that we'll use BA_FORMATTED flag in deferred deallocations.
So I suggest to not touch it..


>
>> P.S. In (1)-(2) we allocate with stage BLOCK_GRABBED, but in (a)-(b) we
>> deallocate with stage BLOCK_NOT_COUNTED. It can confuse. Let's allocate
>> with stage BLOCK_NOT_COUNTED: from the standpoint of alloc_blocks() it
>> doesn't matter.
> This would be incorrect. The space for allocations in get_more_wandered_blocks()
> and alloc_tx() is already grabbed at the beginning of commit_tx() (see wander.c:1103),
> so these allocations have to be done with stage == BLOCK_GRABBED.


Ok, agreed..

Thanks,
Edward.
