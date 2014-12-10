From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [PATCHv2 0/3] reiser4: space grabbing fixes.
Date: Wed, 10 Dec 2014 22:51:41 +0100
Message-ID: <5488C06D.4070401@gmail.com>
References: <1414048685-4224-1-git-send-email-intelfx100@gmail.com> <5497656.EllimmOa76@intelfx-laptop> <548841F8.4010409@gmail.com> <2450127.6MNmFpgyTD@intelfx-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=eVzatNYh7vUKaEyxKBSpGBuaM+h8zgbnmTihSOqPUMw=;
        b=krnSnotWMcFOuKFGOqVnIYk0kL1Ha6ZFbfX5OQa27Mqiuk0VhAG9onzzs86UDRbXFF
         i+haC8vpzKjzzHQSBPo03iz+BkqfNRfhf8MCaGci3nX9L8r5qhmzQGaYZ1PzWF68/FmX
         OtxTWKQE9/vyyTMf1z3XzlpupSfvLmCY0VvlzN6mYe+56jkdgen81aKAUeNGiCfme0Eq
         /KlJHtoG968aUuOYk9tmXV9jfNbvhpGwMf5gFJysSaNHplla4viMiD9o8UogiBE+C4Zk
         EpWIzd8zaePlFbWNZYKFVgMhf+m11wKcslozsHhTzZTYBYQwFJs6rlzC21OuLLbmcSNL
         HKEw==
In-Reply-To: <2450127.6MNmFpgyTD@intelfx-laptop>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ivan Shapovalov <intelfx100@gmail.com>
Cc: reiserfs-devel@vger.kernel.org


On 12/10/2014 02:30 PM, Ivan Shapovalov wrote:
> On Wednesday 10 December 2014 at 13:52:08, Edward Shishkin wrote:	
>> On 12/10/2014 01:27 PM, Ivan Shapovalov wrote:
>>> On Thursday 23 October 2014 at 11:18:02, Ivan Shapovalov wrote:	
>>>> These are mostly equivalent transformations (aside from the first patch)
>>>> I've done when I was experimenting with rwsems at zero-th iteration of
>>>> batch discard support.
>>>>
>>>> v2: - disable grab in current context unconditionally, not only if !BA_FORCE
>>>>
>>>> Ivan Shapovalov (3):
>>>>     reiser4: block_alloc: improve error handling in reiser4_grab_reserved().
>>>>     reiser4: block_alloc: sanitize grab_enabled modifications.
>>>>     reiser4: do not mess with grab_enabled; instead, use BA_FORCE.
>>>>
>>>>    fs/reiser4/block_alloc.c                 | 57 +++++++++++++++++---------------
>>>>    fs/reiser4/plugin/file/file.c            | 12 +++----
>>>>    fs/reiser4/plugin/file/file_conversion.c |  3 +-
>>>>    fs/reiser4/plugin/file/tail_conversion.c | 11 +++---
>>>>    fs/reiser4/plugin/item/extent_file_ops.c |  3 +-
>>>>    fs/reiser4/plugin/item/tail.c            |  3 +-
>>>>    fs/reiser4/safe_link.c                   |  4 +--
>>>>    7 files changed, 44 insertions(+), 49 deletions(-)
>>> ping, what's the status?
>>
>> This is in "upstream" already.
> Hm.. I didn't see it..
>
> Well, then a follow-up fix should be applied, as described in one of previous
> messages, or this should be reverted.


With that patch things looked better and you promised
"equivalent transform". OK, I'll roll it back then.

Thanks,
Edward.


>
>>> /*
>>> I'll send another round of discard patches shortly... That is, once I figure
>>> out how to explain in comments the sheer amount of happily coinciding subtle
>>> details, whose coincidence makes everything actually work. :/
>>
>> Note, that basic discard stuff is also in "upstream".
>> So, please, make sure that your patches are "re-based"
> Yes, I'll ensure that everything can be applied cleanly.
>
>>> BTW, could you please check that I've rebased your "precise discard" patch
>>> correctly?
>>> https://github.com/intelfx/linux/commit/47f27446d5ae7b796a842735811c48cc07615dd6
>>> */
>>>
>>
>> I suggest to start with implementing the bitmap primitives that
>> I talked about. Just to avoid extra-work..
> If I understand you correctly, then I've already done that.
>
> But let's first deal with this (current) patchset; it's broken. Sorry for
> creating more problems than solving.
>
> Thanks,

